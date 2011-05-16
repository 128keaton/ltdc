// 1095
// 

// std
#include <stdlib.h>
#include <stdio.h>
#include <tchar.h>
#include <string.h>
#include <string>
#include <vector>
// FreeImage
#include "FreeImage.h"
// MSXImage
#include "types.h"
#include "color.h"
#include "langage.h"

#define VERSION "1.5"

enum Compressor
{
	COMPRESS_None,       // No compression
	COMPRESS_Crop256,    // Crop sprite to keep only the non-transparent area (max size 256x256)
	COMPRESS_Crop16,     // Crop sprite to keep only the non-transparent area (max size 16x16)
	COMPRESS_CropLine16, // Crop each sprite line (max size 16x16)
};

enum Format
{
	FORMAT_Auto, // Auto-detection
	FORMAT_C,    // C header file
	FORMAT_Asm,  // Assembler header file
	FORMAT_Raw,  // Raw data file
};

//const char* ARGV[] = { "", "-in", "cars.png", "-out", "sprt_car_1.h", "-pos", "0", "0", "-size", "13", "11", "-num", "16", "1", "-name", "g_Car1", "-trans", "0xE300E3", "-compress", "cropline16", "-format", "asm", "-data", "dec" };
const char* ARGV[] = { "", "-in", "track_01.png", "-out", "track_01.sc8", "-size", "256", "212", "-format", "raw" };

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
void ConvertToHeader(const char* inFile, const char* outFile, i32 posX, i32 posY, i32 sizeX, i32 sizeY, i32 numX, i32 numY, i32 colorNum, u32 transColor, const char* name, Compressor comp, LangageInterface* lang)
{
	FIBITMAP *dib, *dib32;
	i32 i, j, nx, ny, bit, minX, maxX, minY, maxY, totalBytes = 0;
	std::string outData;
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
		outData += lang->Header(VERSION, name);
		for(ny = 0; ny < numY; ny++)
		{
			for(nx = 0; nx < numX; nx++)
			{
				// Compute bound for crop compression
				if(comp != COMPRESS_None) 
				{
					minX = sizeX;
					maxX = 0;
					minY = sizeY;
					maxY = 0;
					for(j = 0; j < sizeY; j++)
					{
						for(i = 0; i < sizeX; i++)
						{
							i32 pixel = posX + i + (nx * sizeX) + ((posY + j + (ny * sizeY)) * imageX);
							u32 argb = ((u32*)bits)[pixel];
							if((argb & 0xFFFFFF) != transColor)
							{
								if(i < minX)
									minX = i;
								if(i > maxX)
									maxX = i;
								if(j < minY)
									minY = j;
								if(j > maxY)
									maxY = j;
							}
						}
					}
				}

				// Print sprite header
				outData += lang->SpriteBegin(nx + ny * numX);
				if(comp == COMPRESS_Crop256)
				{
					outData += lang->SpriteCrop256(u8(minX), u8(minY), u8(1 + maxX - minX), u8(1 + maxY - minY));
					totalBytes += 4;
				}
				else if(comp == COMPRESS_Crop16)
				{
					outData += lang->SpriteCrop16(u8((minX << 4) + minY), u8(((1 + maxX - minX) << 4) + (1 + maxY - minY)));
					totalBytes += 2;
				}
				else if(comp == COMPRESS_CropLine16)
				{
					outData += lang->SpriteCropLine16(u8((minY << 4) + (1 + maxY - minY)));
					totalBytes += 2;
				}

				// Print sprite content
				for(j = 0; j < sizeY; j++)
				{
					if((comp == COMPRESS_None) || ((j >= minY) && (j <= maxY)))
					{
						outData += lang->LineBegin();
						if(comp == COMPRESS_CropLine16) // for line-crop, we need to recompute minX&maxX for each line
						{
							minX = sizeX;
							maxX = 0;
							for(i = 0; i < sizeX; i++)
							{
								i32 pixel = posX + i + (nx * sizeX) + ((posY + j + (ny * sizeY)) * imageX);
								u32 argb = ((u32*)bits)[pixel];
								if((argb & 0xFFFFFF) != transColor)
								{
									if(i < minX)
										minX = i;
									if(i > maxX)
										maxX = i;
								}
							}
							outData += lang->LineCropLine16(u8((minX << 4) + (1 + maxX - minX)));
						}

						for(i = 0; i < sizeX; i++)
						{
							if((comp == COMPRESS_None) || ((i >= minX) && (i <= maxX)))
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
									outData += lang->Data8Bits((u8)c8);
									totalBytes++;
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
										outData += lang->Data1Bit(byte);
										totalBytes++;
										byte = 0;
									}
								}
							}
						}
						outData += lang->LineEnd();
					}
				}
			}
		}
		outData += lang->Footer(totalBytes);

		delete bits;

		// Write header file
		FILE* file;
		fopen_s(&file, outFile, "wb");
		fwrite(outData.c_str(), 1, outData.size(), file);
		fclose(file);
	}
}

/***/
void ConvertToRaw(const char* inFile, const char* outFile, i32 posX, i32 posY, i32 sizeX, i32 sizeY, i32 colorNum, u32 transColor)
{
	FIBITMAP *dib, *dib32;
	i32 i, j, bit, outSize, outIdx = 0;
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
		if(sizeX == 0)
			sizeX = imageX;
		i32 imageY = FreeImage_GetHeight(dib32);
		if(sizeY == 0)
			sizeY = imageY;
		i32 scanWidth = FreeImage_GetPitch(dib32);
		i32 bpp = FreeImage_GetBPP(dib32);
		BYTE *bits = new BYTE[scanWidth * imageY];
		FreeImage_ConvertToRawBits(bits, dib32, scanWidth, 32, FI_RGBA_RED_MASK, FI_RGBA_GREEN_MASK, FI_RGBA_BLUE_MASK, TRUE);
		FreeImage_Unload(dib32);
		
		// allocate memory
		if(colorNum == 256)
			outSize = sizeX * sizeY;
		else if(colorNum == 16)
			outSize = sizeX * sizeY / 2;
		else if(colorNum == 2)
			outSize = sizeX * sizeY / 8;
		outSize += 4; // header
		u8 *outData = new u8[outSize];
		
		// write header
		*((u16*)&outData[outIdx]) = (u16)sizeX;
		outIdx += 2;
		*((u16*)&outData[outIdx]) = (u16)sizeY;
		outIdx += 2;

		for(j = 0; j < sizeY; j++)
		{
			for(i = 0; i < sizeX; i++)
			{
				i32 pixel = posX + i + ((posY + j) * imageX);
				u32 argb = ((u32*)bits)[pixel];
				if(colorNum == 256) // Convert to 8 bits GRB
				{
					if((argb & 0xFFFFFF) == transColor)
					{
						c8 = 0;
					}
					else
					{
						c24 = RGB24(argb);
						c8 = GRB8(c24);
						if(c8 == 0) // color 0 must be convert to the nearest color
						{
							if(c24.G > c24.R)
								c8 = 0x20;
							else
								c8 = 0x04;
						}
					}
					outData[outIdx++] = (u8)c8;
				}
				else if(colorNum == 16) // Convert to paletized 16 colors
				{
				}
				else if(colorNum == 2) // Convert to binary
				{
					bit = pixel & 0x7;
					if((argb & 0xFFFFFF) != transColor)
						byte |= 1 << (7 - bit);
					if((pixel & 0x7) == 0x7)
					{
						outData[outIdx++] = byte;
						byte = 0;
					}
				}
			}
		}

		delete bits;

		// Write header file
		FILE* file;
		fopen_s(&file, outFile, "wb");
		fwrite(outData, 1, outSize, file);
		fclose(file);

		delete outData;
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

void PrintUsage()
{
	printf("MSXImage "VERSION"\n");
	printf("Usage: MSXImage.exe [options]\n");
	printf("Options:\n");
	printf("   -in fileName    Inuput file name. Can be 8/16/24/32 bits image\n");
	printf("                   Supported format: BMP, JPEG, PCX, PNG, TGA, PSD, GIF, etc.\n");
	printf("   -out fileName   Export file name\n");
	printf("   -pos x y        Start position\n");
	printf("   -size x y       Width/height of the block to export\n");
	printf("   -num x y        Number of block to export (columns/rows number)\n");
	printf("   -color number   Number of color to output (now support 2 and 256)\n");
	printf("   -trans color    Transparency color (in RGB 24 bits format)\n");
	printf("   -name name      Name of the structure to export\n");
	printf("   -compress ?\n");
	printf("      none         No compression (default)\n");
	printf("      crop256      Crop image to only the necessary area (max size 256x256)\n");
	printf("      crop16       Crop image to only the necessary area (max size 16x16)\n");
	printf("      cropline16   Crop image on a per line basis (max size 16x16)\n");
	printf("   -format ?\n");
	printf("      auto         Auto-detected using output file extension (default)\n");
	printf("      c            C header file output\n");
	printf("      asm          Assembler header file output\n");
	printf("      raw          Raw data image\n");
	printf("   -data ?\n");
	printf("      dec          Decimal data (c & asm)\n");
	printf("      hexa         Default hexadecimal data (depend on langage; default)\n");
	printf("      hexa0x       Hexadecimal data (0xFF; c & asm)\n");
	printf("      hexaH        Hexadecimal data (0FFh; asm only)\n");
	printf("      hexa$        Hexadecimal data ($FF; asm only)\n");
	printf("      hexa#        Hexadecimal data (#FF; asm only)\n");
	printf("      bin          Binary data (11001100b; asm only)\n");
}

/** Main entry point
	Usage: MSXImage -in inFile -pos x y -size x y -num x y -out outFile -palette [16|256]
*/
int main(int argc, const char* argv[])
{
	//argc = sizeof(ARGV)/sizeof(ARGV[0]); // for debug purpose
	//argv = ARGV; // for debug purpose

	FreeImage_Initialise();

	const char *inFile = NULL, *outFile = NULL, *name = NULL;
	i32 i, colorNum = 256, posX = 0, posY = 0, sizeX = 0, sizeY = 0, numX = 1, numY = 1, transColor = 0;
	Compressor comp = COMPRESS_None;
	DataFormat data = DATA_Hexa;
	Format outFormat = FORMAT_Auto;

	if(argc == 1)
	{
		PrintUsage();
		return 1;
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
		else if(_stricmp(argv[i], "-compress") == 0)
		{
			i++;
			if(_stricmp(argv[i], "crop256") == 0)
				comp = COMPRESS_Crop256;
			else if(_stricmp(argv[i], "crop16") == 0)
				comp = COMPRESS_Crop16;
			else if(_stricmp(argv[i], "cropline16") == 0)
				comp = COMPRESS_CropLine16;
		}
		else if(_stricmp(argv[i], "-format") == 0)
		{
			i++;
			if(_stricmp(argv[i], "auto") == 0)
				outFormat = FORMAT_Auto;
			else if(_stricmp(argv[i], "c") == 0)
				outFormat = FORMAT_C;
			else if(_stricmp(argv[i], "asm") == 0)
				outFormat = FORMAT_Asm;
			else if(_stricmp(argv[i], "raw") == 0)
				outFormat = FORMAT_Raw;
		}
		else if(_stricmp(argv[i], "-data") == 0)
		{
			i++;
			if(_stricmp(argv[i], "dec") == 0)
				data = DATA_Decimal;
			else if(_stricmp(argv[i], "hexa") == 0)
				data = DATA_Hexa;
			else if(_stricmp(argv[i], "hexa0x") == 0)
				data = DATA_HexaC;
			else if(_stricmp(argv[i], "hexaH") == 0)
				data = DATA_HexaAsm;
			else if(_stricmp(argv[i], "hexa$") == 0)
				data = DATA_HexaDollar;
			else if(_stricmp(argv[i], "hexa#") == 0)
				data = DATA_HexaSharp;
			else if(_stricmp(argv[i], "bin") == 0)
				data = DATA_Binary;
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
		if((outFormat == FORMAT_C) || ((outFormat == FORMAT_Auto) && strstr(outFile, ".h")))
		{
			LangageInterface* langInter = new LangageC(data);
			ConvertToHeader(inFile, outFile, posX, posY, sizeX, sizeY, numX, numY, colorNum, transColor, name, comp, langInter);
		}
		else if((outFormat == FORMAT_Asm) || ((outFormat == FORMAT_Auto) && (strstr(outFile, ".s") || strstr(outFile, ".asm"))))
		{
			LangageInterface* langInter = new LangageASM(data);
			ConvertToHeader(inFile, outFile, posX, posY, sizeX, sizeY, numX, numY, colorNum, transColor, name, comp, langInter);
		}
		else if((outFormat == FORMAT_Raw) || ((outFormat == FORMAT_Auto) && strstr(outFile, ".raw")))
		{
			ConvertToRaw(inFile, outFile, posX, posY, sizeX, sizeY, colorNum, transColor);
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

