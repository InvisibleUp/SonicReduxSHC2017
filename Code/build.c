// AsmPatch 0.1
// MIT license.

#include <stdlib.h>
#include <stdio.h>

int main(){
    system("as -32 redux.asm");
    system("objcopy -O binary --only-section=.text a.out text.bin");
    system("objcopy -O binary --only-section=.data a.out data.bin");

    // Create null file in memory
    unsigned char *Patch = calloc(1263104, 1);
    unsigned char *Out = calloc(1263104, 1);
    
    // Copy text segment into our patch
    puts("Text");
    FILE *segtext = fopen("text.bin", "rb");
    fseek(segtext, 0x410000, SEEK_SET);
    fread(Patch + 0x400, 1, 0x4EAB18 - 0x410000, segtext);
    fclose(segtext);
    
    // Copy data segment into our patch
    puts("Data");
    FILE *segdata = fopen("data.bin", "rb");
    fseek(segdata, 0x4F0000, SEEK_SET);
    fread(Patch + 0xDB000, 1, 0x53479C - 0x4F0000, segdata);
    fclose(segdata);
    
    // Read SONICR.EXE and copy it to our patch if patch is not 0x00 at that byte
    puts("Reading SONICR.EXE");
    FILE *src = fopen("SONICR.EXE", "rb");
    for(int i = 0; i < 1263104; i++){
        
        // If current patch byte is a zero and
        // if 3 bytes before or behind it are all zeroes,
        // copy data from EXE to our patch
		// (this is EXTREMELY hacky and prone to breakage)
        if(
            i < 1263100 &&
            Patch[i] == 0x00 && (
                (Patch[i-1] == 0x00 && Patch[i-2] == 0x00 && Patch[i-3] == 0x00 && Patch[i-4] == 0x00 && Patch[i-5] == 0x00 && Patch[i-6] == 0x00) ||
                (Patch[i+1] == 0x00 && Patch[i+2] == 0x00 && Patch[i+3] == 0x00 && Patch[i+4] == 0x00 && Patch[i+5] == 0x00 && Patch[i+6] == 0x00)
            )
        ){ 
            fread(Out+i, 1, 1, src);
            continue;
        }

        Out[i] = Patch[i];
        fseek(src, 1, SEEK_CUR);
    }
    fclose(src);
    
    // Write our patched file to disk
    puts("Writing Redux");
    FILE *dest = fopen("REDUX.EXE", "wb");
    fwrite(Out, 1, 1263104, dest);
    fclose(dest);
    
    free(Out);
    free(Patch);
    return 0;
}
 
