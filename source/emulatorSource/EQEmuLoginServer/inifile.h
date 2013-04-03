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

#if !defined(_L__INIFILE__H)
#define _L__INIFILE__H

#include <stdio.h>
#include <set>
#include <string>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

using namespace std;

class IniFile {

public:
	IniFile();
	~IniFile();
	bool Load(const char *Filename);

	bool DumpPacketsIn;
	bool DumpPacketsOut;
	int  PortNumber;
	bool Trace;
	string DBServerName;
	string DBCatalogName;
	string DBUserName;
	string DBPassword;
	string OPCodePathAndFileName;

private:
	char ReadLine(FILE *fp, char *Option, char *Param);
};

#endif
