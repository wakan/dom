#include <stdio.h>

double strToDouble(char* ptrchar)
{
	double d;
	sscanf(ptrchar, "%lf", &d);
	return d;
}

int main (int argc, char** argv) {
	if( 2 != argc)
		return(2);

	double ms = strToDouble(argv[1]);
	int f = ms <= 0.2 ? 0
		: ms <= 1.5 ? 1
		: ms <= 3.3 ? 2
		: ms <= 5.4 ? 3
		: ms <= 7.9 ? 4
		: ms <= 10.7 ? 5
		: ms <= 13.8 ? 6
		: ms <= 17.1 ? 7
		: ms <= 20.7 ? 8
		: ms <= 24.4 ? 9
		: ms <= 28.4 ? 10
		: ms <= 32.6 ? 11
		: ms > 32.7 ? 12
		:-1; 
	fprintf(stdout,"%i",f);

	return(0);
}
