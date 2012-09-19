#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <string>
#include <iostream>
#ifdef WIN32
	#include <io.h>	
#else
#include <unistd.h>
#endif
#include <stdlib.h>
#include "zfile.h"
#include "packet_functions.h"
#include "misc.h"

using namespace std;

bool zFile::zopen(char *filename, string mode)
{
int i;
int flags;
	if ((i=mode.find('b'))!=string::npos)
		mode.erase(i,1);

	if (mode=="r") {
		flags=O_RDONLY;
	} else if (mode=="r+") {
		flags=O_RDWR;
	} else if (mode=="w") {
		flags=O_WRONLY|O_CREAT|O_TRUNC;
	} else if (mode=="w+") {
		flags=O_RDWR|O_CREAT|O_TRUNC;
	} else if (mode=="a") {
		flags=O_WRONLY|O_APPEND|O_CREAT;
	} else if (mode=="a+") {
		flags=O_RDWR|O_APPEND|O_CREAT;
	}

	fd=open(filename,flags,0666);

	return (fd>=0);
}

bool zFile::zclose()
{
	if (fd!=-1)
		close(fd);
	fd=-1;
	return true;
}

bool zFile::zgets(string &s)
{
bool result=false;
string a;
int count;
char temp[12];
int enc_len;
int def_len;
int orig_len;
int amt_read,amt_to_read;
	if ((count=read(fd,temp,12))==12) {
		orig_len=decode_length(temp);
		def_len=decode_length(&temp[4]);
		enc_len=decode_length(&temp[8]);

		if (enc_buffer_size < (enc_len+1)) {
			enc_buffer_size=(enc_len<256) ? 256 : enc_len;
			enc_buffer=(char *)realloc((void*)enc_buffer,enc_buffer_size);
		}

		if (inflate_buffer_size < (orig_len)) {
			inflate_buffer_size=(orig_len<256) ? 256 : orig_len;
			inflate_buffer=(char *)realloc((void*)inflate_buffer,inflate_buffer_size);
		}

		amt_read=0;
		amt_to_read=enc_len-amt_read;
		while(amt_to_read) {
			if ((count=read(fd,enc_buffer+amt_read,amt_to_read))<=0)
				return false;
			amt_read+=count;
			amt_to_read=enc_len-amt_read;
		}

		decode(enc_buffer,enc_buffer);
		Inflate((uchar *)enc_buffer,def_len,(uchar *)inflate_buffer,inflate_buffer_size);

		s.assign(inflate_buffer,orig_len);

		result=true;
	}

	return result;
}

bool zFile::zputs(string s)
{
bool result;
char temp[12];
int enc_len;
int def_len;
int orig_len;
char buffer[64000];

	orig_len=s.length();

	if (inflate_buffer_size < orig_len) {
		inflate_buffer_size=(orig_len<256) ? 256 : orig_len;
		inflate_buffer=(char *)realloc((void*)inflate_buffer,inflate_buffer_size);
	}

	def_len=Deflate((uchar *)s.c_str(),orig_len,(uchar *)inflate_buffer,inflate_buffer_size);

	if (enc_buffer_size < orig_len) {
		enc_buffer_size=(orig_len<256) ? 256 : orig_len;
		enc_buffer=(char *)realloc((void*)enc_buffer,enc_buffer_size);
	}

	enc_len=encode(inflate_buffer,def_len,enc_buffer);

	encode_length(orig_len,temp);
	encode_length(def_len,&temp[4]);
	encode_length(enc_len,&temp[8]);

	if (write(fd,temp,12)) {
		if (write(fd,enc_buffer,enc_len)) {
			result=true;
		}
	}

	orig_len=decode_length(temp);
	def_len=decode_length(&temp[4]);
	enc_len=decode_length(&temp[8]);
	return result;
}


