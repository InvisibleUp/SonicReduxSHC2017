// Let's actually just bite the bullet (hehe) and use FPU math for
// Nack's bullets instead of that broken integer implementation that
// really doesn't work at all.
#include <math.h>
#include <stdlib.h>

struct PlayerStruct {
    int X;
    int Y;
    int Z;
	// Bunch of other stuff...
};

struct BombStruct {
    int X;
    int Y;
    int Z;
    int dX;
    int dY;
    int dZ;
};

void MoveBomb(struct PlayerStruct *target, struct BombStruct *bomb)
{
    // Distance from target to bomb in each direction
    double distX = bomb->X - (target->X >> 4);
    double distY = bomb->Y - (target->Y >> 4);
    double distZ = bomb->Z - (target->Z >> 4);
    double dist = sqrt(distX * distX + distY * distY * distZ + distZ);
    
    // Normalize distance vector
    distX /= dist;
    distY /= dist;
    distZ /= dist;
    
    // Move either [const] or dist, whichever is smallest.
    double mult = fmin(80.0, dist);
    
    // Apply to bomb
    bomb->dX = -distX * mult;
    bomb->dY = -distY * mult;
    bomb->dZ = -distZ * mult;
}
