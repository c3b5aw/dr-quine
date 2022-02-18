#include <stdio.h>
#include <stdlib.h>

#define FT(string) int main() { FILE *fptr = fopen("Grace_kid.c", "w"); if (!fptr) return 1; fprintf(fptr, "#include <stdio.h>\n#include <stdlib.h>\n\n#define FT(string) "string"\n#define EXPAND(string) STRINGIZING(string)\n#define STRINGIZING(string) #string\nFT(EXPAND(FT(string)));\n\n/*\n\tThis is a comment\n*/\n"); fclose(fptr); return 0; }
#define EXPAND(string) STRINGIZING(string)
#define STRINGIZING(string) #string
FT(EXPAND(FT(string)));

/*
	This is a comment
*/
