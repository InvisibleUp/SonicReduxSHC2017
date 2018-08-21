#!/bin/sh

fold -w 18 Credits_DrawLine\ raw\ char\ data | head -n 256 | awk ' {printf "#; (%d)\n.word 0x%s%s\n.word 0x%s%s\n.word 0x%s%s\n", NR-1, $2, $1, $4, $3, $6, $5, $8, $7;}' > fmtsmall.asm
fold -w 18 Credits_DrawLine\ raw\ char\ data | tail -n +257 | head -n 256 | awk ' {printf "#; (%d)\n.word 0x%s%s\n.word 0x%s%s\n.word 0x%s%s\n", NR-1, $2, $1, $4, $3, $6, $5, $8, $7;}' > fmtbig.asm
