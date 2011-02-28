// std
#include <stdlib.h>
#include <stdio.h>
#include <tchar.h>
#include <string.h>
#include <string>
// FreeImage
#include "FreeImage.h"
// MSXImage
#include "types.h"
#include "color.h"

//=============================================================================
// Program
//=============================================================================

//-----------------------------------------------------------------------------
// FreeImage interface
//-----------------------------------------------------------------------------

/** Generic image loader
	@param lpszPathName Pointer to the full file name
	@param flag Optional load flag constant
	@return Returns the loaded dib if successful, returns NULL otherwise
*/
FIBITMAP* LoadImage(const char* lpszPathName)
{
	FREE_IMAGE_FORMAT fif = FIF_UNKNOWN;
	// check the file signature and deduce its format (the second argument is currently not used by FreeImage)
	fif = FreeImage_GetFileType(lpszPathName, 0);
	if(fif == FIF_UNKNOWN)
	{
		// no signature ? try to guess the file format from the file extension
		fif = FreeImage_GetFIFFromFilename(lpszPathName);
	}
	// check that the plugin has reading capabilities ...
	if((fif != FIF_UNKNOWN) && FreeImage_FIFSupportsReading(fif))
	{
		// ok, let's load the file
		FIBITMAP *dib = FreeImage_Load(fif, lpszPathName);
		// unless a bad file format, we are done !
		return dib;
	}
	return NULL;
}

/** Generic image writer
	@param dib Pointer to the dib to be saved
	@param lpszPathName Pointer to the full file name
	@param flag Optional save flag constant
	@return Returns true if successful, returns false otherwise
*/
bool SaveImage(FIBITMAP* dib, const char* lpszPathName)
{
	FREE_IMAGE_FORMAT fif = FIF_UNKNOWN;
	BOOL bSuccess = FALSE;
	if(dib)
	{
		// try to guess the file format from the file extension
		fif = FreeImage_GetFIFFromFilename(lpszPathName);
		if(fif != FIF_UNKNOWN )
		{
			// check that the plugin has sufficient writing and export capabilities ...
			WORD bpp = FreeImage_GetBPP(dib);
			if(FreeImage_FIFSupportsWriting(fif) && FreeImage_FIFSupportsExportBPP(fif, bpp))
			{
				// ok, we can save the file
				bSuccess = FreeImage_Save(fif, dib, lpszPathName);
				// unless an abnormal bug, we are done !
			}
		}
	}
	return (bSuccess == TRUE) ? true : false;
}

//-----------------------------------------------------------------------------
// MSX interface
//-----------------------------------------------------------------------------

/***/
void ConvertToHeader(const char* inFile, const char* outFile, i32 posX, i32 posY, i32 sizeX, i32 sizeY, i32 numX, i32 numY, i32 colorNum, u32 transColor, const char* name)
{
	FIBITMAP *dib, *dib32;
	i32 i, j, nx, ny, bit;
	std::string outData;
	char tempData[1024];
	RGB24 c24;
	GRB8 c8;
	u8 byte = 0;
		
	dib = LoadImage(inFile); // open and load the file using the default load option
	if(dib != NULL)
	{
		// Get 32 bits version
		dib32 = FreeImage_ConvertTo32Bits(dib);
		FreeImage_Unload(dib); // free the original dib
		i32 imageX = FreeImage_GetWidth(dib32);
		i32 imageY = FreeImage_GetHeight(dib32);
		i32 scanWidth = FreeImage_GetPitch(dib32);
		i32 bpp = FreeImage_GetBPP(dib32);
		BYTE *bits = new BYTE[scanWidth * imageY];
		FreeImage_ConvertToRawBits(bits, dib32, scanWidth, 32, FI_RGBA_RED_MASK, FI_RGBA_GREEN_MASK, FI_RGBA_BLUE_MASK, TRUE);
		FreeImage_Unload(dib32);

		// Build header file
		outData += "// Sprite table generated by MSXImage 1.3\n";
		outData += "const u8 ";
		outData += name ? name : "tab";
		outData += "[] = \n";
		outData += "{\n";
		for(ny = 0; ny < numY; ny++)
		{
			for(nx = 0; nx < numX; nx++)
			{
				outData += "// Sprite[0]\n";
				for(j = 0; j < sizeY; j++)
				{
					outData += "\t";
					for(i = 0; i < sizeX; i++)
					{
						i32 pixel = posX + i + (nx * sizeX) + ((posY + j + (ny * sizeY)) * imageX);
						u32 argb = ((u32*)bits)[pixel];
						if(colorNum == 256)
						{
							// convert to 8 bits GRB
							if((argb & 0xFFFFFF) == transColor)
							{
								c8 = 0;
							}
							else
							{
								c24 = RGB24(argb);
								c8 = GRB8(c24);
								if(c8 == 0)
								{
									if(c24.G > c24.R)
										c8 = 0x20;
									else
										c8 = 0x04;
								}
							}
							sprintf_s(tempData, 1024, "0x%02X, ", (u8)c8);
							outData += tempData;
						}
						else if(colorNum == 16)
						{
						}
						else if(colorNum == 2)
						{
							bit = pixel & 0x7;
							if((argb & 0xFFFFFF) != transColor)
								byte |= 1 << (7 - bit);
							if((pixel & 0x7) == 0x7)
							{
								sprintf_s(tempData, 1024, "0x%02X, /* %c%c%c%c%c%c%c%c */ ", byte, 
									byte & 0x80 ? '#' : '.', 
									byte & 0x40 ? '#' : '.', 
									byte & 0x20 ? '#' : '.', 
									byte & 0x10 ? '#' : '.', 
									byte & 0x08 ? '#' : '.', 
									byte & 0x04 ? '#' : '.', 
									byte & 0x02 ? '#' : '.', 
									byte & 0x01 ? '#' : '.');
								outData += tempData;
								byte = 0;
							}
						}
					}
					outData += "\n";
				}
			}
		}
		outData += "};\n";

		// Write header file
		FILE* file;
		fopen_s(&file, outFile, "wb");
		fwrite(outData.c_str(), outData.size(), 1, file);
		fclose(file);
	}
}

/** Build 256 colors palette */
void Create256ColorsPalette(const char* filename)
{
	RGB24 ColorTable[256];
	FILE* file;
	// Create table
	for(int i=0; i<256; i++)
	{
		ColorTable[i] = RGB24(GRB8(i));
	}
	// Save
	fopen_s(&file, filename, "wb");
	fwrite(ColorTable, sizeof(ColorTable), 1, file);
	fclose(file);
}

/** Build 16 colors palette */
void Create16ColorsPalette(const char* filename)
{
	RGB24 ColorTable[256];
	FILE* file;
	// Create table
	for(int i=0; i<256; i++)
	{
		switch(i)
		{
			case 2:  ColorTable[i] = RGB24(36,  218, 36); break;
			case 3:  ColorTable[i] = RGB24(109, 255, 109); break;
			case 4:  ColorTable[i] = RGB24(36,  255, 36); break;
			case 5:  ColorTable[i] = RGB24(72,  109, 255); break;
			case 6:  ColorTable[i] = RGB24(182, 36,  36); break;
			case 7:  ColorTable[i] = RGB24(72,  218, 255); break;
			case 8:  ColorTable[i] = RGB24(255, 36,  36); break;
			case 9:  ColorTable[i] = RGB24(255, 109, 109); break;
			case 10: ColorTable[i] = RGB24(218, 218, 36); break;
			case 11: ColorTable[i] = RGB24(218, 218, 145); break;
			case 12: ColorTable[i] = RGB24(36,  145, 36); break;
			case 13: ColorTable[i] = RGB24(218, 72,  182); break;
			case 14: ColorTable[i] = RGB24(182, 182, 182); break;
			case 15: ColorTable[i] = RGB24(255, 255, 255); break;
			default: ColorTable[i] = RGB24(0, 0, 0);
		}
	}
	// Save
	fopen_s(&file, filename, "wb");
	fwrite(ColorTable, sizeof(ColorTable), 1, file);
	fclose(file);
}

//-----------------------------------------------------------------------------
// Main
//-----------------------------------------------------------------------------

/** Main entry point
	Usage: MSXImage -in inFile -pos x y -size x y -num x y -out outFile -palette [16|256]
*/
int main(int argc, const char* argv[])
{
	FreeImage_Initialise();

	const char *inFile = NULL, *outFile = NULL, *name = NULL;
	i32 i, colorNum = 256, posX = 0, posY = 0, sizeX = 0, sizeY = 0, numX = 1, numY = 1, transColor = 0;

	if(argc == 1)
	{
		printf("MSXImage 1.2\n");
		printf("Usage: MSXImage.exe [options]\n");
		printf("Options:\n");
		printf("   -in    <file>    Inuput file name\n");
		printf("   -pos   <x> <y>   Start position\n");
		printf("   -size  <x> <y>   Width/height of the block to export\n");
		printf("   -num   <x> <y>   Number of block to export\n");
		printf("   -out   <file>    Export file name\n");
		printf("   -color <n>       Number of color (now support 256 and 2)\n");
		printf("   -trans <col>     Transparency color (in RGB 24 bits format)\n");
		printf("   -name  <name>    Name of the structure to export\n");
	}

	for(i=1; i<argc; i++)
	{
		if(_stricmp(argv[i], "-in") == 0)
		{
			inFile = argv[++i];
		}
		else if(_stricmp(argv[i], "-pos") == 0)
		{
			posX = atoi(argv[++i]);
			posY = atoi(argv[++i]);
		}
		else if(_stricmp(argv[i], "-size") == 0)
		{
			sizeX = atoi(argv[++i]);
			sizeY = atoi(argv[++i]);
		}
		else if(_stricmp(argv[i], "-num") == 0)
		{
			numX = atoi(argv[++i]);
			numY = atoi(argv[++i]);
		}
		else if(_stricmp(argv[i], "-out") == 0)
		{
			outFile = argv[++i];
		}
		else if(_stricmp(argv[i], "-color") == 0)
		{
			colorNum = atoi(argv[++i]);
		}
		else if(_stricmp(argv[i], "-trans") == 0)
		{
			sscanf_s(argv[++i], "%i", &transColor);
		}
		else if(_stricmp(argv[i], "-name") == 0)
		{
			name = argv[++i];
		}
	}

	// Create palette
	if(inFile == NULL && colorNum == 16)
	{
		Create16ColorsPalette(outFile ? outFile : "msx_16.act");
	}
	else if(inFile == NULL && colorNum == 256)
	{
		Create256ColorsPalette(outFile ? outFile : "msx_256.act");
	}

	// Convert
	if(inFile && outFile)
	{
		if(strstr(outFile, ".h") ||strstr(outFile, ".H"))
		{
			ConvertToHeader(inFile, outFile, posX, posY, sizeX, sizeY, numX, numY, colorNum, transColor, name);
		}
		else
		{
			FIBITMAP *dib = LoadImage(inFile); // open and load the file using the default load option
			if(dib != NULL)
			{
				SaveImage(dib, outFile); // save the file
				FreeImage_Unload(dib); // free the dib
			}
		}
	}

	FreeImage_DeInitialise();
	return 0;
}

