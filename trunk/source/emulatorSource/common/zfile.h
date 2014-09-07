#ifndef __ZFILE_H
#define __ZFILE_H
#include <string>

using namespace std;

class zFile {
	private:
		int fd;
		int enc_buffer_size;
		char *enc_buffer;
		int inflate_buffer_size;
		char *inflate_buffer;

	public:
		zFile() { fd=-1; enc_buffer_size=inflate_buffer_size=0; enc_buffer=inflate_buffer=NULL; }
		~zFile() { zclose(); if (enc_buffer) free(enc_buffer); if (inflate_buffer) free(inflate_buffer); }
		bool zopen(char *filename, string mode);
		bool zgets(string &s);
		bool zputs(string s);
		bool zclose();
		bool isopen() { return fd!=-1; }
};

#endif
