/*  EQEMu:  Everquest Server Emulator
    Copyright (C) 2001-2006  EQEMu Development Team (http://eqemulator.net)

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
#include "eqstrmgr.h"
#include <iostream>
#include <stdio.h>

using namespace std;

bool EQStringManager::LoadStringFile(const char *filename) {
	FILE *opf = fopen(filename, "r");
	if(opf == NULL) {
		fprintf(stderr, "Unable to open string file '%s'.", filename);
		return(false);
	}
	
	//load the opcode file into eq, could swap in a nice XML parser here
	char line[2048];
	int lineno = 0;
	uint16 number,count,length;
	char str[1024];
	while(!feof(opf)) {
		lineno++;
		line[0] = '\0';	//for blank line at end of file
		if(fgets(line, sizeof(line), opf) == NULL)
			break;

		length=strlen(line);
		while(isspace(line[length-1]))
			length--;
		line[length]=0;

		if (lineno==1) {
			//cout << "File version is: " << line << endl;
			continue;
		}

		if (lineno==2) {
			sscanf(line,"%hi %hi",&number,&count);
			//cout << "File contains " << count << " messages." << endl;
			continue;
		}

		sscanf(line,"%hi %[^\n]",&number,str);

		Strings[number]=str;

	}
	fclose(opf);

	return true;
	
}

bool EQStringManager::Lookup(uint16 num, string &str)
{
bool ret=false;
map<uint16,string>::iterator itr;
	if ((itr=Strings.find(num))!=Strings.end()) {
		str=itr->second;
		ret=true;
	}

	return ret;
}
