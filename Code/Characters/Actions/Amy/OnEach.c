// Compile using GCC with flags
// -mtune=i586 -m32 -mfpmath=387 -mfancy-math-387 -Ofast

#include <stdbool.h>
#include <math.h>

extern int Collision_GetHeight(int X, int Z, int Sec9Last3, int InclineDir);

void OnEach(int inputs, char *PlayerBase)
{
	bool IsVert, Collided;
	//int HammerX, HammerY, HammerZ;
	int HammerY;
	double ReboundAng = 0;
	
	volatile const int *AmyX = (int*)(PlayerBase);
	volatile const int *AmyY = (int*)(PlayerBase + 4); // note: always negative!
	volatile const int *AmyZ = (int*)(PlayerBase + 8);
	volatile const double AmyAng = (((-(*(int*)(PlayerBase + 0x10))+ 1024) % 4096) / 2048.0) * M_PI; // 0 = Up, 1024 = Right, 2048 = Down, 3072 = Left
	volatile int *AmydX = (int*)(PlayerBase + 0x2C);
	volatile int *AmydY = (int*)(PlayerBase + 0x30);
	volatile int *AmydZ = (int*)(PlayerBase + 0x34);
    volatile const int AmySpeed = *(int*)(PlayerBase + 0x44);
	const int HammerRad = 200000; // Radius
	volatile int *TimeLeft = (int*)(PlayerBase + 0x19C); // Resisting urge to call this "HammerTime"
    volatile short *SFX = (short*)(PlayerBase + 0xEA);
    volatile short *GroundFlag = (short*)(PlayerBase + 0x72);
	
	// If holding button and not already swinging and in air
	if(inputs & 0x40 && *TimeLeft == 0 && *GroundFlag == 0){
		//RAM USAGE:
		//	0x11C: Swing time remaining
		
		//Are we swinging vertically or horizontally?
		/*if(Attribs[16] == 0){
			//In air
			//Start vert. swinging animation
			*TimeLeft += 30; //Frames
			
		} else {*/
			//On ground
			//Start horiz. swinging animation
			*TimeLeft = 30; //Frames
		//}
	}

	double HammerAng = (*TimeLeft / 30.0) * M_PI; //0-180 in 30 frames
	

	// Are we still swinging?
	if (*TimeLeft <= 0){
		return;
	}
	*TimeLeft -= 1;
	
	// Horiz or vert?
	//IsVert = (*(Attribs+64) == 0);
	
	// Get a point corresponding with hammer position
	//if(IsVert){
		HammerAng += M_PI/4; // Start in front/above Amy
		HammerY = HammerRad * sin(HammerAng);
		//HammerX = HammerRad * cos(HammerAng) * cos(AmyAng);
		//HammerZ = HammerRad * cos(HammerAng) * sin(AmyAng);
	/*} else {
		HammerAng += AmyAng;
		HammerAng += M_PI/2; // Start in front of Amy
		
		HammerX = HammerRad * cos(HammerAng);
		HammerZ = HammerRad * sin(HammerAng);
		HammerY = 0;
	}*/
	
	//HammerX += *AmyX;
	HammerY += *AmyY;
	//HammerZ += *AmyZ;
	
	//if (IsVert) {
        
        volatile const int FloorDist = *(int*)(PlayerBase+0x38);
        
        // Has hammer hit ground?
		if(HammerY < FloorDist){
			return;
		}
		
		// We've got a hit!
        *SFX = 0x18; // *buuumph*
		*TimeLeft = 0; // Make sure we don't *keep* colliding.
		ReboundAng = (HammerAng - M_PI);
		
		// Now set Amy's dX, dY, and dZ accordingly
		//*AmydY = AmySpeed * sin(ReboundAng);
		//*AmydX = AmySpeed * cos(AmyAng) * cos(ReboundAng);
		//*AmydZ = AmySpeed * sin(AmyAng) * cos(ReboundAng);
        
        *AmydY = 200000.0 * sin(ReboundAng);
        *AmydX += (40000.0 * cos(AmyAng)) * cos(ReboundAng);
		*AmydZ += (40000.0 * sin(AmyAng)) * cos(ReboundAng);
		
	/*} else {
		/// Check wall
        
        // Store old X and Z in temp variables
        int oldX = *AmyX;
        int oldZ = *AmyZ;
        int oldDX = *AmydX;
        oldDZ = *AmydZ;
        
        // Set X and Z to hammer X and Z
        *AmyX = HammerX;
        *AmyZ = HammerZ;
        
        // Force a wall collision check
        asm volatile {
            "call XZCollision_SolidObject\n"
            :
            : "a" (PlayerBase)
            :
        }
        
        // Reset timer to 180 if we've hit something
        // Also double speed. That won't backfire at all...
        if(!(oldDX == *AmydX && oldDZ == *AmydZ)){
           *TimeLeft = 180;
           *AmydX *= 2;
           *AmydZ *= 2;
        }
        
        // Restore X and Z
        *AmyX = oldX;
        *AmyZ = oldZ;
	}*/
	
}
