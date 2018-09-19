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

	double f = strToDouble(argv[1]);
	double c = (5/9.0) * (f - 32);
	fprintf(stdout,"%.1f",c);

	return(0);
}
