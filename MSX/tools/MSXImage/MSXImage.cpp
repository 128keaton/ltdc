// std
#include <stdlib.h>
#include <stdio.h>
#include <tchar.h>
#include <string.h>
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
void ConvertToHeader(const char* inFile, const char* outFile, i32 colorNum)
{
	FIBITMAP *dib, *dib32;
	u32* rawBuffer;
	u8* msxBuffer;
	i32 i, sx, sy, num;
		
	dib = LoadImage(inFile); // open and load the file using the default load option
	if(dib != NULL)
	{
		dib32 = FreeImage_ConvertTo32Bits(dib);
		FreeImage_Unload(dib); // free the dib
		rawBuffer = (u32*)FreeImage_GetBits(dib32);
		sx = FreeImage_GetWidth(dib32);
		sy = FreeImage_GetHeight(dib32);
		num = sx * sy;
		msxBuffer = new u8[num];
		for(i = 0; i < num; i++)
		{
			printf("%2X, ", (u8)RGB8(RGB24(rawBuffer[i])));
			if(i % 16 == 15)
				printf("\n");
		}

		FreeImage_Unload(dib32); // free the dib
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
		ColorTable[i] = RGB24(RGB8(i));
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
	Usage: MSXImage -in inFile -pos x y -size x y -out outFile -palette [16|256]
*/
int main(int argc, const char* argv[])
{
	FreeImage_Initialise();

	const char *inFile, *outFile;
	i32 i, colorNum = 256, posX = 0, posY = 0, sizeX = 0, sizeY = 0;

	for(i=0; i<argc; i++)
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
		else if(_stricmp(argv[i], "-out") == 0)
		{
			outFile = argv[++i];
		}
		else if(_stricmp(argv[i], "-color") == 0)
		{
			colorNum = atoi(argv[++i]);
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
			ConvertToHeader(inFile, outFile, colorNum);
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

