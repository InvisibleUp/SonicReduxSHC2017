#include <stdbool.h>

// While action button is held, Silver should hover.
// He can hover indefinitely on the ground.
// He can only hover for a brief period of time (6 seconds) in air

// "Hovering" means "ignore friction/turning/acceleration/gravity".
// If Silver hovers off a cliff, the hover timer will start running.

// Flight Timer is used as Boost Bar source

struct Polygon {
    int TexPage;
    int TA_X;
    int TA_Y;
    int TB_X;
    int TB_Y;
    int TC_X;
    int TC_Y;
    int TD_X;
    int TD_Y;
};

void *Sonic_PolyLookup = 0x007130AC;
int *Sonic_PolyCount = 0x007130B0;

void Silver_OnEach(int *Attribs, int inputs, void *PlayerBase)
{
	int *AirTime = (int*)PlayerBase + 72;
	int *HoverFlag = (int*)PlayerBase + 71;
	short *GroundFlag = (short*)PlayerBase + 57;
    short *Identity = (short*)PlayerBase + 121;
	//Use PlayerBase + 0x11C as hover flag
    
    bool StoppedHovering = false;
	
	// Cancel air timer if we run into ground
	if(*GroundFlag == 0 && *AirTime != 0){
		*HoverFlag = 0;
        StoppedHovering = true;
	}
	
    // Check if player is still holding button
	if(*AirTime == 0 || (*GroundFlag == 0 && !(inputs & 0x100))){
        // Player let go or ran out of time, disable hover
		*HoverFlag = 0;
        StoppedHovering = true;
    }
	
	// Set air timer
	if (*GroundFlag == 0){
		// In air
		*AirTime -= 1;
	} else {
		*AirTime = 30 * 6; // 6 seconds
	}
    
    // Reset animation/textures when done hovering
    if(StoppedHovering){
		// Switch textures. (We're assuming Silver's active textures are
        // 64 pixels below his inactive ones
        struct Polygon *Polylist = (Sonic_PolyLookup + (*Identity * 0x80));
        int i = 0;
        
        // TODO: Set animation
        
        for(int i = 0; i < *Sonic_PolyCount; i++){
            Polylist[i].TA_Y += 64;
            Polylist[i].TB_Y += 64;
            Polylist[i].TC_Y += 64;
            Polylist[i].TD_Y += 64;
        }
	}
	
	// Set player attributes if hovering
	if(*HoverFlag == 1){
		Attribs[1] = 0; //Accel
		Attribs[2] = 0; //Turning Speed
		Attribs[5] = 0; //Deaccel
		Attribs[6] = 0; //Jump height
		Attribs[7] = 0x7FFFFFF; //Slope divisior (ignore slopes)
		Attribs[10] = 0; //Fall speed
		Attribs[12] = 0; //Disable weather penalty (prevents divide by 0)
	}
	
}
