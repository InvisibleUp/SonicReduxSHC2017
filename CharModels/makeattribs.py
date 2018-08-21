#!/usr/bin/python3

import argparse
from struct import *
import os

parser = argparse.ArgumentParser(
	description=' Takes an attributes CSV as input and outputs the properly formatted attribute file (.DAT).')
parser.add_argument('source',
	help='.CSV file containing model attributes')
parser.add_argument('dest', nargs='?',
	help='.DAT file to output to.')
args = parser.parse_args()
if args.dest == None:
	args.dest = os.path.splitext(args.source)[0] + ".dat"
	
# Open input and output
try:
	f = open(args.source, 'r')
	o = open(args.dest, 'wb')
except OSError:
	print ("One of the files specified was either not found or on a read-only disk.")
	raise SystemExit

LineArray = []

# Read and dump
#line = f.readline
#value = line.split(',')[1]

for line in f:
	if len(line.split(',')) != 2:
		continue
	LineArray.append( (line.split(',')[0], line.split(',')[1]) )
f.close()

# Magic
value = (LineArray[[x[0] for x in LineArray].index("Magic")][1]).strip()

if value != "SRM1":
	print ("This version of MakeAttribs is designed only for use with SRM1-formatted attribute files.")
	print ("Your file is formatted as ", value)
	raise SystemExit
o.write(bytes(value, "ASCII"))

# Long Name
value = (LineArray[[x[0] for x in LineArray].index("Long Name")][1]).strip()
value = value[0:31].ljust(27, '\0')
o.write((bytes("@1" + value + '@x\0', "ASCII")))
	
# Short Name
value = (LineArray[[x[0] for x in LineArray].index("Short Name")][1]).strip()
value = value[0:7].ljust(7)
o.write((bytes(value + '\0', "ASCII")))
	
# Base Color
# Convert from 0x00RrGgBb to 0xArRgGbB0
# I'll assume it's simple and I don't have to reverse the nybbles.
value = (LineArray[[x[0] for x in LineArray].index("Primary Color")][1]).strip()
value = ((int(value, 16)) + 0xFF000000) % 0xFFFFFFFF
o.write(pack('I', value))

# Accent Color
value = (LineArray[[x[0] for x in LineArray].index("Accent Color")][1]).strip()
value = ((int(value, 16)) + 0xFF000000) % 0xFFFFFFFF
o.write(pack('I', value))

# ModelHeight, ShadowSize
value = (LineArray[[x[0] for x in LineArray].index("Model Height")][1]).strip()
value = int(value) % 0xFFFFFFFF
o.write(pack('I', value))

value = (LineArray[[x[0] for x in LineArray].index("Shadow Size")][1]).strip()
value = int(value) % 0xFFFFFFFF
o.write(pack('I', value))
	
# Physics attributes
value = (LineArray[[x[0] for x in LineArray].index("Top Speed")][1]).strip()
value = int(value) % 0xFFFFFFFF
o.write(pack('I', value))

value = (LineArray[[x[0] for x in LineArray].index("Accel")][1]).strip()
value = int(value) % 0xFFFFFFFF
o.write(pack('I', value))

value = (LineArray[[x[0] for x in LineArray].index("Drift Speed")][1]).strip()
value = int(value) % 0xFFFFFFFF
o.write(pack('I', value))

value = (LineArray[[x[0] for x in LineArray].index("Turn Speed")][1]).strip()
value = int(value) % 0xFFFFFFFF
o.write(pack('I', value))

value = (LineArray[[x[0] for x in LineArray].index("Turn Traction")][1]).strip()
value = int(value) % 0xFFFFFFFF
o.write(pack('I', value))

value = (LineArray[[x[0] for x in LineArray].index("Deaccel")][1]).strip()
value = int(value) % 0xFFFFFFFF
o.write(pack('I', value))

value = (LineArray[[x[0] for x in LineArray].index("Jump Height")][1]).strip()
value = int(value) % 0xFFFFFFFF
o.write(pack('I', value))

value = (LineArray[[x[0] for x in LineArray].index("Roll Accel")][1]).strip()
value = int(value) % 0xFFFFFFFF
o.write(pack('I', value))

value = (LineArray[[x[0] for x in LineArray].index("Water Top Speed")][1]).strip()
value = int(value) % 0xFFFFFFFF
o.write(pack('I', value))

value = (LineArray[[x[0] for x in LineArray].index("Unk Attrib")][1]).strip()
value = int(value) % 0xFFFFFFFF
o.write(pack('I', value))

value = (LineArray[[x[0] for x in LineArray].index("Fall Accel")][1]).strip()
value = int(value) % 0xFFFFFFFF
o.write(pack('I', value))

value = (LineArray[[x[0] for x in LineArray].index("Fall Max")][1]).strip()
value = int(value) % 0xFFFFFFFF
o.write(pack('I', value))

value = (LineArray[[x[0] for x in LineArray].index("Weather Penalty")][1]).strip()
value = int(value) % 0xFFFFFFFF
o.write(pack('I', value))

# Blank bytes for action function pointers
o.write(pack('I', 0)) # OnEach()
o.write(pack('I', 0)) # OnAction()

# Padding
for i in range(0, (128 // 4) - (o.tell() // 4)):
	o.write(pack('I', 0))
