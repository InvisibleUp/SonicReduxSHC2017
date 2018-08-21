This is the source code of the 2017 Sonic Hacking Contest release of Sonic Redux, a mod of Sonic R.

Feel free to use this for whatever you want. However,
    - You MUST credit me (as InvisibleUp).
    - You MUST NOT use the Sonic Redux branding on your own projects!

Note that basing future hacks on this is DISCOURAGED, as all future Sonic R modding will be done using MainMemory's mod loader and the 2004 version of the game. (This targets the 1998 version of the game with a very hackish C script.)

There's a disassembly of Sonic R 1998 for your reference hosted at https://github.com/InvisibleUp/SonicR-Disasm and various conversion utilties at https://github.com/InvisibleUp/Sonic-R-Utilities

Yes, I'm aware the character models are kind of crap. I tried.

HOW TO BUILD
------------

You will most likely require a Linux or macOS system to build, although it will build on Windows with some effort. (Try the Windows Subsystem for Linux on Windows 10 if you get stuck.) You will need Blender, ImageMagick, the GNU binutils and compilers, Python 3, and a BASH shell.

    CODE
    - Compile Code/build.c
    - Run Code/build.c
    - Copy the resulting "REDUX.EXE" to your Sonic R installation directory
    
    MENU ART
    - Run Art/build.sh
    - Copy contents of Art/out to your Sonic R installation directory
    
    CHARACTER MODELS
    - Follow instructions in CharModels/readme.txt
    
Note that I also hex-edited some files directly (namely the 3D models in the menus) so I don't really have a build process for those.