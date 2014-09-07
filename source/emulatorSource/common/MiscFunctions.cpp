/*  EQEMu:  Everquest Server Emulator
    Copyright (C) 2001-2002  EQEMu Development Team (http://eqemu.org)

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
#include "../common/debug.h"
#include "MiscFunctions.h"
#include <string.h>
#include <time.h>
#include <math.h>
#ifndef WIN32
#include <netinet/in.h>
#include <sys/socket.h>
#endif
#include <iostream>
#include <iomanip>
#ifdef WIN32
	#include <io.h>
#endif
#include "../common/timer.h"
#include "../common/seperator.h"

using namespace std;

#ifdef WIN32
	#include <windows.h>

	#define snprintf	_snprintf
#if (_MSC_VER < 1500)
	#define vsnprintf	_vsnprintf
#endif
	#define strncasecmp	_strnicmp
	#define strcasecmp  _stricmp
#else
	#include <stdlib.h>
	#include <ctype.h>
	#include <stdarg.h>
	#include <sys/types.h>
	#include <sys/time.h>
#ifdef FREEBSD //Timothy Whitman - January 7, 2003
       #include <sys/socket.h>
       #include <netinet/in.h>
 #endif
	#include <sys/stat.h>
	#include <unistd.h>
	#include <netdb.h>
	#include <errno.h>
#endif

#ifndef va_copy
	#define va_copy(d,s) ((d) = (s))
#endif

void CoutTimestamp(bool ms) {
	time_t rawtime;
	struct tm* gmt_t;
	time(&rawtime);
	gmt_t = gmtime(&rawtime);

    struct timeval read_time;	
    gettimeofday(&read_time,0);

	cout << (gmt_t->tm_year + 1900) << "/" << setw(2) << setfill('0') << (gmt_t->tm_mon + 1) << "/" << setw(2) << setfill('0') << gmt_t->tm_mday << " " << setw(2) << setfill('0') << gmt_t->tm_hour << ":" << setw(2) << setfill('0') << gmt_t->tm_min << ":" << setw(2) << setfill('0') << gmt_t->tm_sec;
	if (ms)
		cout << "." << setw(3) << setfill('0') << (read_time.tv_usec / 1000);
	cout << " GMT";
}

// normal strncpy doesnt put a null term on copied strings, this one does
// ref: http://msdn.microsoft.com/library/default.asp?url=/library/en-us/wcecrt/htm/_wcecrt_strncpy_wcsncpy.asp
char* strn0cpy(char* dest, const char* source, int32 size) {
	if (!dest)
		return 0;
	if (size == 0 || source == 0) {
		dest[0] = 0;
		return dest;
	}
	strncpy(dest, source, size);
	dest[size - 1] = 0;
	return dest;
}

// String N w/null Copy Truncated?
// return value =true if entire string(source) fit, false if it was truncated
bool strn0cpyt(char* dest, const char* source, int32 size) {
	if (!dest)
		return 0;
	if (size == 0 || source == 0) {
		dest[0] = 0;
		return false;
	}
	strncpy(dest, source, size);
	dest[size - 1] = 0;
	return (bool) (source[strlen(dest)] == 0);
}

const char *MakeUpperString(const char *source) {
    static char str[128];
    if (!source)
	    return NULL;
    MakeUpperString(source, str);
    return str;
}

void MakeUpperString(const char *source, char *target) {
    if (!source || !target) {
	*target=0;
        return;
    }
    while (*source)
    {
        *target = toupper(*source);
        target++;source++;
    }
    *target = 0;
}

const char *MakeLowerString(const char *source) {
    static char str[128];
    if (!source)
	    return NULL;
    MakeLowerString(source, str);
    return str;
}

void MakeLowerString(const char *source, char *target) {
    if (!source || !target) {
	*target=0;
        return;
    }
    while (*source)
    {
        *target = tolower(*source);
        target++;source++;
    }
    *target = 0;
}

int MakeAnyLenString(char** ret, const char* format, ...) {
	int buf_len = 128;
    int chars = -1;
	va_list argptr, tmpargptr;
	va_start(argptr, format);
	while (chars == -1 || chars >= buf_len) {
		safe_delete_array(*ret);
		if (chars == -1)
			buf_len *= 2;
		else
			buf_len = chars + 1;
		*ret = new char[buf_len];
		memset(*ret, '\0', buf_len);
		va_copy(tmpargptr, argptr);
#ifdef WIN32
		chars = vsnprintf(*ret, buf_len-1, format, tmpargptr);
#else
		chars = vsnprintf(*ret, buf_len, format, tmpargptr);
#endif
	}
	va_end(argptr);
	return chars;
}

int32 AppendAnyLenString(char** ret, int32* bufsize, int32* strlen, const char* format, ...) {
	if (*bufsize == 0)
		*bufsize = 256;
	if (*ret == 0)
		*strlen = 0;
    int chars = -1;
	char* oldret = 0;
	va_list argptr, tmpargptr;
	va_start(argptr, format);
	while (chars == -1 || chars >= (sint32)(*bufsize-*strlen)) {
		if (chars == -1)
			*bufsize += 256;
		else
			*bufsize += chars + 25;
		oldret = *ret;
		*ret = new char[*bufsize];
		memset(*ret, '\0', *bufsize);
		if (oldret) {
			if (*strlen)
				memcpy(*ret, oldret, *strlen);
			safe_delete_array(oldret);
		}
		va_copy(tmpargptr, argptr);
#ifdef WIN32
		chars = vsnprintf(&(*ret)[*strlen], (*bufsize-*strlen)-1, format, tmpargptr);
#else
		chars = vsnprintf(&(*ret)[*strlen], (*bufsize-*strlen), format, tmpargptr);
#endif
	}
	va_end(argptr);
	*strlen += chars;
	return *strlen;
}

int32 hextoi(char* num) {
	int len = strlen(num);
	if (len < 3)
		return 0;

	if (num[0] != '0' || (num[1] != 'x' && num[1] != 'X'))
		return 0;

	int32 ret = 0;
	int mul = 1;
	for (int i=len-1; i>=2; i--) {
		if (num[i] >= 'A' && num[i] <= 'F')
			ret += ((num[i] - 'A') + 10) * mul;
		else if (num[i] >= 'a' && num[i] <= 'f')
			ret += ((num[i] - 'a') + 10) * mul;
		else if (num[i] >= '0' && num[i] <= '9')
			ret += (num[i] - '0') * mul;
		else
			return 0;
		mul *= 16;
	}
	return ret;
}

int64 hextoi64(char* num) {
	int len = strlen(num);
	if (len < 3)
		return 0;

	if (num[0] != '0' || (num[1] != 'x' && num[1] != 'X'))
		return 0;

	int64 ret = 0;
	int mul = 1;
	for (int i=len-1; i>=2; i--) {
		if (num[i] >= 'A' && num[i] <= 'F')
			ret += ((num[i] - 'A') + 10) * mul;
		else if (num[i] >= 'a' && num[i] <= 'f')
			ret += ((num[i] - 'a') + 10) * mul;
		else if (num[i] >= '0' && num[i] <= '9')
			ret += (num[i] - '0') * mul;
		else
			return 0;
		mul *= 16;
	}
	return ret;
}

bool atobool(char* iBool) {
	if (!strcasecmp(iBool, "true"))
		return true;
	if (!strcasecmp(iBool, "false"))
		return false;
	if (!strcasecmp(iBool, "yes"))
		return true;
	if (!strcasecmp(iBool, "no"))
		return false;
	if (!strcasecmp(iBool, "on"))
		return true;
	if (!strcasecmp(iBool, "off"))
		return false;
	if (!strcasecmp(iBool, "enable"))
		return true;
	if (!strcasecmp(iBool, "disable"))
		return false;
	if (!strcasecmp(iBool, "enabled"))
		return true;
	if (!strcasecmp(iBool, "disabled"))
		return false;
	if (!strcasecmp(iBool, "y"))
		return true;
	if (!strcasecmp(iBool, "n"))
		return false;
	if (atoi(iBool))
		return true;
	return false;
}

sint32 filesize(FILE* fp) {
#ifdef WIN32
	return _filelength(_fileno(fp));
#else
	struct stat file_stat;
	fstat(fileno(fp), &file_stat);
	return (sint32) file_stat.st_size;
/*	int32 tmp = 0;
	while (!feof(fp)) {
		fseek(fp, tmp++, SEEK_SET);
	}
	return tmp;*/
#endif
}

int32 ResolveIP(const char* hostname, char* errbuf) {
#ifdef WIN32
	static InitWinsock ws;
#endif
	if (errbuf)
		errbuf[0] = 0;
	if (hostname == 0) {
		if (errbuf)
			snprintf(errbuf, ERRBUF_SIZE, "ResolveIP(): hostname == 0");
		return 0;
	}
    struct sockaddr_in	server_sin;
#ifdef WIN32
	PHOSTENT phostent = NULL;
#else
	struct hostent *phostent = NULL;
#endif
	server_sin.sin_family = AF_INET;
	if ((phostent = gethostbyname(hostname)) == NULL) {
#ifdef WIN32
		if (errbuf)
			snprintf(errbuf, ERRBUF_SIZE, "Unable to get the host name. Error: %i", WSAGetLastError());
#else
		if (errbuf)
			snprintf(errbuf, ERRBUF_SIZE, "Unable to get the host name. Error: %s", strerror(errno));
#endif
		return 0;
	}
#ifdef WIN32
	memcpy ((char FAR *)&(server_sin.sin_addr), phostent->h_addr, phostent->h_length);
#else
	memcpy ((char*)&(server_sin.sin_addr), phostent->h_addr, phostent->h_length);
#endif
	return server_sin.sin_addr.s_addr;
}

bool ParseAddress(const char* iAddress, int32* oIP, int16* oPort, char* errbuf) {
	Seperator sep(iAddress, ':', 2, 250, false, 0, 0);
	if (sep.argnum == 1 && sep.IsNumber(1)) {
		*oIP = ResolveIP(sep.arg[0], errbuf);
		if (*oIP == 0)
			return false;
		if (oPort)
			*oPort = atoi(sep.arg[1]);
		return true;
	}
	return false;
}

#ifdef WIN32
InitWinsock::InitWinsock() {
	WORD version = MAKEWORD (1,1);
	WSADATA wsadata;
	WSAStartup (version, &wsadata);
}

InitWinsock::~InitWinsock() {
	WSACleanup();
}

#endif


const char * itoa(int num) {
		static char temp[_ITOA_BUFLEN];
		memset(temp,0,_ITOA_BUFLEN);
		snprintf(temp,_ITOA_BUFLEN,"%d",num);
		return temp;
}

#ifndef WIN32
const char * itoa(int num, char* a,int b) {
		static char temp[_ITOA_BUFLEN];
		memset(temp,0,_ITOA_BUFLEN);
		snprintf(temp,_ITOA_BUFLEN,"%d",num);
		return temp;
		return temp;
}
#endif

/* 
 * solar: generate a random integer in the range low-high 
 * this should be used instead of the rand()%limit method
 */
int MakeRandomInt(int low, int high)
{
	_CP(MakeRandomInt);
	if(low >= high)
		return(low);

	return (rand()%(high-low+1) + (low));
}

double MakeRandomFloat(double low, double high)
{
	_CP(MakeRandomFloat);
	if(low >= high)
		return(low);

	return (rand() / (double)RAND_MAX * (high - low) + low);
}

// solar: removes the crap and turns the underscores into spaces.
char *CleanMobName(const char *in, char *out)
{
	unsigned i, j;
	
	for(i = j = 0; i < strlen(in); i++)
	{
		// convert _ to space.. any other conversions like this?  I *think* this
		// is the only non alpha char that's not stripped but converted.
		if(in[i] == '_')
		{
			out[j++] = ' ';
		}
		else
		{
			if(isalpha(in[i]) || (in[i] == '`'))	// numbers, #, or any other crap just gets skipped
				out[j++] = in[i];
		}
	}
	out[j] = 0;	// terimnate the string before returning it
	return out;
}

const char *ConvertArray(int input, char *returnchar)
{
	sprintf(returnchar, "%i" ,input);
	return returnchar;
}

const char *ConvertArrayF(float input, char *returnchar)
{
	sprintf(returnchar, "%0.2f", input);
	return returnchar;
}

float EQ13toFloat(int d)
{
	return ( float(d)/float(1<<2));
}

float NewEQ13toFloat(int d)
{
	return ( float(d)/float(1<<6));
}

float EQ19toFloat(int d)
{
	return ( float(d)/float(1<<3));
}

int FloatToEQ13(float d)
{
	return int(d*float(1<<2));
}

int NewFloatToEQ13(float d)
{
	return int(d*float(1<<6));
}

int FloatToEQ19(float d)
{
	return int(d*float(1<<3));
}

/*
	Heading of 0 points in the pure positive Y direction

*/
int FloatToEQH(float d)
{
	return(int((360.0f - d) * float(1<<11)) / 360);
}

float EQHtoFloat(int d)
{
	return(360.0f - float((d * 360) >> 11));
}

void RemoveApostrophes(std::string &s)
{
	for(unsigned int i = 0; i < s.length(); ++i)
		if(s[i] == '\'')
			 s[i] = '_';
}

char *RemoveApostrophes(const char *s)
{
	char *NewString = new char[strlen(s) + 1];

	strcpy(NewString, s);

	for(unsigned int i = 0 ; i < strlen(NewString); ++i)
		if(NewString[i] == '\'')
			 NewString[i] = '_';

	return NewString;
}

