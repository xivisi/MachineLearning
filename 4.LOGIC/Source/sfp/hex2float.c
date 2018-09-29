#include <stdio.h>
#include <stdint.h>
#include <math.h>

int main()
{
	float 		xa, xb, xs;
	uint32_t	da, db,	ds;

	da = 0x41D8FF00;
	db = 0x41D8FC00;

	*((uint32_t*)&xa) = da;
	*((uint32_t*)&xb) = db;

	xs = xa-xb;
	ds = *((uint32_t*)&xs);
	printf("float=%E\thex=0x%08X\n", xs, ds);
}
