/*  EQEMu:  Everquest Server Emulator
    Copyright (C) 2001-2009  EQEMu Development Team (http://eqemulator.net)

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; version 2 of the License.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY except by those people which sell it, which
	are required to give you total support for your newly bought product;
	without even the implied warranty of MERCHANTABILITY or FITNESS FOR
	A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/

#include "SecurityLibrary.h"
#include <iostream>
#include <stdio.h>

#ifdef WIN32
	#define EQSecurityLibraryName "EQEmuAuthCrypto"
#else
	#define EQSecurityLibraryName "libEQEmuAuthCrypto.so"
	#include <dlfcn.h>
    #define GetProcAddress(a,b) dlsym(a,b)
	#define LoadLibrary(a) dlopen(a, RTLD_NOW) 
	#define  FreeLibrary(a) dlclose(a)
	#define GetLastError() dlerror()
#endif

SecurityLibrary::SecurityLibrary()
{
	hDLL = NULL;
	EncryptFunc = NULL;
	DecryptFunc = NULL;
}

SecurityLibrary::~SecurityLibrary()
{
	if(Loaded())
		Unload();
}

bool SecurityLibrary::Load(const char *name)
{
#ifdef WIN32
	SetLastError(0);
	hDLL = LoadLibrary(name);

#else
	hDLL = LoadLibrary(name);
#endif
	
	if(!hDLL) {
		const char *load_error = GetError();

		std::cout << "[Error] Load of Security Library '" << name << "' failed:" << std::endl;
		if(load_error)
		{
			std::cout << load_error << std::endl;
		}
		else
		{
			std::cout << "No error reported" << std::endl;
		}
		return false;
	}
#ifdef WIN32
    else 
	{ 
		SetLastError(0); 
	}
#endif
	
	return(true);
}

void SecurityLibrary::Unload() {
	if (hDLL != NULL) {
		FreeLibrary(hDLL);
#ifndef WIN32
		const char* error;
		if ((error = GetError()) != NULL)
			fprintf(stderr, "FreeLibrary() error = %s", error);
#endif
		hDLL = NULL;
	}
}

void *SecurityLibrary::GetSym(const char *name) {
	if (!Loaded())
		return(NULL);
	
	void *r = GetProcAddress(hDLL, name);

	if(GetError() != NULL)
		r = NULL;

	return(r);
}

bool SecurityLibrary::GetSym(const char *name, void **sym)
{
	bool result=false;
	if (Loaded()) {
		*sym = GetProcAddress(hDLL, name);
		result= (GetError() == NULL);
	}

	return result;
}

const char *SecurityLibrary::GetError()
{
#ifdef WIN32
	//not thread safe, dont care.
	static char ErrBuf[128];
	unsigned long err = GetLastError();
	if(err == 0)
		return(NULL);
	sprintf(ErrBuf, "Error #%lu", (unsigned long)err);
	return(ErrBuf);
#else
	return GetLastError();
#endif
}

bool SecurityLibrary::LoadCrypto()
{
	if(!Load(EQSecurityLibraryName))
	{
		return false;
	}
	else
	{
		EncryptFunc = (DLLFUNC_Encrypt)GetSym("Encrypt");
		if(EncryptFunc == NULL)
		{
			printf("SecurityLibrary failed to attach Encrypt()\n");
		}
		DecryptFunc = (DLLFUNC_DecryptUsernamePassword)GetSym("DecryptUsernamePassword");
		if(DecryptFunc == NULL)
		{
			printf("SecurityLibrary failed to attach DecryptUsernamePassword()\n");
		}
		DeleteFunc = (DLLFUNC_HeapDelete)GetSym("_HeapDeleteCharBuffer");
		if(DeleteFunc == NULL)
		{
			printf("SecurityLibrary failed to attach _HeapDeleteCharBuffer()\n");
		}
	}
	return true;
}

char *SecurityLibrary::DecryptUsernamePassword(const char* encryptedBuffer, unsigned int bufferSize, int mode)
{
	if(DecryptFunc)
	{
		return DecryptFunc(encryptedBuffer, bufferSize, mode);
	}
	return NULL;
}

char* SecurityLibrary::Encrypt(const char* buffer, unsigned int bufferSize, unsigned int &outSize)
{
	if(EncryptFunc)
	{
		return EncryptFunc(buffer, bufferSize, outSize);
	}
	return NULL;
}

void SecurityLibrary::DeleteHeap(char* buffer)
{
	if(DeleteFunc)
	{
		DeleteFunc(buffer);
	}
}
