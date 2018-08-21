//No standard libraries.
#define WIN32_LEAN_AND_MEAN
#define WINVER 0x0400
#include <stdbool.h> //This doesn't really count
#include <stdarg.h>  //Ditto.
#include <windows.h>

struct BoostBar{
	int min;
	int max;
	char text[16];
	int *src;
	
	int fgcolor;
	int bgcolor;
	int iconx;
	int icony;
	int texpage;
};

extern void *CharModel_AttribStart;
extern int MISC00TexPage;
extern int Tex_Player00;
extern int HUDTexPage;

extern int Game_WindowCount;
extern int Game_HUDSplitStyle;
extern int Game_HudStyle;
extern int Game_HudTTStyle;
extern int CoinCollection;
extern int Game_Course;
extern int Game_TaggedCharCount;

inline void X_DrawText(
    const char *string,
    int x,
    int y
){
    __asm__(
        "call Generic_DrawText"
        : // No outputs
        : "a" (string), "b" (x), "c" (y)
    );
}

inline void X_D3D_Render2DObject(
	const int Tinting,
	const int Height,
	const int Width,
	const int YOff,
	const int XOff,
	const int texpage,
	const int VisibleHeight,
	const int VisibleWidth,
	const int XPos,
	const int YPos,
	const float ZPos
){
	//Watcom fastcall wrapper
	__asm__(
		"push %0\n\t" //Tint
		"push %1\n\t" //H
		"push %2\n\t" //W
		"push %3\n\t" //Y
		"push %4\n\t" //X
		"push %5\n\t" //texpage
		"push %6\n\t" //VisH
		"push %7\n\t" //VisW
		"push %8\n\t" //Zpos
		"call D3D_Render2DObject"
		: //No outputs
		: "rns" (Tinting),
		  "rns" (Height),
		  "rns" (Width),
		  "rns" (YOff),
		  "rns" (XOff),
		  "rns" (texpage),
		  "rns" (VisibleHeight),
		  "rns" (VisibleWidth),
		  "rns" (ZPos),
		  "a" (XPos),
		  "d" (YPos)
	);
};

void BoostBar_Init(struct BoostBar *input, int charID)
{
	//I still need to actually implement characters. Heh heh.
	input->iconx = 128 + ((charID % 5) * 16);
	input->icony = 80 + charID / 5;
	input->fgcolor = (int)(&CharModel_AttribStart + (charID*128)/4 + 11);
	input->bgcolor = (int)(&CharModel_AttribStart + (charID*128)/4 + 12);
	input->texpage = Tex_Player00;
    
    input->text[0] = '@';
    input->text[1] = '0';
    input->text[2] = '\0';
    lstrcatA(input->text, (char*)(&CharModel_AttribStart + (charID*128)/4 + 7));
    lstrcatA(input->text, "@x");
	//(input->text) = (char*)(CharModel_AttribStart + (charID*128) + 36); //Short name
    
    input->min = 0;
    input->max = 100;
    input->src = 0x8FD50C; 
    
	return;
}

void BoostBar_Draw(void *PlayerBase)
{
    struct BoostBar *input;
    input = (PlayerBase+0x11C);
    
	int width = 128; //in pixels
	const int height = 50;
	const int x = 16;
	int y = 480 - height - 16;
	
	bool DrawCoins = false;
	bool DrawBalloons = false; //It's one or the other
	char ltext[8]; //For balloon/coin counter
	int liconx = input->iconx;
	int licony = input->icony;
	int ltexpage = input->texpage;
	
	if(input->src != 0){
		//Set new width
		if(*(input->src) <= input->max){
			width *= (*(input->src) / (input->max - input->min));
		}
	} else {
		//Don't draw bar
		//(We're going to repurpose this for balloons/coins)
		width = 0;
	}
	
	//Do we actually need balloons or coins?
	DrawCoins = (Game_HudStyle == 0) && ( *(&CoinCollection + Game_Course) == 2);
	DrawBalloons = (Game_HudTTStyle == 3);
	
	//If so, set text and icon accordingly
    ltext[0] = '@';
    ltext[1] = '0';
    ltext[3] = '/';
    ltext[4] = '5';
    ltext[5] = '@';
    ltext[6] = 'x';
    ltext[7] = '\0';
    
	if(DrawCoins){
		ltext[2] = Game_TaggedCharCount + 48; //ASCII adjust
		
		licony = 0x70;
		liconx = 0xB0;
		ltexpage = HUDTexPage;
	} else if (DrawBalloons) {
		ltext[2] = *(char*)(PlayerBase+0x1F4) + 48;
		
		licony = 0x70;
		liconx = 0x80;
		ltexpage = HUDTexPage;
	}
	
	//Set new X/Y
	if(Game_WindowCount == 2){
		if(Game_HUDSplitStyle == 0){ //Horizontal?
			y -= 240; //Move boost bar up
		}
	}
	
	// Draw background
	X_D3D_Render2DObject(
		input->bgcolor, //Tinting
		32, //Height
		128, //Width
		48, //Y-Off
		96, //X-Off
		MISC00TexPage,
		64, //Visible height
		256, //Visible width
		x, //X-pos
		y, //Y-pos,
		500.0 //Z-pos
	);
	
	// Draw player bg
	X_D3D_Render2DObject(
		input->fgcolor, //Tinting
		27, //Height
		27, //Width
		32, //Y-Off
		0, //X-Off
		MISC00TexPage,
		27*2, //Visible height
		27*2, //Visible width
		x+15, //X-pos
		y, //Y-pos,
		500.0 //Z-pos
	);
	
	// Draw icon
	X_D3D_Render2DObject(
		0x0FFFFFF0, //Tinting
		16, //Height
		16, //Width
		licony, //Y-Off
		liconx, //X-Off
		ltexpage,
		32, //Visible height
		32, //Visible width
		x+12, //X-pos
		y+10, //Y-pos,
		500.0 //Z-pos
	);
	
	// Draw bar
	X_D3D_Render2DObject(
		input->fgcolor, //Tinting
		height, //Height
		width, //Width
		0, //Y-Off
		128, //X-Off
		MISC00TexPage,
		height * 2, //Visible height
		width * 2, //Visible width
		x, //X-pos (lines up with boost bar 128px right)
		y, //Y-pos,
		500.0 //Z-pos
	);
    
    // Draw text
    // COMPILE WITH CLANG OR GCC W/O OPTIMIZATIONS.
    // I seem to be hitting some obscure compiler bug here...
    if( (DrawCoins || DrawBalloons) || input->text[0] == '@'){
        X_DrawText(
            (DrawCoins || DrawBalloons) ? ltext : input->text, //Text to draw
            x+60,
            y+12
        );
    }
}

void test(){
    
    struct BoostBar *bbar;
    int identity = 3;
    
    BoostBar_Init(
        bbar, identity
    );
}
