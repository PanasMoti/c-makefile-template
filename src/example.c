#include "example.h"
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

char* readFromFile(const char* Path)
{
	FILE* fp = NULL;
	fp = fopen(Path, "rb");
	if (fp == NULL) {
		fprintf(stderr,"ERROR OPENING THE FILE %s\n",Path);
		return "\0";
	}
	fseek(fp, 0, SEEK_END);
	long length = ftell(fp);
	fseek(fp, 0, SEEK_SET);
	char* buffer = malloc(length+1);
	if (buffer) {
		fread(buffer, 1, length, fp);
		
		buffer[isprint(buffer[length-1])? length : length-1] = '\0'; // fread doesnt zero-terminate the string
	}
	fclose(fp);
	return buffer;
}
