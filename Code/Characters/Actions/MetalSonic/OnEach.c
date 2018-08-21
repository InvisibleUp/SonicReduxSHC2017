// Metal Sonic's action buttons does two things, depending on air state.

// In the air, it switches engine direction from backwards to downwards.
// The downwards engine kills acceleration and increases deceleration.
// However, he can fly upwards at pretty decent speeds, draining the boost
// meter of course.

// On the ground, it throws you into a Sonic CD-style focus boost.
// You go full speed uncontrollably forwards until your boost meter runs out.
// After that it charges slowly and naturally.

// Metal Sonic will automatically change states when transitioning from
// air to ground

// You'll notice a lot of parallels between Metal Sonic and Silver.
// This is not intentional. They looked vastly different on paper.

// Boost Bar source is focus-boost meter.

extern int Game_NybbleTimer;

void MetalSonic_OnEach(int *Attribs, int inputs, void *PlayerBase){
	
	short GroundFlag = *(short*)PlayerBase + 57;
	char *HoverFlag = (char*)PlayerBase + 0x11C;
    int *MetaldY = (int*)PlayerBase + 12;
	unsigned short *BoostTimer = (unsigned short*)PlayerBase + 143;
    unsigned short *LastAnimation = (short*)PlayerBase + 144;
    
	const unsigned short MaxBoost = 2250; //7.5 seconds
	const unsigned int MaxSpeed = 10000; // ???
	
	// Kill any boosting if out of boost or button no longer pressed
	if(*BoostTimer == 0 || !(inputs & 0x100)) {
        *BoostFlag = 0;
    }
	
	if(GroundFlag == 0 && *BoostFlag == 1){
		// In air and boosting
        
		// Set player attributes
		Attribs[1] = 0; //Acceleration
		Attribs[6] = 0; //Jump Height
		Attribs[10] /= 2; // Fall speed
		Attribs[11] /= 2; // Fall max speed
		
		// Set Y velocity
		*MetaldY += 1000;
		
		// Drain boost meter
		*BoostTimer -= 1;
		
	} else if (GroundFlag == 1 && *BoostFlag == 0){
		//On ground and not boosting
		//Recharge boost meter at 1/4 speed
		if(Game_NybbleTimer % 4 == 0 && *BoostTimer < MaxBoost){
			*BoostTimer += 1;
		}
		
	} else if (GroundFlag == 1 && *BoostFlag == 1){
		// We're boosting.
		
		// Set player attributes
		Attribs[1] = 0; // Accel
		Attribs[2] = 0; // Turning Speed
		Attribs[5] = 0; // Deaccel
		//Attribs[6] = 0; // Jump height
		Attribs[12] = 0; // Disable weather penalty (prevents divide by 0)
		
		// Add forwards speed
		
		
		// Drain boost meter
		*BoostTimer -= 1;
	}
}
