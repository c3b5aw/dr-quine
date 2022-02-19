#include <stdio.h>
#include <fcntl.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>

int	main()
{
	int i = 5;
	if (access("Sully_5.c", F_OK) != -1)
		--i;

	if (i >= 0) {
		char file_name[16] = "Sully_";
		file_name[6] = i + '0';
		
		char file_path[32] = {0};
		strcat(file_path, file_name);
		strcat(file_path, ".c");

		FILE *fptr = fopen(file_path, "w");
		if (!fptr)
			return 1;

		char source_code[] = "#include <stdio.h>%3$c#include <fcntl.h>%3$c#include <string.h>%3$c#include <stdlib.h>%3$c#include <unistd.h>%3$c%3$cint%4$cmain()%3$c{%3$c%4$cint i = %2$d;%3$c%4$cif (access(%5$cSully_5.c%5$c, F_OK) != -1)%3$c%4$c%4$c--i;%3$c%3$c%4$cif (i >= 0) {%3$c%4$c%4$cchar file_name[16] = %5$cSully_%5$c;%3$c%4$c%4$cfile_name[6] = i + '0';%3$c%4$c%3$c%4$c%4$cchar file_path[32] = {0};%3$c%4$c%4$cstrcat(file_path, file_name);%3$c%4$c%4$cstrcat(file_path, %5$c.c%5$c);%3$c%3$c%4$c%4$cFILE *fptr = fopen(file_path, %5$cw%5$c);%3$c%4$c%4$cif (!fptr)%3$c%4$c%4$c%4$creturn 1;%3$c%3$c%4$c%4$cchar source_code[] = %5$c%1$s%5$c;%3$c%4$c%4$cchar input[4096];%3$c%4$c%4$csprintf(input, source_code, source_code, i, 10, 9, 34);%3$c%4$c%4$cfprintf(fptr, %5$c%%s%5$c, input);%3$c%4$c%4$cfclose(fptr);%3$c%3$c%4$c%4$cchar compile_cmd[128] = %5$ccc -Wall -Wextra -Werror %5$c;%3$c%4$c%4$cstrcat(compile_cmd, file_name);%3$c%4$c%4$cstrcat(compile_cmd, %5$c.c%5$c);%3$c%4$c%4$cstrcat(compile_cmd, %5$c -o %5$c);%3$c%4$c%4$cstrcat(compile_cmd, file_name);%3$c%4$c%4$csystem(compile_cmd);%3$c%3$c%4$c%4$cif (i > 0) {%3$c%4$c%4$c%4$cchar exec_cmd[128] = %5$c./%5$c;%3$c%4$c%4$c%4$cstrcat(exec_cmd, file_name);%3$c%4$c%4$c%4$csystem(exec_cmd);%3$c%4$c%4$c}%3$c%4$c}%3$c%4$creturn 0;%3$c}";
		char input[4096];
		sprintf(input, source_code, source_code, i, 10, 9, 34);
		fprintf(fptr, "%s", input);
		fclose(fptr);

		char compile_cmd[128] = "cc -Wall -Wextra -Werror ";
		strcat(compile_cmd, file_name);
		strcat(compile_cmd, ".c");
		strcat(compile_cmd, " -o ");
		strcat(compile_cmd, file_name);
		system(compile_cmd);

		if (i > 0) {
			char exec_cmd[128] = "./";
			strcat(exec_cmd, file_name);
			system(exec_cmd);
		}
	}
	return 0;
}