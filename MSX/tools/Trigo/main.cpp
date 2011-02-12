#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <string.h>

const char* ARGV[] = { "", "-num", "16", "-shift", "4", "-bytes", "1", "rot" };
const int ARGC = sizeof(ARGV)/sizeof(ARGV[0]);

static double PI = 3.1415926535;
static double PI_2 = 2.0 * PI;

double ComputeAngle(double x, double y)
{
	double Angle;

	if(x == 0) //Cas particulier pour fonction Atn (Atan en C)
	{
		if(y < 0)	
			Angle = -PI/2;
		else	
			Angle = PI/2;
	}
	else //Cas "Normaux"
	{
		Angle = atan(y / x);
		if(x < 0)
			Angle = Angle + PI;
	}

	//Récupération d'un résultat positif
	if(Angle < 0)
		Angle = Angle + 2 * PI;
	return Angle;
}

void Help()
{
	printf("/* Usage: trigo [options] [tables] */\n");
	printf("/* Options: */\n");
	printf("/*    -num   <x>   Entries number */\n");
	printf("/*    -shift <x>   Shift value */\n");
	printf("/*    -bytes <x>   Bytes number */\n");
	printf("/*    -help        This help */\n");
	printf("/* Tables: */\n");
	printf("/*    sin          Sinus table */\n");
	printf("/*    cos          Cosinus table */\n");
	printf("/*    tan          Tangente table */\n");
	printf("/*    asin         Arc-sinus table */\n");
	printf("/*    acos         Arc-cosinus table */\n");
	printf("/*    atan         Arc-tangente table */\n");
	printf("/*    proj         Projection */\n");
	printf("/*    rot          Rotation angle */\n");
}

int main(int argc, const char* argv[])
{
	//argc = ARGC; // for debug purpose
	//argv = ARGV; // for debug purpose

	printf("/* Trigo Table Generator 1.1 */\n");
	if(argc < 2)
	{
		printf("/* Error: No enough parameters! */\n");
		Help();
		return 1;
	}

	int number = 128;
	int shift  = 0;
	int bytes  = 2;
	double multi  = static_cast<double>(1 << shift);
	double yScale = cos(PI * 0.25);
	double xScale = yScale * 212 / 256;
	double zFar   = 0.01;
	double zNear  = 16;
	double K      = zFar / (zFar - zNear) + 1;

	for(int argIndex = 1; argIndex < argc; argIndex++)
	{
		if(strcmp(argv[argIndex], "-help") == 0)
		{
			Help();
			return 0;
		}
		else if(strcmp(argv[argIndex], "-num") == 0)
		{
			number = atoi(argv[++argIndex]);
		}
		else if(strcmp(argv[argIndex], "-shift") == 0)
		{
			shift = atoi(argv[++argIndex]);
			multi = static_cast<double>(1 << shift);
		}
		else if(strcmp(argv[argIndex], "-bytes") == 0)
		{
			bytes = atoi(argv[++argIndex]);
		}
	}

	printf("/* Entry number: %d, Shift value: %d, Bytes number: %d */\n", number, shift, bytes);

	for(int argIndex = 1; argIndex < argc; argIndex++)
	{
		if(strcmp(argv[argIndex], "sin") == 0)
		{
			// sinus
			printf("\nstatic const int g_Sinus%d[%d] =\n{\n\t", number, number);
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
			printf("\nstatic const int g_Cosinus%d[%d] =\n{\n\t", number, number);
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
			printf("\nstatic const int g_Tangent%d[%d] =\n{\n\t", number, number);
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
			printf("\nstatic const int g_ArcSinus%d[%d] =\n{\n\t", number, number);
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
			printf("\nstatic const int g_ArcCosinus%d[%d] =\n{\n\t", number, number);
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
			printf("\nstatic const int g_ArcTangent%d[%d] =\n{\n\t", number, number);
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
			printf("\nstatic const int g_ProjectionX%d[%d] =\n{\n\t", number, 256);
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
			printf("\nstatic const int g_ProjectionY%d[%d] =\n{\n\t", number, 256);
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
		else if(strcmp(argv[argIndex], "rot") == 0)
		{
			// rotation
			printf("\nstatic const %s g_Rotation%d[%d] =\n{\n\t", bytes == 1 ? "char" : "int", number, (2 * number - 1) * (2 * number - 1));
			for(int i = 1 - number; i < number; i++)
			{
				printf("/* x=%d */\n\t", i);
				for(int j = 1 - number; j < number; j++)
				{
					double x = multi * ComputeAngle((double)i, (double)j) / PI_2;
					x += 0.5; // for nearest approximation
					if(bytes == 1)
						printf("0x%02X, ", 0xFF & (int)x % (int)multi);
					else
						printf("0x%04X, ", 0xFFFF & (int)x % (int)multi);
				}
				printf("\n\t");
			}
			printf("\n};\n");
		}
	}

	return 0;
}