#include <stdio.h>
#include <math.h>

double strToDouble(char* ptrchar)
{
	double d;
	sscanf(ptrchar, "%lf", &d);
	return d;
}

int main (int argc, char** argv) {
	if( 4 != argc)
		return(2);

	double r = strToDouble(argv[1]);
	double g = strToDouble(argv[2]);
	double b = strToDouble(argv[3]);

	if ( r > 0.04045 ) r = pow(( ( r + 0.055 ) / 1.055 ) , 2.4);
	else                   r = r / 12.92;
	if ( g > 0.04045 ) g = pow(( ( g + 0.055 ) / 1.055 ) , 2.4);
	else                   g = g / 12.92;
	if ( b > 0.04045 ) b = pow(( ( b + 0.055 ) / 1.055 ) , 2.4);
	else                   b = b / 12.92;

	r = r * 100;
	g = g * 100;
	b = b * 100;

	double X = r * 0.4124 + g * 0.3576 + b * 0.1805;
	double Y = r * 0.2126 + g * 0.7152 + b * 0.0722;
	double Z = r * 0.0193 + g * 0.1192 + b * 0.9505;

	double Yxyx = X / (X+Y+Z);
	double Yxyy = Y / (X+Y+Z);

	fprintf(stdout,"[%g,%g]",Yxyx, Yxyy);

	return(0);
}
