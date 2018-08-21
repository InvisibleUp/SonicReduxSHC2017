//Rewrite of LoadCharacters.asm in C because it'll probably work better.
//Trust me.
#include <stdbool.h>

//C-style externs
extern int wsprintfA(char *lpOut, char *lpFmt, ...);
extern int GetFileMatchCount(bool DirOnly, char *PathName, char *Pattern);
extern char * lstrcpyA(char *dst, char *src);
extern char * lstrcatA(char *dst, char *src);

//extern int Parse3DCharacter(char *path);
//extern int Parse3DAnimations(char *path);
//extern int Parse3DGourads(char *path, void *ModelAttribPtr);

extern void * Parse3DCharacter;
inline void xParse3DCharacter(char *path){
     asm volatile(
        "call Parse3DCharacter\n\t"
        :
        : "a" (path)
    );
}

extern void * Parse3DAnimations;
inline void xParse3DAnimations(char *path, int charNo){
    asm volatile(
        "call Parse3DAnimations\n\t"
        :
        : "a" (path), "d" (charNo)
    );
}

extern void * Parse3DGourads;
inline void xParse3DGourads(char *path, void *ModelAttribPtr){
    asm volatile(
        "call Parse3DGourads\n\t"
        :
        : "a" (path), "d" (ModelAttribPtr)
    );
}

//Borland-style externs
extern void * _nmalloc_;
inline void * x_malloc(int size){
	void * result;
	asm(
		"call _nmalloc_\n\t"
		: "=a" (result)
		: "a" (size)
	);
    return result;
}

// Let's be lazy and just make these constants
// const int ModelCount = 10;
// const int QuadCount = 2000;
// const int TriCount = 2000;
// const int VertexCount = 3349;
// const int AnimFrameCount = 15974;
//const int ModelCount = 8;
const int QuadCount = 2521;
const int TriCount = 2521;
const int VertexCount = 2623;
const int AnimFrameCount = 11301;

extern void *CharModel_QuadStart;
extern void *CharModel_VertexStart;
extern void *CharModel_BasePtr;
extern void *AnimFrames_BasePtr;
extern void *Sonic_GouradOffset;
extern void *Sonic_ModelAttribBasePtr;

extern int Game_ModelCount;
extern int Game_VertexCount;
extern int Game_TriCount;
extern int Game_QuadCount;
extern int Game_AnimFrameCount;

extern int *Sonic_AnimFrameIdx;

//No windows.h.
//Livin' on the edge here.

//Also, no calling convention. I hope.
void LoadCharacters()
{
	int CharCount = GetFileMatchCount(true, "bin\\chars\\", "*");
	int i;
    
    // Set all counters to 0
    Game_ModelCount = 0;
    Game_VertexCount = 0;
    Game_TriCount = 0;
    Game_QuadCount = 0;
    Game_AnimFrameCount = 0;
	
	// Allocate our buffers
    Sonic_ModelAttribBasePtr = x_malloc(CharCount * 80);
    CharModel_QuadStart = x_malloc(QuadCount * 24);
    CharModel_VertexStart = x_malloc( (TriCount * 24) + (QuadCount * 32) ); // ??
    CharModel_BasePtr = x_malloc(VertexCount * 64);
    Sonic_GouradOffset = x_malloc(VertexCount * 32);
    AnimFrames_BasePtr = x_malloc(AnimFrameCount * 80);
	
	for(i = 0; i < CharCount; i++){
		char rootpath[260];
        char modelpath[260];
        
        // Foolishly assuming characters are numbers
		wsprintfA(rootpath, "bin\\chars\\%d\\", i);
		
		// Load models
        lstrcpyA(modelpath, rootpath);
        lstrcatA(modelpath, "model.srm");
        xParse3DCharacter(modelpath);
        
        /*// Load gourads
        lstrcpyA(modelpath, rootpath);
        lstrcatA(modelpath, "tint.grd");
        xParse3DGourads(modelpath, Sonic_ModelAttribBasePtr + 80*i);
        
        // Load animations
        int AnimCount = GetFileMatchCount(false, rootpath, "an*.bin");
        for(int j = 0; j < AnimCount; j++){
            wsprintfA(modelpath, "%san%d.bin", rootpath, j);
            // Set ebx to i!
            xParse3DAnimations(modelpath, i);
        }
        
        if(i+1 != CharCount){
            // Set AnimFrameIdx
            Sonic_AnimFrameIdx[(i+1)*20] = Game_AnimFrameCount;
        }*/
	}
}
