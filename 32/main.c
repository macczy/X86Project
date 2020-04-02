#include <stdio.h>

char *longestseq(char* string, char *pat);

int main(int argc, char *argv[]) {
    if(argc>2){
		printf("string: %s\npattern: %s\n", argv[1], argv[2]);
		printf("result: %s\n", 	longestseq(argv[1], argv[2]));
	}else{
		printf("Not enough arguments, please provide a string and a pattern to be found\n");
	}
    return 0;
}
