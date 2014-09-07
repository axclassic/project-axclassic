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

#include "TextMapFile.h"

//assume that a map file is smaller than a meg
#define FILE_BUFFER_SIZE 1024*1024

//reads the whole file into memory... lazy
bool TextMapReader::ReadFile(const char *directory, const char *zone) {
	TextMapLine ln;
	char buf[256];
	FILE *in;
	
	_lines.clear();
	
	//try to locate the file
	sprintf(buf, "%s/%s.txt", directory, zone);
	in = fopen(buf, "r");
	if(in == NULL) {
		sprintf(buf, "%s/%s_1.txt", directory, zone);
		in = fopen(buf, "r");
		if(in == NULL) {
//			printf("Unable to load '%s'\n", buf);
			return(false);
		}
	}
	
	char *file = new char[FILE_BUFFER_SIZE];
	
	//read the whole thing in at once
	int len;
	len = fread(file, 1, FILE_BUFFER_SIZE, in);
	if(len == -1) {
		printf("Unable to read EQ map file.\n");
		return(false);
	}
	
	fclose(in);
	
	
	//start parsing it
	int pos = 0;
	char *start, *next;
	
	next = file;
	
	while(pos < len) {
		start = next;
		
		//find the end of the line
		for(; pos < len; pos++, next++) {
			if(*next == '\n' || *next == '\r')
				break;
		}
		if(pos >= len)
			break;
		*next = '\0';	//null therminate the 'start' string
		next++;
		pos++;
		//watch for goodl old windows line endings
		if(*next == '\n' || *next == '\r') { //could write past EOF, dont care, buffer is big
			next++;	//skip over it too.
			pos++;
		}
		
		//now start is our line, and next is in position, parse start.
		//apparently the map files allready use our inverted XY
		//try the first common format
		if(sscanf(start, "L %f, %f, %f, %f, %f, %f, %d, %d, %d",
			&ln.start.x, &ln.start.y, &ln.start.z, &ln.end.x, &ln.end.y, &ln.end.z, &ln.color.g, &ln.color.r, &ln.color.b)
			== 9) {
			//fall through if found valid structure
		//try another format, not sure how sscanf handles white space
		} else if(sscanf(start, "L %f, %f, %f,  %f, %f, %f,  %d, %d, %d",
			&ln.start.x, &ln.start.y, &ln.start.z, &ln.end.x, &ln.end.y, &ln.end.z, &ln.color.g, &ln.color.r, &ln.color.b)
			== 9) {
			//fall through if found valid structure
		} else {
			//cannot parse this line...
			continue;
		}
		
		//invert our XY, and +-
		float tmp;
		tmp = ln.start.x; ln.start.x = -ln.start.y; ln.start.y = -tmp;
		tmp = ln.end.x; ln.end.x = -ln.end.y; ln.end.y = -tmp;
		
		//now we have our points...
		
		_lines.push_back(ln);
	}
	
	delete[] file;
	
	return(true);
}




