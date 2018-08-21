#include <stdlib.h>
#include <stdbool.h>

void RandomizeChars(short Player1Char){
	bool taken[8] = {false};

	taken[Player1Char] = true;
	for(int i = 1; i < 5; i++){
		short newChar;
		do{
			newChar = rand() & 0b111;
		} while (taken[newChar] == false);
		taken[newChar] = true;
		short *outAddr = (short *)(0x8FD4F4 + i*0x71C);
		*outAddr = newChar;
	}
}
