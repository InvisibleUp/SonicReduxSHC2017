// While action button is held, Tails should fly.
// He can only fly for a brief period of time (6 seconds) in air.
// Tails can fly higher if he presses jump while flying.
// "Flying" means "ignore gravity".

// Flight Timer is used as Boost Bar source

void Tails_OnEach(int *Attribs, int inputs, void *PlayerBase)
{
	int *AirTime = (int*)PlayerBase + 72;
	int *FlyFlag = (int*)PlayerBase + 71;
	short GroundFlag = *(short*)PlayerBase + 57;
	//Use PlayerBase + 0x11C as fly flag
	
	// Find reasons to not update air timer
	if(GroundFlag == 0 && *AirTime == 0){
		*FlyFlag = 0;
		return;
	}
	
	// Set air timer
	if (GroundFlag == 0){
		// In air
		*AirTime -= 1;
	} else {
		*AirTime = 180; // Arbitrary number of frames to fly for
	}
	
	// Check if player is still holding button
	if(!(inputs & 0x100)){
		*FlyFlag = 0;
	}
	
	//Are we flying?
	if(*FlyFlag == 1){
		int *dY = (int*)PlayerBase + 12;
		
		// Set player attributes
		Attribs[6] = 0; //Jump height
		Attribs[10] = 0; //Fall speed
		
		//Increment dY if < 0, and cap at 0.
		if(*dY < 0){
			*dY += 100; //Random number. Might work.
		}
		if(*dY > 0){
			*dY = 0;
		}
		
		//Set dY (and drain bar faster) if we're pressing jump
		if(inputs & 0x0420){
			*dY = -10000;
            *AirTime -= 1;
		}
	}
	
}
