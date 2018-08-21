#!/bin/bash

# Builds folder containing replacement images for game
# Requires ImageMagick

rm -rf out
mkdir out

# Input
Input[0]=Copyright/disclaimer.psd[0]
Input[1]=Copyright/SEGALOGO.psd[0]
Input[2]=HUD/ICON00.psd[0]
Input[3]=HUD/MISC00.psd[0]
Input[4]=Title/SonicRedux-Title.png
Input[5]=Ending/amy.png
Input[6]=Ending/blaze.png
Input[7]=Ending/knux.png
Input[8]=Ending/msonic.png
Input[9]=Ending/nack.png
Input[10]=Ending/silver.png
Input[11]=Ending/sonic.png
Input[12]=Ending/tails.png
Input[13]=HUD/icon01.psd[0]
Input[14]=HUD/credit00.psd[0]

# Output
Output[0]=bin/titles/disclaimer.raw
Output[1]=bin/titles/segalogo.raw
Output[2]=general/icon00.raw
Output[3]=general/misc00.raw
Output[4]=bin/titles/titles.raw
Output[5]=bin/end/amy.raw
Output[6]=bin/end/mknuck.raw
Output[7]=bin/end/knuckles.raw
Output[8]=bin/end/msonic.raw
Output[9]=bin/end/robotnik.raw
Output[10]=bin/end/dtails.raw
Output[11]=bin/end/sonic.raw
Output[12]=bin/end/tails.raw
Output[13]=general/icon01.raw
Output[14]=bin/credits/credit00.raw

mkdir out/general
mkdir out/bin
mkdir out/bin/titles
mkdir out/bin/end
mkdir out/bin/credits

# Convert images
for i in ${!Input[*]}; do
	convert ${Input[$i]} -depth 8 rgb:out/${Output[$i]}
done
