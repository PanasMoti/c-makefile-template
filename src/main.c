#include <stdio.h>
#include "example.h"
#include <stdlib.h>

int main(int argc,char** argv) {
	char* s = readFromFile("res/example.txt");
	printf("text read from file :\"%s\"",s);
	free(s);
	return 0;
}
