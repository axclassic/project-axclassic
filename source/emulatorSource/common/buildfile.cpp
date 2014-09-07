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
//#include <unistd.h>
#include "debug.h"
#include <errno.h>
#include <string.h>
#include "packetfile.h"
#include "buildfile.h"
#include <map>


using namespace std;


BuildFileWriter::BuildFileWriter() {
	out = NULL;
}

BuildFileWriter::~BuildFileWriter() {
	CloseFile();
}
	
bool BuildFileWriter::OpenFile(const char *name) {
	CloseFile();
	
	out = fopen(name, "wb");
	if(out == NULL) {
		fprintf(stderr, "Error opening packet file '%s': %s\n", name, strerror(errno));
		return(false);
	}
	
	BuildFileHeader head;
	head.build_file_magic = BUILD_FILE_MAGIC;
	
	if(fwrite(&head, sizeof(head), 1, out) != 1) {
		fprintf(stderr, "Error writting header to packet file: %s\n", strerror(errno));
		return(false);
	}
	
	return(true);
}

void BuildFileWriter::CloseFile() {
	if(out != NULL) {
		fclose(out);
		out = NULL;
	}
}


bool BuildFileWriter::_WriteBlock(PF_SectionType pf_op, const void *d, uint16 len) {
	if(out == NULL)
		return(false);
	
	BuildFileSection s;
	s.type = pf_op;
	s.len = len;
	
	if(fwrite(&s, sizeof(s), 1, out) != 1) {
		fprintf(stderr, "Error writting block header: %s\n", strerror(errno));
		return(false);
	}
	
	if(fwrite(d, len, 1, out) != 1) {
		fprintf(stderr, "Error writting block body: %s\n", strerror(errno));
		return(false);
	}
	
	return(true);
}


BuildFileReader::BuildFileReader() {
	in = NULL;
}

BuildFileReader::~BuildFileReader() {
	CloseFile();
}
	
bool BuildFileReader::OpenFile(const char *name) {
	CloseFile();
	
	in = fopen(name, "rb");
	if(in == NULL) {
		fprintf(stderr, "Error opening build file '%s': %s\n", name, strerror(errno));
		return(false);
	}
	
	BuildFileHeader head;
	
	if(fread(&head, sizeof(head), 1, in) != 1) {
		fprintf(stderr, "Error reading header from build file: %s\n", strerror(errno));
		fclose(in);
		return(false);
	}
	
	if(head.build_file_magic != BUILD_FILE_MAGIC) {
		fclose(in);
		if(head.build_file_magic == PACKET_FILE_MAGIC) {
			fprintf(stderr, "Error: this is a packet file, not a build file, its needs processing!\n");
		} else {
			fprintf(stderr, "Error: this is not a packet file!\n");
		}
		return(false);
	}
	
	return(true);
}

void BuildFileReader::CloseFile() {
	if(in != NULL) {
		fclose(in);
		in = NULL;
		printf("Closed packet file.\n");
	}
}

bool BuildFileReader::ReadSection(PF_SectionType &bf_op, uint16 &packlen, unsigned char *packet) {
	if(in == NULL)
		return(false);
	if(feof(in))
		return(false);
	
	BuildFileSection s;
	
	if(fread(&s, sizeof(s), 1, in) != 1) {
		if(!feof(in))
			fprintf(stderr, "Error reading section header: %s\n", strerror(errno));
		return(false);
	}
	
	bf_op = (PF_SectionType) s.type;
	
	if(packlen < s.len) {
		fprintf(stderr, "Section buffer is too small! %d < %d, skipping\n", packlen, s.len);
		fseek(in, s.len, SEEK_CUR);
		return(false);
	}
	
	if(fread(packet, 1, s.len, in) != s.len) {
		if(feof(in))
			fprintf(stderr, "Error: EOF encountered when expecting packet data.\n");
		else
			fprintf(stderr, "Error reading section body: %s\n", strerror(errno));
		return(false);
	}
	
	packlen = s.len;
	
	return(true);
}







