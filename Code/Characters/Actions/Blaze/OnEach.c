// While action button is held, boost.
// "Boost" means "play boost animation" and "increase top speed/accel".

// Using boost drains the Boost Bar.
// Recharge the Boost Bar with rings in GP/MP.
// Recharge by 50% max by making a lap, tagging someone, or popping a balloon.

extern int Game_HudStyle;
extern int Game_HUDTTStyle;
extern int Game_TaggedCharCount;

void Blaze_OnAction(int *Attribs, int inputs, void *PlayerBase)
{
	int *BoostLeft = (int*)PlayerBase + 71; //71 dwords
	int *LastRingCount = (int*)PlayerBase + 72;
	short *LastLap = (short*)PlayerBase + 146;

	const int MaxBoost = 300; //Boost for 300 frames (10 seconds)
	//Use PlayerBase + 0x11C as boost meter
	//Use PlayerBase + 0x120 as last ring counter (to refill boost)
	//Also used in other modes for last item count
	//Use PlayerBase + 0x124 as last lap (to refill boost)
	
	//Refill boost bar if needed
	if(*BoostLeft < MaxBoost){

		short CurrLap = *(short*)PlayerBase + 47;
		short LapDelta = CurrLap - *LastLap;
		// Refill by 1/2(max) on new lap
		if(LapDelta > 0){
			*BoostLeft += (MaxBoost/2);
		}
		*LastLap = CurrLap;
		
		
		// Time Trial, Tag4
		if(Game_HudStyle == 2 && Game_HudTTStyle == 2){
			int TagDelta = Game_TaggedCharCount - *LastRingCount;
			
			if(TagDelta > 0){
				*BoostLeft = MaxBoost / 2;
			}
			
			*LastRingCount = Game_TaggedCharCount;
			
		// Time Trial, Balloon
		} else if (Game_HudStyle == 2 && Game_HudTTStyle == 3){
			int BalloonCount = *(int*)PlayerBase + 125;
			int BallonDelta = BalloonCount - *LastRingCount;
			
			if(BalloonDelta > 0){
				*BoostLeft = MaxBoost / 2;
			}
			*LastRingCount = BalloonCount;
			
		// Any other mode
		} else {
			
			int *RingCount = (int*)PlayerBase + 7;
			int RingDelta = *RingCount - *LastRingCount;
			
			if(RingDelta > 0){
				//Add 6 frames (1/5 sec) per ring.
				*BoostLeft += (6 * RingDelta);
				
				//And because I'm *evil*, let's consume the ring!
				//(This is a balance thing so you can't boost AND
				// take shortcuts. Don't double-dip your rings.)
				*RingCount = *LastRingCount;
			}
		}
	}
	
	//Cap boost bar at max
	if(*BoostLeft > MaxBoost){*BoostLeft = MaxBoost;}
	
	//Check if we are holding boost and can boost
	if(*BoostLeft > 0 && (input & 0x100)){
		//Change player animation
		*((short*)PlayerBase + 76) == 10; //Something obviously wrong for now
		
		//Change player attributes
		Attribs[0] *= 2; //Top Speed
		Attribs[1] *= 2; //Accel
		Attribs[8] *= 2; //Water top speed
		Attribs[2] /= 2; //Turning Speed
		Attribs[5] /= 4; //Deaccel
	}
	
}