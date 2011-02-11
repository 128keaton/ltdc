#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <string.h>


const char* ARGV[] = { "", "64", "8", "sin", "cos", "proj" };
const int ARGC = sizeof(ARGV)/sizeof(ARGV[0]);

int main(int argc, const char* argv[])
{
	//argc = ARGC; // for debug purpose
	//argv = ARGV; // for debug purpose

	printf("/* Trigo Table Generator 1.0 */\n");
	if(argc < 3)
	{
		printf("/* Error:  No enough parameters! */\n");
		printf("/* Usage:  trigo <entry_number> <shift_value> [options] */\n");
		printf("/* Option: sin         Sinus table */\n");
		printf("/*         cos         Cosinus table */\n");
		printf("/*         tan         Tangente table */\n");
		printf("/*         asin        Arc-sinus table */\n");
		printf("/*         acos        Arc-cosinus table */\n");
		printf("/*         atan        Arc-tangente table */\n");
		printf("/*         proj        Projection */\n");
		return 1;
	}

	static double PI = 3.1415926535;
	static double PI_2 = 2.0 * PI;

	int number = atoi(argv[1]);
	int shift  = atoi(argv[2]);
	double multi  = static_cast<double>(1 << shift);
	double yScale = cos(PI * 0.25);
	double xScale = yScale * 212 / 256;
	double zFar   = 0.01;
	double zNear  = 16;
	double K      = zFar / (zFar - zNear) + 1;

	printf("/* Entry number: %d, Shift value: %d */\n", number, shift);

	for(int argIndex = 3; argIndex<argc; argIndex++)
	{
		if(strcmp(argv[argIndex], "sin") == 0)
		{
			// sinus
			printf("\nstatic const int g_Sinus[%d] =\n{\n\t", number);
			for(int i=0; i<number; i++)
			{
				double x = (double)i * PI_2 / (double)number;
				x = multi * sin(x);
				printf("0x%04X, ", 0xFFFF & (int)x);
				if((i % 8 == 7) && (i < number - 1))
					printf("\n\t");
			}
			printf("\n};\n");
		}
		else if(strcmp(argv[argIndex], "cos") == 0)
		{
			// cosinus
			printf("\nstatic const int g_Cosinus[%d] =\n{\n\t", number);
			for(int i=0; i<number; i++)
			{
				double x = (double)i * PI_2 / (double)number;
				x = multi * cos(x);
				printf("0x%04X, ", 0xFFFF & (int)x);
				if((i % 8 == 7) && (i < number - 1))
					printf("\n\t");
			}
			printf("\n};\n");
		}
		else if(strcmp(argv[argIndex], "tan") == 0)
		{
			// tangeante
			printf("\nstatic const int g_Tangent[%d] =\n{\n\t", number);
			for(int i=0; i<number; i++)
			{
				double x = (double)i * PI_2 / (double)number;
				x = multi * tan(x);
				printf("0x%04X, ", 0xFFFF & (int)x);
				if((i % 8 == 7) && (i < number - 1))
					printf("\n\t");
			}
			printf("\n};\n");
		}
		else if(strcmp(argv[argIndex], "asin") == 0)
		{
			// arc-sinus
			printf("\nstatic const int g_ArcSinus[%d] =\n{\n\t", number);
			for(int i=0; i<number; i++)
			{
				double x = (double)i * PI_2 / (double)number;
				x = multi * asin(x);
				printf("0x%04X, ", 0xFFFF & (int)x);
				if((i % 8 == 7) && (i < number - 1))
					printf("\n\t");
			}
			printf("\n};\n");
		}
		else if(strcmp(argv[argIndex], "acos") == 0)
		{
			// arc-cosinus
			printf("\nstatic const int g_ArcCosinus[%d] =\n{\n\t", number);
			for(int i=0; i<number; i++)
			{
				double x = (double)i * PI_2 / (double)number;
				x = multi * acos(x);
				printf("0x%04X, ", 0xFFFF & (int)x);
				if((i % 8 == 7) && (i < number - 1))
					printf("\n\t");
			}
			printf("\n};\n");
		}
		else if(strcmp(argv[argIndex], "atan") == 0)
		{
			// arc-tangeante
			printf("\nstatic const int g_ArcTangent[%d] =\n{\n\t", number);
			for(int i=0; i<number; i++)
			{
				double x = (double)i * PI_2 / (double)number;
				x = multi * atan(x);
				printf("0x%04X, ", 0xFFFF & (int)x);
				if((i % 8 == 7) && (i < number - 1))
					printf("\n\t");
			}
			printf("\n};\n");
		}
		else if(strcmp(argv[argIndex], "proj") == 0)
		{
			// projection x
			printf("\nstatic const int g_ProjectionX[%d] =\n{\n\t", 256);
			for(int i=0; i<256; i++)
			{
				double z = i - 128;
				double scale = multi * xScale / (z * K);
				printf("0x%04X, ", 0xFFFF & (int)scale);
				if((i % 8 == 7) && (i < 255))
					printf("\n\t");
			}
			printf("\n};\n");

			// projection z
			printf("\nstatic const int g_ProjectionY[%d] =\n{\n\t", 256);
			for(int i=0; i<256; i++)
			{
				double z = i - 128;
				double scale = multi * yScale / (z * K);
				printf("0x%04X, ", 0xFFFF & (int)scale);
				if((i % 8 == 7) && (i < 255))
					printf("\n\t");
			}
			printf("\n};\n");
		}
	}

	return 0;
}