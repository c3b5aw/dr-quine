#include <stdio.h>

/*
	Second comment out of main()
*/

void	colleen()
{
	const char *source_code = "#include <stdio.h>%2$c%2$c/*%2$c%3$cSecond comment out of main()%2$c*/%2$c%2$cvoid%3$ccolleen()%2$c{%2$c%3$cconst char *source_code = %4$c%1$s%4$c;%2$c%3$cprintf(source_code, source_code, 10, 9, 34);%2$c}%2$c%2$cint%3$cmain()%2$c{%2$c%3$c/*%2$c%3$c%3$cFirst comment in main()%2$c%3$c*/%2$c%2$c%3$ccolleen();%2$c%3$creturn (0);%2$c}";
	printf(source_code, source_code, 10, 9, 34);
}

int	main()
{
	/*
		First comment in main()
	*/

	colleen();
	return (0);
}