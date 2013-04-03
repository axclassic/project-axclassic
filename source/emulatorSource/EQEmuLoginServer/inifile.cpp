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

#include "inifile.h"

IniFile::IniFile() {
	PortNumber = 5999;
	DumpPacketsIn = false;
	DumpPacketsOut = false;
	Trace = false;
}

IniFile::~IniFile() {

}

bool IniFile::Load(const char *Filename) {
	FILE *fp;
	bool IniExists = false;

	if((fp = fopen(Filename, "r"))) {
		char Option[255], Param[255];

		IniExists = true;

		while(!feof(fp)) {
			ReadLine(fp, Option, Param);
			//printf("Option: %s, Value: [%s]\n", Option, Param);
			if(!strcmp(Option, "port")) { 
				PortNumber= atoi(Param);
				continue;
			}
			if(!strcmp(Option, "dumppacketsin")) { 
				DumpPacketsIn = atoi(Param);
				continue;
			}
			if(!strcmp(Option, "dumppacketsout")) { 
				DumpPacketsOut = atoi(Param);
				continue;
			}
			if(!strcmp(Option, "trace")) { 
				Trace = atoi(Param);
				continue;
			}
			if(!strcmp(Option, "databaseservername")) {
				DBServerName = Param;
				continue;
			}
			if(!strcmp(Option, "databasecatalogname")) {
				DBCatalogName = Param;
				continue;
			}
			if(!strcmp(Option, "databaseusername")) {
				DBUserName = Param;
				continue;
			}
			if(!strcmp(Option, "databaseuserpassword")) {
				DBPassword = Param;
				continue;
			}
			if(!strcmp(Option, "opcodepathandfilename")) {
				OPCodePathAndFileName = Param;
				continue;
			}
		}
		fclose(fp);
	}

	// If any of the string parameters are not specified, set to a default

	return IniExists;
}


char IniFile::ReadLine(FILE *fp, char *Option, char *Param) {
	typedef enum ReadingState	{ ReadingOption, ReadingParameter };

	ReadingState State = ReadingOption;
	
	int StrIndex = 0;
	char ch;

	strcpy(Option, "");
	strcpy(Param, "");

	while(true) {
		ch = fgetc(fp);
		if((ch=='#')&&(StrIndex==0)) { // Discard comment lines beginning with a hash
			while((ch!=EOF)&&(ch!='\n'))
				ch = fgetc(fp);

			continue;
		}
		if(ch=='\r') continue;
		if((ch==EOF)||(ch=='\n')) {
			switch(State) {
				case ReadingOption: {
					Option[StrIndex]='\0';
					break;
				}
				case ReadingParameter: {
					Param[StrIndex] = '\0';
					break;
				}
			}

			break;
		}
		if(ch=='=') {
			if(State==ReadingOption) {
				Option[StrIndex] = '\0';
				State = ReadingParameter;
				StrIndex = 0;
				continue;
			}
		}
		switch(State) {
			case ReadingOption: {
				Option[StrIndex++]=tolower(ch);
				break;
			}
			case ReadingParameter: {
				Param[StrIndex++]=ch;
				break;
			}
		}
	}

	if(!strcmp(Param,"true")) strcpy(Param,"1");
	if(!strcmp(Param,"false")) strcpy(Param,"0");

	return ch;	
}



