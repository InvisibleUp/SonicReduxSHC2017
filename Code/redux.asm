.intel_syntax noprefix
.text

#; Don't clear BoostBar RAM during Challenge races
.org 0x41E040
.org 0x41E04D, 0x90

.org 0x41E354
.org 0x41E36E, 0x90

#; No idea what this is, but it overwrites the CPU players model tint
.org 0x421100
ret

#; Don't animate jets. I don't feel like finding which polygon goes to what.
.org 0x42179E
loc_42179E:

dec esi
jnz loc_42179E
pop ebp
pop edi
pop esi
ret 4
.org 0x4217F8, 0x90
ret

#; Malloc-sub_4217F8
.org 0x42185C
imul eax, ebx, 48
push edi
shl esi, 0x10
mov ebx, esi
add eax, dword ptr [CharModel_VertexPtr] #;CHECKME
.org 0x421873, 0x90

.org 0x4218C1
imul eax, edi, 48
and ebx, 3
shl ebx, 3
add ebx, 0x80
shl ebx, 0x10
push esi
add eax, dword ptr [CharModel_VertexPtr]
.org 0x4218DF, 0x90

.org 0x42194F
add eax, dword ptr [CharModel_VertexPtr]
.org 0x421955, 0x90

#; Malloc-sub_421968
.org 0x4219CA
lea edx, [eax*2 + eax]
mov eax, dword ptr [CharModel_VertexPtr]
add ebx, 0x7F
inc ebx
.org 0x4219DE, 0x90

#; Malloc-sub_4219FC
.org 0x421A5E
lea edx, [eax*2 + eax]
mov eax, dword ptr [CharModel_VertexPtr]
add ebx, 0x7F
inc ebx
.org 0x421A72, 0x90
	
#; Malloc-sub_421A90
.org 0x421AF2
lea edx, [eax*2 + eax]
mov eax, dword ptr [CharModel_VertexPtr]
add ebx, 0x7F
inc ebx
.org 0x421B06, 0x90

#; Disable camera button adjusting camera
.org 0x42431C
ret

.org 0x42AD10
D3D_LoadTexturePage:

.org 0x42E034
Parse3DCharacter:

#; Malloc-Parse3DCharacters
.org 0x42E053

imul eax, [Game_ModelCount], 80
#add eax, [Sonic_ModelAttribBasePtr]
add eax, OFFSET Sonic_ModelAttribBasePtr
#mov eax, [eax]
mov [ebp-52], eax

imul eax, [Game_PartCount], 24
add eax, [CharModel_QuadPtr]
#mov eax, [eax]
mov [ebp-36], eax

imul edi, [Game_QuadCount], 48
add edi, [CharModel_VertexPtr]
#mov edi, [edi]

mov eax, [Game_VertexCount]
shl eax, 6
add eax, [CharModel_BasePtr]
#mov eax, [eax]
mov [ebp-32], eax
.org 0x42E0BB, 0x90

.org 0x42E78C
Parse3DAnimations:

#; Malloc-Parse3DAnimations
.org 0x42E796
mov edi, eax
mov [ebp-0x18], edx

imul esi, edx, 80
#add esi, dword ptr [Sonic_ModelAttribBasePtr]
add esi, OFFSET Sonic_ModelAttribBasePtr
mov [ebp-0x14], esi

imul esi, ds:Game_AnimFrameCount, 24
add esi, dword ptr [AnimFrames_BasePtr]

mov edx, offset 0x005201A0
mov eax, edi
call fopen_
.org 0x42e7d6, 0x90

#; Malloc-Parse3DGourads
.org 0x42E834
Parse3DGourads:

.org 0x42E85E
imul esi, ecx, 384
add esi, dword ptr [Sonic_GouradPtr]
xor edi, edi
.org 0x42e873, 0x90


#; Malloc-sub_430638
.org 0x430638
Char_MenuShade:
ret

; Commented out because I can't figure out how to disable backface culling
/*push    ebx
push    ecx
push    edx
push    esi
push    edi

mov     edx, [eax+0x10]
mov     edi, 0x1F
sar     edx, 7
sub     edi, edx

movsx   edx, word ptr [eax+0xF2]
cmp edx, 7
jg Char_MenuShade.ret
push edx

lea     eax, [edx*4]
add     eax, edx
mov     edx, offset Sonic_ModelAttribBasePtr
shl     eax, 4
add     edx, eax
mov     ecx, [edx+0x24]
lea     eax, [ecx*4]
mov     ebx, [edx+0x28]
sub     eax, ecx
mov     ecx, ebx
imul    ecx, edi
mov     esi, [Sonic_GouradPtr]
shl     eax, 7
add     esi, eax
lea     eax, [ecx*4]
mov     edx, [edx+0x24]
sub     eax, ecx
shl     edx, 6
shl     eax, 2
add     edx, [CharModel_BasePtr]
add     eax, esi

pop esi

Char_MenuShade.L1:
#mov     ecx, [eax]
xor ecx, ecx
dec cl

mov     [edx+8], ecx
#mov     ecx, [eax+4]
mov     [edx+0x0C], ecx
add     edx, 0x40
#mov     ecx, [eax+8]
add     eax, 0x0C
mov     [edx-0x30], ecx
dec     ebx
jnz     short Char_MenuShade

Char_MenuShade.ret:
pop     edi
pop     esi
pop     edx
pop     ecx
pop     ebx
ret*/

#; There's a whole bunch of unused space afterwards. Nice.
Unused4:
.org 0x430A0C

#; Malloc-Tint3DGourads
.org 0x430BDC
TintCharacterGourads:
.org 0x430CB7
add eax, 0x1000
shl edx, 5
mov [ebp-0x18], eax
mov eax, dword ptr [Sonic_GouradPtr]
cmp dword ptr ds:RenderMode, 2
.org 0x430cd0, 0x90
#ret

#; Malloc-sub_430ED4
.org 0x430F37
imul esi, 512
add esi, dword ptr [Sonic_GouradPtr]
.org 0x430f4a, 0x90

.org 0x430F5F
add eax, dword ptr [CharModel_BasePtr]
cmp dword ptr ds:Game_Course, 5
.org 0x430f6d, 0x90

#; DebugText_Write patch
. = 0x431140
jmp DebugText_Write
nop

#; Unused space for whatever
. = 0x43BF6C

#; InitHook for other stuff
InitLoop:
	push	ebp
	mov	ebp, esp
	push	ebx
	push	edx
	xor	ebx, ebx
InitLoop.L2:
	cmp	ebx, OFFSET FLAT:HookCount
	jge	InitLoop.L6
	mov	eax, OFFSET FLAT:HookAddr
	lea	eax, [eax+ebx*4]
	inc	ebx
	mov eax, [eax]
	call	eax
	jmp	InitLoop.L2
InitLoop.L6:
	pop	eax
	pop	ebx
	pop	ebp
	ret

#; Debug Text Viewer init 
DebugText_Init:
	push	ebp
	mov	ebp, esp
	push	edi
	push	esi
	push	ebx
	sub	esp, 40
	push	OFFSET FLAT:MSVCRT
	call	LoadLibraryA
	push	OFFSET FLAT:KERNEL32
	mov	esi, eax
	call	LoadLibraryA
	sub	esp, 12
	mov	ebx, eax
	push	OFFSET FLAT:FREOPEN
	push	esi
	call	GetProcAddress
	push	OFFSET FLAT:ALLOCCONSOLE
	push	ebx
	mov	edi, eax
	call	GetProcAddress
	push	OFFSET FLAT:FREELIBRARY
	push	ebx
	mov	DWORD PTR [ebp-36], eax
	call	GetProcAddress
	push	OFFSET FLAT:__IOB_FUNC
	push	esi
	mov	DWORD PTR [ebp-28], eax
	call	GetProcAddress
	mov	ecx, DWORD PTR [ebp-36]
	add	esp, 24
	mov	DWORD PTR [ebp-32], eax
	call	ecx
	mov	edx, DWORD PTR [ebp-32]
	call	edx
	add	eax, 148
	push	edx
	push	eax
	push	OFFSET FLAT:W
	push	OFFSET FLAT:CONOUT
	call	edi
	mov	DWORD PTR [esp], esi
	call	[DWORD PTR [ebp-28]]
	push	ebx
	call	[DWORD PTR [ebp-28]]
	add	esp, 12
	lea	esp, [ebp-12]
	pop	ebx
	pop	esi
	pop	edi
	pop	ebp
	ret
	
#; Debug Text Viewer write
DebugText_Write:
	push	ebp
	mov	ebp, esp
	push	edi
	push	esi
	push	ebx
	sub	esp, 40
	push	OFFSET FLAT:MSVCRT
	call	LoadLibraryA
	push	OFFSET FLAT:KERNEL32
	mov	edi, eax
	call	LoadLibraryA
	sub	esp, 12
	mov	esi, eax
	push	OFFSET FLAT:VPRINTF
	push	edi
	call	GetProcAddress
	push	OFFSET FLAT:FREELIBRARY
	push	esi
	mov	DWORD PTR [ebp-28], eax
	call	GetProcAddress
	mov	ebx, eax
	lea	eax, [ebp+12]
	mov	edx, DWORD PTR [ebp-28]
	push	eax
	push	DWORD PTR [ebp+8]
	call	edx
	add	esp, 20
	push	edi
	call	ebx
	push	esi
	call	ebx
	add	esp, 12
	lea	esp, [ebp-12]
	pop	ebx
	pop	esi
	pop	edi
	pop	ebp
	ret

GetFileMatchCount:
	push	ebp
	mov	ebp, esp
	push	edi
	push	esi
	push	ebx
	lea	ebx, [ebp-600]
	sub	esp, 616
	mov	al, BYTE PTR [ebp+8]
	push	OFFSET FLAT:KERNEL32
	mov	BYTE PTR [ebp-609], al
	call	LoadLibraryA
	sub	esp, 12
	mov	esi, eax
	push	OFFSET FLAT:FINDFIRST
	push	eax
	call	GetProcAddress
	push	OFFSET FLAT:FINDNEXT
	push	esi
	mov	edi, eax
	call	GetProcAddress
	push	OFFSET FLAT:FREELIBRARY
	push	esi
	mov	DWORD PTR [ebp-604], eax
	call	GetProcAddress
	push	DWORD PTR [ebp+12]
	push	ebx
	mov	DWORD PTR [ebp-608], eax
	call	lstrcpyA
	push	DWORD PTR [ebp+16]
	push	ebx
	call	lstrcatA
	lea	eax, [ebp-344]
	push	eax
	push	ebx
	xor	ebx, ebx
	call	edi
	add	esp, 32
	cmp	eax, -1
	je	GetFileMatchCount.L2
	mov	edi, eax
GetFileMatchCount.L6:
	cmp	BYTE PTR [ebp-300], 46
	je	GetFileMatchCount.L3
	cmp	BYTE PTR [ebp-609], 0
	je	GetFileMatchCount.L4
	xor	eax, eax
	test	BYTE PTR [ebp-344], 16
	setne	al
	add	ebx, eax
	jmp	GetFileMatchCount.L5
GetFileMatchCount.L4:
	inc	ebx
GetFileMatchCount.L5:
	lea	eax, [ebp-300]
	sub	esp, 12
	push	eax
	call	DebugText_Write
    push    offset NEWLINE
	call    DebugText_Write
	add	esp, 16
GetFileMatchCount.L3:
	push	eax
	push	eax
	lea	eax, [ebp-344]
	push	eax
	push	edi
	call	[DWORD PTR [ebp-604]]
	test	eax, eax
	pop	edx
	pop	ecx
	jne	GetFileMatchCount.L6
GetFileMatchCount.L2:
	sub	esp, 12
	push	esi
	call	[DWORD PTR [ebp-608]]
	lea	esp, [ebp-12]
	mov	eax, ebx
	
	pop	ebx
	pop	esi
	pop	edi
	pop	ebp
	ret

#; Load SRM1 formatted sttribute files
#; INPUT
#; EAX: File path
#; EBX: Character slot #
LoadAttribs:
    push ebp
    mov ebp, esp
    push ebx
    push edx
    push ecx
    push esi
    push edi
    
    mov edx, offset aRb
    call fopen_
    mov [CurrentFile], eax
    test eax, eax
    jz LoadAttribs_Return

    #; Get proper memory address for this attribute
    shl ebx, 7
    add ebx, offset CharModel_AttribStart
    
    #; Prepare for read
    mov ecx, eax # File
    mov eax, ebx # Write location
    mov ebx, 128 # Size 1
    mov edx, 1   # Size 2
    call fread_
    
LoadAttribs_Return:
    mov eax, [CurrentFile]
    call fclose_
    pop edi
    pop esi
    pop ecx
    pop edx
    pop ebx
    pop ebp
    ret
    
#; Display character portraits on character select screen instead of models
#; because model backface culling is hard...

#; Load texture
CharSelect_LoadTex:
    call D3D_LoadTexturePage
    mov eax, 0x13
    mov edx, offset CharSelect_Portraits
    call D3D_LoadTexturePage
    
    mov eax, 0x14
    mov [0x6DA61C], eax
    mov edx, offset 0x532F05 #; credits00.raw
    call D3D_LoadTexturePage
    
    call sub_4D9DD0
    
    jmp loc_48CAFA #; As if nothing happened
    
#; Draw text to a given point on the screen!
#; I'm reworking the existing function Credits_ShowTextLine
#; INPUT:
#;      EAX - Text to draw (in credits format)
#;      EBX - X position (screen coords, center of text)
#;      ECX - Y position (screen coords, center of text)
Generic_DrawText:
    #GivenXOffset    = -0x6C #; New, may cause crash?
    var_68          = -0x68
    var_64          = -0x64
    var_60          = -0x60
    var_5C          = -0x5C
    var_58          = -0x58
    var_54          = -0x54 #; Doubling as given X offset
    var_50          = -0x50
    var_4C          = -0x4C
    TextLine        = -0x48
    var_44          = -0x44
    var_40          = -0x40
    var_3C          = -0x3C
    NextChar        = -0x38
    var_34          = -0x34
    var_30          = -0x30
    var_2C          = -0x2C
    YOffset         = -0x28
    XOffset         = -0x24
    var_20          = -0x20
    StringPtr       = -0x1C
    var_18          = -0x18
    var_14          = -0x14

    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0x54
    
    #; X offset
    shl ebx #; For some reason we need to divide by 2
    mov [ebp-0x54], ebx
    
    #; Y offset
    sub ecx, 240
    mov [ebp+YOffset], ecx

    #; Everything else
    mov ebx, offset 0x006DB834
    xor edx, edx
    mov ecx, edx
    mov cl, 0x25 #; No logos!
    xor esi, esi
    mov [ebp-0x48], ecx
    mov [ebp-0x40], edx
    mov [ebp-0x38], edx
    mov [ebp-0x44], edx
    mov [ebp-0x64], edx
        
    #mov ecx, offset GDT_Test
    mov ecx, eax

loc_4DAB53:                             #;CODE XREF: Credits_ShowTextLine+15Bj
    mov     eax, [ebp+NextChar]
    mov     eax, ds:(0x5050D8+2)[eax*2]
    sar     eax, 0x10
    mov     [ebp+var_2C], eax
    
    #; X offset
    mov eax, [ebp-0x54]
    neg eax
    mov     [ebp+XOffset], eax
    
    mov     [ebp+StringPtr], ecx
    mov     ah, [ecx]
    xor     edi, edi
    cmp     ah, '@'         #;Control character?
    jnz     loc_4DAC84

loc_4DAB78:                             #;CODE XREF: Credits_ShowTextLine+190j
#    mov     eax, [ebp+var_44]
#    mov     eax, Ending_LogoXPosTable[eax]
#    sar     eax, 0x10
    xor eax, eax # Don't lookup X offset
    mov     [ebp+var_60], eax
    mov     eax, [ebp+XOffset]
    mov     edx, eax
    sar     edx, 0x1F
    sub     eax, edx
    sar     eax, 1
    mov     edx, [ebp+var_60]
    sub     edx, eax
    mov     eax, [ebp+var_64]
    mov     [ebp+var_20], edx
    test    eax, eax
    jz      loc_4DAC30
    xor     edx, edx
    mov     [ebp+var_18], edx
    test    edi, edi
    jg      short loc_4DABB4
    jmp     loc_4DAC30
##; --------------------------------------------------------------------------

loc_4DABB4:                             #;CODE XREF: Credits_ShowTextLine+89j
    imul    eax, [ebp+NextChar], 0x600
    mov     edx, offset CharPos_Small
    add     edx, eax
    mov     [ebp+var_30], edx

loc_4DABC5:                             #;CODE XREF: Credits_ShowTextLine+10Aj
    cmp     esi, 0x400
    jz      loc_4DACBC
    mov     edx, [ebp+StringPtr]
    xor     eax, eax
    mov     al, [edx]
    imul    eax, 6
    add     eax, [ebp+var_30]
    movsx   edx, word ptr [eax]
    cmp     edx, 0xFFFFFFFF
    jz      short loc_4DAC1E
    mov     edx, [ebp+var_20]
    mov     [ebx], dx
    mov     edx, [ebp+YOffset]
    mov     [ebx+2], dx
    mov     dl, [eax]
    mov     [ebx+4], dl
    mov     dl, [eax+2]
    mov     [ebx+5], dl
    mov     dl, [eax+4]
    mov     [ebx+6], dl
    mov     dl, byte ptr [ebp+var_2C]
    mov     [ebx+7], dl
    mov     eax, [eax+2]
    sar     eax, 0x10
    mov     edx, [ebp+var_20]
    add     eax, eax
    add     ebx, 8
    add     edx, eax
    inc     esi
    mov     [ebp+var_20], edx

loc_4DAC1E:                             #;CODE XREF: Credits_ShowTextLine+C0j
    mov     eax, [ebp+StringPtr]
    mov     edx, [ebp+var_18]
    inc     eax
    inc     edx
    mov     [ebp+StringPtr], eax
    mov     [ebp+var_18], edx
    cmp     edi, edx
    jg      short loc_4DABC5

loc_4DAC30:                             #;CODE XREF: Credits_ShowTextLine+7Cj
                            #;Credits_ShowTextLine+8Bj
    mov     eax, [ebp+var_2C]
    mov     dh, [ecx+1]
    add     eax, eax
    cmp     dh, 'x'         #;Control Char is 'x'
    jnz     short loc_4DAC45
    add     [ebp+var_40], eax
    jmp     loc_4DACBC
##; --------------------------------------------------------------------------

loc_4DAC45:                             #;CODE XREF: Credits_ShowTextLine+117j
    cmp     [ebp+var_64], dword ptr 0
    jz      short loc_4DAC60
    mov     edx, [ebp+var_40]
    add     eax, 6
    mov     edi, [ebp+YOffset]
    add     edx, eax
    add     edi, eax
    mov     [ebp+var_40], edx
    mov     [ebp+YOffset], edi
    jmp     short loc_4DAC67
##; --------------------------------------------------------------------------

loc_4DAC60:                             #;CODE XREF: Credits_ShowTextLine+125j
    mov     [ebp+var_64], dword ptr 1

loc_4DAC67:                             #;CODE XREF: Credits_ShowTextLine+13Aj
    cmp     byte ptr [ecx+1], 0x30
    jnz     short loc_4DAC71
    xor     eax, eax
    jmp     short loc_4DAC79
##; --------------------------------------------------------------------------

loc_4DAC71:                             #;CODE XREF: Credits_ShowTextLine+147j
    xor     eax, eax
    mov     al, [ecx+1]
    sub     eax, 48

loc_4DAC79:                             #;CODE XREF: Credits_ShowTextLine+14Bj
    mov     [ebp+NextChar], eax
    add     ecx, 2
    jmp     loc_4DAB53
##; --------------------------------------------------------------------------

loc_4DAC84:                             #;CODE XREF: Credits_ShowTextLine+4Ej
    mov     edx, [ebp+NextChar]
    imul    eax, edx, 0x600
    mov     [ebp+var_34], eax

loc_4DAC90:                             #;CODE XREF: Credits_ShowTextLine+196j
    xor     eax, eax
    mov     al, [ecx]       #;al = '@'
    imul    eax, 6
    add     eax, [ebp+var_34]
    mov     eax, (CharPos_Small + 2)[eax]
    sar     eax, 0x10
    mov     edx, [ebp+XOffset]
    add     eax, eax
    add     edx, eax
    inc     ecx
    mov     [ebp+XOffset], edx
    mov     dl, [ecx]
    inc     edi
    cmp     dl, '@'
    jz      loc_4DAB78
    jmp     short loc_4DAC90
##; --------------------------------------------------------------------------

loc_4DACBC:                             #;CODE XREF: Credits_ShowTextLine+A7j
                            #;Credits_ShowTextLine+11Cj
    mov     edx, [ebp+TextLine]
    xor     eax, eax
    mov     ebx, 0xFFFFFFFF
    mov     al, 0x504300[edx]
    mov     [ebp+var_4C], ebx
    cmp     eax, 1
    jnz     short loc_4DACFF
    mov     edx, 0x80
    mov     ebx, 0x69
    mov     ecx, 0x50
    mov     edi, [ebp+var_40]
    xor     eax, eax
    mov     [ebp+var_68], edx
    mov     [ebp+var_50], ebx
    mov     [ebp+var_54], ecx
    add     edi, 0xC0
    mov     [ebp+var_4C], eax
    mov     [ebp+var_40], edi
    jmp     short loc_4DAD6A
##; --------------------------------------------------------------------------

loc_4DACFF:                             #;CODE XREF: Credits_ShowTextLine+1AEj
    cmp     eax, 2
    jnz     short loc_4DAD2F
    mov     edx, 0x80
    mov     ebx, 0x82
    mov     ecx, 0x28
    mov     edi, [ebp+var_40]
    mov     eax, 0x69
    mov     [ebp+var_68], edx
    mov     [ebp+var_50], ebx
    mov     [ebp+var_54], ecx
    add     edi, 0x70
    mov     [ebp+var_4C], eax
    mov     [ebp+var_40], edi
    jmp     short loc_4DAD6A
##; --------------------------------------------------------------------------

loc_4DAD2F:                             #;CODE XREF: Credits_ShowTextLine+1DEj
    cmp     eax, 3
    jnz     short loc_4DAD62
    mov     edx, 0xA8
    mov     ebx, 0x70
    mov     ecx, 0x48
    mov     edi, [ebp+var_40]
    mov     eax, 0x69
    mov     [ebp+var_68], edx
    mov     [ebp+var_50], ebx
    mov     [ebp+var_54], ecx
    add     edi, 0xB0
    mov     [ebp+var_4C], eax
    mov     [ebp+var_40], edi
    jmp     short loc_4DAD6A
##; --------------------------------------------------------------------------

loc_4DAD62:                             #;CODE XREF: Credits_ShowTextLine+20Ej
    xor     ecx, ecx
    mov     [ebp+var_54], ecx
    mov     [ebp+var_50], ecx

loc_4DAD6A:                             #;CODE XREF: Credits_ShowTextLine+1D9j
                            #;Credits_ShowTextLine+209j ...
    mov     eax, [ebp+TextLine]
    mov     edx, ds:Ending_LogoXPosTable[eax*4]
    mov     ebx, [ebp+var_50]
    sar     edx, 0x10
    sub     edx, ebx
    mov     ebx, ds:(Ending_LogoXPosTable+2)[eax*4]
    mov     eax, [ebp+var_40]
    mov     [ebp+var_5C], edx
    mov     edx, eax
    sar     edx, 0x1F
    sub     eax, edx
    sar     eax, 1
    sar     ebx, 0x10
    mov     ecx, [ebp+var_4C]
    sub     ebx, eax
    mov     eax, [ebp+var_54]
    mov     [ebp+var_58], ebx
    add     eax, eax
    cmp     ecx, 0xFFFFFFFF
    jz      short loc_4DADAA
    add     eax, 0x20

loc_4DADAA:                             #;CODE XREF: Credits_ShowTextLine+281j
    lea     edx, [ebx+eax]
    mov     [ebp+YOffset], edx
    mov     eax, offset Credits_CharRenderTable
    xor     ebx, ebx
    test    esi, esi        #;Characters to render?
    jle     short loc_4DADD0
    mov     edx, [ebp+YOffset]

loc_4DADBE:                             #;CODE XREF: Credits_ShowTextLine+2AAj
    mov     cx, [eax+2]
    add     eax, 8
    add     ecx, edx
    inc     ebx
    mov     [eax-6], cx
    cmp     ebx, esi
    jl      short loc_4DADBE

loc_4DADD0:                             #;CODE XREF: Credits_ShowTextLine+295j
    mov     edi, offset Credits_CharRenderTable

loc_4DAEC3:                             #;CODE XREF: Credits_ShowTextLine+2B9j
    xor     ebx, ebx
    test    esi, esi
    jle     short loc_4DAF0F

loc_4DAEC9:                             #;CODE XREF: Credits_ShowTextLine+3E9j
    push    0x0FFE0E0E0      #;Render character (D3D)
    xor     edx, edx
    xor     eax, eax
    mov     dl, [edi+7]
    xor     ecx, ecx
    push    edx
    mov     al, [edi+6]
    mov     cl, [edi+5]
    push    eax
    push    ecx
    xor     ecx, ecx
    mov     cl, [edi+4]
    push    ecx
    mov     ecx, ds:Ending_TextTexPage
    push    ecx
    add     edx, edx
    push    edx
    add     eax, eax
    add     edi, 8
    push    eax
    mov     edx, [edi-8]    #;EDI-8 = XXXXYYYY
    push    0x40FA0000
    sar     edx, 0x10
    movsx   eax, word ptr [edi-8]
    inc     ebx
    call    D3D_Render2DObject
    cmp     ebx, esi
    jl      short loc_4DAEC9

loc_4DAF0F:                             #;CODE XREF: Credits_ShowTextLine+3A3j
    mov     esi, [ebp+TextLine]
    cmp     esi, 0x24
    jnz     short loc_4DAF90
    push    0x0FFE0E0E0
    push    0x48
    push    0x70
    push    0xA8
    push    0x69
    mov     edi, ds:Ending_TextTexPage
    push    edi
    mov     eax, ds:Ending_LogoXPosTable[esi*4]
    push    0x90
    sar     eax, 0x10
    push    0xE0
    mov     edx, 0x30
    sub     eax, 0x70
    push    0x44FA0000
    call    D3D_Render2DObject #;Sonic R
    push    0x0FFE0E0E0
    push    0x50
    push    0x69
    push    0x80
    push    0
    mov     eax, ds:Ending_TextTexPage
    push    eax
    push    0xA0
    mov     eax, ds:Ending_LogoXPosTable[esi*4]
    push    0xD2
    sar     eax, 0x10
    mov     edx, 0x118
    sub     eax, 0x69
    push    0x44FA0000
    call    D3D_Render2DObject #;Traveller's Tales

loc_4DAF90:                             #;CODE XREF: Credits_ShowTextLine+31Aj
                            #;Credits_ShowTextLine+39Aj ...
    cmp     [ebp+var_4C], dword ptr 0xFFFFFFFF
    jz      short loc_4DB009
    mov     edx, [ebp+var_54]
    mov     eax, [ebp+var_50]
    add     edx, edx
    add     eax, eax

loc_4DAFDB:                             #;CODE XREF: Credits_ShowTextLine+485j
    push    0x0FFE0E0E0
    mov     ebx, [ebp+var_54]
    push    ebx
    mov     ecx, [ebp+var_50]
    push    ecx
    mov     esi, [ebp+var_68]
    push    esi
    mov     edi, [ebp+var_4C]
    push    edi
    mov     ebx, ds:Ending_TextTexPage
    push    ebx
    push    edx
    push    eax
    mov     edx, [ebp+var_58]
    mov     eax, [ebp+var_5C]
    push    0x44FA0000
    call    D3D_Render2DObject

loc_4DB009:                             #;CODE XREF: Credits_ShowTextLine+470j
                            #;Credits_ShowTextLine+4B5j
    lea     esp, [ebp-0x14]
    pop     edi
    pop     esi
    pop     edx
    pop     ecx
    pop     ebx
    pop     ebp
    ret
    
CharSelect_DispPortrait:

    #; get identity
    mov eax, [edi+0xF2]
    push eax
    mov ebx, eax
    xor ecx, ecx

    push 0xFFE0E0E0 #; Tint
    mov cl, 128
    push ecx #; Height
    #push 128
    push 64 #; Width
    
    shr eax, 2 #; / 4
    shl eax, 7 #; * 128
    push eax   #; Y-position in tileset
    
    and ebx, 3 #; % 4
    shl ebx, 6 #; * 64
    push ebx   #; X-position in tileset
    
    push 0x13 #; Tileset used
    
    mov cl, 255
    inc cx
    push ecx #; Y size
    #push 256
    shr cx
    push ecx #; X size
    #push 128
    
    #; x = (640 / ESI) * i + [(640 / ESI) / 2]
    mov ecx, [ebp-0x48]
    
    #; Increment i now because we are really low on room
    #inc ecx
    #mov [ebp-0x48], ecx
    
    mov eax, 640
    xor edx, edx
    idiv esi
    imul ecx, eax
    sar eax
    add eax, ecx
    mov ecx, eax #; Store X position for text
    sub eax, 64  #; X position
    
    mov dl, 80 #; Y position
    
    push 0x43FA0000 #; Z pos
    
    call D3D_Render2DObject
    
    #; Char text
    mov eax, offset (CharModel_AttribStart + 4) #; Skip SRM1 header
    #mov ebx, [edi+0xF2]
    pop ebx
    shl ebx, 7
    add eax, ebx
    
    mov ebx, ecx #; X
    mov ecx, 336 #; Y
    
    #; Stagger Y
    mov edx, [ebp-0x48]
    and edx, 1
    shl edx, 5
    sub ecx, edx
    
    #mov eax, offset GDT_Test #; string
    
    call Generic_DrawText
    
    add edi, 0x71C 
    mov edx, [ebp-0x48]
    inc edx
    mov [ebp-0x48], edx
    cmp esi, edx
    jg CharSelect_DispPortrait
    jmp loc_48DB54
    
#; Draw the Boost Bar
BoostBar_Init:                          # @BoostBar_Init
# BB#0:
	push	edi
	push	esi
	push	eax
	mov	esi, dword ptr [esp + 16]
	mov	ecx, dword ptr [esp + 20]
	
	mov edi, ecx
	shl edi, 4
	
#; I'm being bad by hard-coding stuff. Don't have much choice, though...
BoostBar_Init_Tails:
	cmp cl, 1 #; Tails
	jnz BoostBar_Init_Blaze
    mov dword ptr [esi], 2 #; Min = 2
	mov dword ptr [esi+4], 60 #; Max = 60
	mov dword ptr [esi+24], esi 
	add dword ptr [esi+24], 128 #; Flight meter adjusted for display
	jmp BoostBar_Init_SrcDone
	
BoostBar_Init_Blaze:
	cmp cl, 7 #; Blaze
	jnz BoostBar_Init_Silver
    mov dword ptr [esi], 0 #; Min = 0
	mov dword ptr [esi+4], 300 #; Max = 300
	mov dword ptr [esi+24], esi #; Boost meter
	add dword ptr [esi+24], 128
	jmp BoostBar_Init_SrcDone
	
BoostBar_Init_Silver:
	cmp cl, 6 #; Silver
	jnz BoostBar_Init_Amy
    mov dword ptr [esi], 0 #; Min = 0
	mov dword ptr [esi+4], 300 #; Max = 300
	mov dword ptr [esi+24], esi #; Hover timer
	add dword ptr [esi+24], 128
	jmp BoostBar_Init_SrcDone
	
BoostBar_Init_Amy:
	cmp cl, 3 #; Amy
	jnz BoostBar_Init_Fang
    mov dword ptr [esi], 0 #; Min = 0
	mov dword ptr [esi+4], 30 #; Max = 30
	mov dword ptr [esi+24], esi #; Hammer time left
	add dword ptr [esi+24], 128
	jmp BoostBar_Init_SrcDone
	
BoostBar_Init_Fang:
	cmp cl, 4 #; Fang
	jnz BoostBar_Init_Default
    mov dword ptr [esi], 0 #; Min = 0
	mov dword ptr [esi+4], 90 #; Max = 90
	mov dword ptr [esi+24], esi #; Gun cooldown
	add dword ptr [esi+24], 128
	jmp BoostBar_Init_SrcDone
	
BoostBar_Init_Default:
    mov dword ptr [esi], 0 #; Min = 0
	#;mov dword ptr [esi+4], 100 #; Max = 100
	mov dword ptr [esi+4], 0
	#;mov dword ptr [esi+24], 0x8FD50C #; Ring count
	mov dword ptr [esi+24], 0
	
BoostBar_Init_SrcDone:
	mov	dword ptr [esi + 36], edi
	mov	dword ptr [esi + 40], 216
	shl	ecx, 7
	mov	eax, [ecx + CharModel_AttribStart+48] #; Primary color
	mov	dword ptr [esi + 28], eax
	mov	eax, [ecx + CharModel_AttribStart+44] #; Secondary color
	mov	dword ptr [esi + 32], eax
	mov	eax, dword ptr [HUDTexPage]
	mov	dword ptr [esi + 44], eax
	mov	word ptr [esi + 8], 12352
	mov	byte ptr [esi + 10], 0
	lea	esi, [esi + 8]
	lea	eax, [ecx + CharModel_AttribStart+36] #; Short name
	sub	esp, 8
	push	eax
	push	esi
	call	lstrcatA
	#push	BoostBar_Draw.LC0
	#push	esi
	#call	lstrcatA
	mov word ptr [esi+14], 0x7840 #;"@x"
	add	esp, 12
	pop	esi
	pop	edi
	ret
	
BoostBar_Draw:                          # @BoostBar_Draw
# BB#0:
	push	ebp
	push	ebx
	push	edi
	push	esi
	sub	esp, 36
	mov	ecx, dword ptr [esp + 56]
	mov	eax, dword ptr [ecx + 308]
	mov	edi, dword ptr [ecx + 320]
	mov	ebp, dword ptr [ecx + 324]
	mov	edx, dword ptr [ecx + 328]
	test	eax, eax
	je	BoostBar_Draw.LBB1_1
# BB#2:
	mov	eax, dword ptr [eax]
	mov	esi, dword ptr [ecx + 288]
	mov	dword ptr [esp + 16], 100 # 4-byte Folded Spill
	cmp	eax, esi #; src <= input->max?
	jg	BoostBar_Draw.LBB1_4
# BB#3:
	sub	esi, dword ptr [ecx + 284]
    imul	eax, eax, 100
	mov	ebx, edx
	cdq
	idiv	esi
	mov	edx, ebx
	mov	dword ptr [esp + 16], eax # 4-byte Spill
	cmp	dword ptr [Game_HudStyle], 0
	jne	BoostBar_Draw.LBB1_5
	jmp	BoostBar_Draw.LBB1_6
BoostBar_Draw.LBB1_1:
	mov	dword ptr [esp + 16], 0 # 4-byte Folded Spill
BoostBar_Draw.LBB1_4:
	cmp	dword ptr [Game_HudStyle], 0
	je	BoostBar_Draw.LBB1_6
BoostBar_Draw.LBB1_5:
	xor	ebx, ebx
	jmp	BoostBar_Draw.LBB1_7
BoostBar_Draw.LBB1_6:
	#mov	eax, dword ptr [Game_Course]
	#cmp	dword ptr [4*eax + CoinCollection], 2
	#setne	bl
	xor ebx, ebx
	inc bx
BoostBar_Draw.LBB1_7:
	mov	eax, dword ptr [Game_HUDTTStyle]
	mov	word ptr [esp + 24], 12352
	mov	dword ptr [esp + 27], 2017473839
	mov	byte ptr [esp + 31], 0
	test	bl, bl
	je	BoostBar_Draw.LBB1_9
# BB#8:
	mov	edx, dword ptr [Game_TaggedCharCount]
	add	edx, 48
	mov	edi, 176
	jmp	BoostBar_Draw.LBB1_11
BoostBar_Draw.LBB1_9:
	cmp	eax, 3
	jne	BoostBar_Draw.LBB1_12
# BB#10:
	mov	dl, byte ptr [ecx+0x1F4]
	add	dl, 48
	mov	edi, 128
BoostBar_Draw.LBB1_11:
	mov	byte ptr [esp + 26], dl
	mov	ebp, 112
	mov	edx, dword ptr [HUDTexPage]
BoostBar_Draw.LBB1_12:
	mov	dword ptr [esp + 32], ebx # 4-byte Spill
	cmp	eax, 3
	sete	byte ptr [esp + 3]      # 1-byte Folded Spill
	mov	eax, dword ptr [Game_WindowCount]
	cmp	dword ptr [Game_HUDSplitStyle], 0
	mov	esi, 174
	je	BoostBar_Draw.LBB1_14
# BB#13:
	mov	esi, 414
BoostBar_Draw.LBB1_14:
	mov	dword ptr [esp + 8], edx # 4-byte Spill
	mov	dword ptr [esp + 12], ebp # 4-byte Spill
	mov	dword ptr [esp + 4], edi # 4-byte Spill
	cmp	eax, 2
	je	BoostBar_Draw.LBB1_16
# BB#15:
	mov	esi, 414
BoostBar_Draw.LBB1_16:
	mov	ebp, dword ptr [ecx + 316]
	mov	eax, 16
	mov	edi, dword ptr [MISC00TexPage]
	mov	ebx, 0x41200000
	mov	edx, esi
	#APP (Boost bar)
	push	ebp
	push	32
	push	128
	push	48
	push	96
	push	edi
	push	64
	push	256
	push	ebx
	call	D3D_Render2DObject
	#NO_APP
	mov	ebx, 0x41100000
	mov	eax, 18
	mov	edi, dword ptr [ecx + 312]
	mov	ebp, dword ptr [MISC00TexPage]
	lea edx, [esi]
	#APP (Icon BG)
	push	edi
	push	27
	push	27
	push	48
	push    224
	push	ebp
	push	54
	push	54
	push	ebx
	call	D3D_Render2DObject
	#NO_APP
	mov	eax, 27
	lea	edx, [esi + 0x0D]
	mov	edi, dword ptr [esp + 12] # 4-byte Reload
	mov	ebp, dword ptr [esp + 8] # 4-byte Reload
	mov	ebx, dword ptr [esp + 4] # 4-byte Reload
	mov	ecx, 0x41000000
	#APP (Icon)
	push	0xFFE0E0E0
	push	16
	push	16
	push	edi
	push	ebx
	push	ebp
	push	32
	push	32
	push	ecx
	call	D3D_Render2DObject
	#NO_APP
	mov	eax, dword ptr [esp + 56]
	mov	eax, dword ptr [eax + 312]
	mov	dword ptr [esp + 12], eax # 4-byte Spill
	mov	eax, dword ptr [MISC00TexPage]
	mov	dword ptr [esp + 8], eax # 4-byte Spill
	mov	ebx, dword ptr [esp + 16] # 4-byte Reload
	lea	eax, [ebx + ebx]
	mov	dword ptr [esp + 4], eax # 4-byte Spill
	mov	eax, 61
	mov	dword ptr [esp + 20], esi # 4-byte Spill
	lea	edx, [esi+32] #; Y offset
	mov	ebp, dword ptr [esp + 12] # 4-byte Reload
	mov	ecx, 0x41100000
	mov	edi, dword ptr [esp + 8] # 4-byte Reload
	mov	esi, dword ptr [esp + 4] # 4-byte Reload
	#APP (Meter)
	push	ebp
	push	50
	push	ebx
	push	79
	push	119
	push	edi
	push	100
	push	esi
	push	ecx
	call	D3D_Render2DObject
	#NO_APP
	mov	eax, dword ptr [esp + 56]
	add	eax, 292
	mov	ecx, dword ptr [esp + 32] # 4-byte Reload
	or	cl, byte ptr [esp + 3]  # 1-byte Folded Reload
	jne	BoostBar_Draw.LBB1_18
# BB#17:
	cmp	byte ptr [eax], 64
	jne	BoostBar_Draw.LBB1_21
BoostBar_Draw.LBB1_18:
	test	cl, 1
	je	BoostBar_Draw.LBB1_20
# BB#19:
	lea	eax, [esp + 24]
BoostBar_Draw.LBB1_20:
	mov	ecx, dword ptr [esp + 20] # 4-byte Reload
	add	ecx, 16
	mov	ebx, 112
	#APP
	call	Generic_DrawText
	#NO_APP
BoostBar_Draw.LBB1_21:
	add	esp, 36
	pop	esi
	pop	edi
	pop	ebx
	pop	ebp
	ret
	
#; Init custom level stuff
InitLevel_2:
    push eax
    push ebx
    push ecx
    push edx
    push esi
    push edi

    #; Find first open texture page
    xor ecx, ecx
InitLevel2_FindTPageLoop:
    mov al, TexturePagesLoaded[ecx]
    test al, al
    jz InitLevel2_FindTPageLoop_End
    inc ecx
    jmp InitLevel2_FindTPageLoop
InitLevel2_FindTPageLoop_End:
    mov eax, ecx

    #; Load credits GFX page for text
    mov [0x6DA61C], eax #; Store as credits tpage
    mov edx, offset 0x532F05 #; credits00.raw
    call D3D_LoadTexturePage
    
    #; Init credits text
    call sub_4D9DD0
    
    #; Init boost bar
    mov ecx, 5
InitLevel2_BoostBarInitLoop:

    imul eax, ecx, 0x71C
    add eax, 0x8FCEF4
    
    #; Write tint data to +0x1BC
    mov dword ptr [eax+0xA0], 0xFFFFFFFF
    
    push ecx
    
        mov ebx, [eax - 42] #; Identity
        push ebx
        push eax
        call BoostBar_Init
        
        add esp, 8
    
    pop ecx
    loop InitLevel2_BoostBarInitLoop
    
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret
    
#; Really quick patch to make horiz split MP work in widescreen
Render_SetViewport_Classic:
mov     edx, [eax]
mov     [0x6E98BC], edx #; Render2DObject-Xoff
add     edx, edx
mov     [0x6E98E8], edx #; Render2dObject-Yoff
mov     edx, [eax+4]
mov     [0x6E98CC], edx #; Right clipping plane? (on main menu)
                        #; Increases with screen size
mov     edx, [eax+8]
mov     [0x6E98C0], edx #; Same as above, but only main menu elements
mov     edx, [eax+0x0C]
mov     [0x6E98D0], edx #; Width scalar for all menu elements
                        #; Range 0-640
                        #; (On title screen, all except "R")
                        #; (On menu screen, everything)
                        #; (In game, pause flag.)
mov     edx, [eax+0x10]
mov     [0x6E98EC], edx #; Height scalar for all menu elements
                        #; Range 0-640
mov     edx, [eax+0x14]
mov     [0x6E98F0], edx
mov     edx, [eax+0x18]
mov     [0x6E98F4], edx
mov     edx, [eax+0x1C]
mov     [0x6E98D4], edx
mov     edx, [eax+0x20]
mov     [0x6E98D8], edx
mov     edx, [eax+0x24]
mov     [0x6E98DC], edx
mov     edx, [eax+0x28]
mov     [0x6E98E0], edx
mov     edx, [eax+0x2C]
mov     [0x6E98C4], edx
mov     edx, [eax+0x30]
mov     [0x6E98C8], edx
mov     edx, [eax+0x34]
mov     [0x6E9900], edx
mov     edx, [eax+0x38]
mov     [0x6E9904], edx
mov     edx, [eax+0x3C]
mov     [0x6E98F8], edx
#;mov     edx, [eax+0x40]
mov edx, dword ptr [0x6E98BC]
mov     [0x6E98FC], edx
mov     eax, [eax+0x50]
mov     edx, offset 0x8F7354
shl     eax, 2
add     edx, eax
mov     [0x51E070], edx
ret


Render_SetViewport_HD:
mov eax, dword ptr [0x6E98BC]
mov dword ptr [0x6E98FC], eax #; Store left bound in Draw2DObject donor address
xor eax, eax
mov dword ptr [0x6E98BC], eax #; VirtualLeftBound
mov dword ptr [0x6E98C0], 0x7E8
ret

CharDif_Action_Amy_Extern:
        push    ebx
        mov     eax, 1024
        sub     esp, 32
        mov     edx, DWORD PTR [esp+44]
        mov     ecx, DWORD PTR [edx+16]
        sub     eax, ecx
        mov     ecx, eax
        sar     ecx, 31
        shr     ecx, 20
        add     eax, ecx
        and     eax, 4095
        sub     eax, ecx
        test    BYTE PTR [esp+40], 64
        mov     DWORD PTR [esp+4], eax
        mov     eax, DWORD PTR [edx+68]
        fild    DWORD PTR [esp+4]
        fmul    QWORD PTR CharDif_Action_Amy.LC0
        fstp    QWORD PTR [esp+24]
        mov     DWORD PTR [esp+16], eax
        je      CharDif_Action_Amy.L2
        mov     eax, DWORD PTR [edx+412]
        test    eax, eax
        je      CharDif_Action_Amy.L12
CharDif_Action_Amy.L2:
        mov     eax, DWORD PTR [edx+412]
        mov     ecx, DWORD PTR [edx+412]
        test    ecx, ecx
        jle     CharDif_Action_Amy.L9
        mov     DWORD PTR [esp+4], eax
        mov     eax, DWORD PTR [edx+412]
        fild    DWORD PTR [esp+4]
        fmul    QWORD PTR CharDif_Action_Amy.LC1
        dec     eax
        mov     DWORD PTR [edx+412], eax
        fnstcw  WORD PTR [esp+14]
        mov     ax, WORD PTR [esp+14]
        fld     QWORD PTR CharDif_Action_Amy.LC2
        fadd    st, st(1)
        mov     ah, 12
        mov     WORD PTR [esp+12], ax
        fsin
        fld     DWORD PTR CharDif_Action_Amy.LC3
        fmul    st(1), st
        fxch    st(1)
        fldcw   WORD PTR [esp+12]
        fistp   DWORD PTR [esp+8]
        fldcw   WORD PTR [esp+14]
        mov     ecx, DWORD PTR [edx+56]
        mov     ebx, DWORD PTR [edx+4]
        mov     eax, DWORD PTR [esp+8]
        mov     DWORD PTR [esp+20], ecx
        mov     ecx, DWORD PTR [esp+20]
        add     eax, ebx
        cmp     ecx, eax
        jg      CharDif_Action_Amy.L13
        fxch    st(1)
        fsub    QWORD PTR CharDif_Action_Amy.LC4
        mov     WORD PTR [edx+234], 24
        mov     DWORD PTR [edx+412], 0
        fsincos
        fxch    st(1)
        fmulp   st(2), st
        fxch    st(1)
        fldcw   WORD PTR [esp+12]
        fistp   DWORD PTR [esp+8]
        fldcw   WORD PTR [esp+14]
        mov     eax, DWORD PTR [esp+8]
        mov     DWORD PTR [edx+48], eax
        fld     QWORD PTR [esp+24]
        fcos
        mov     eax, DWORD PTR [edx+44]
        mov     DWORD PTR [esp+4], eax
        fld     DWORD PTR CharDif_Action_Amy.LC5
        fmul    st(1), st
        fxch    st(1)
        fmul    st, st(2)
        fild    DWORD PTR [esp+4]
        faddp   st(1), st
        fldcw   WORD PTR [esp+12]
        fistp   DWORD PTR [esp+8]
        fldcw   WORD PTR [esp+14]
        mov     eax, DWORD PTR [esp+8]
        mov     DWORD PTR [edx+44], eax
        fld     QWORD PTR [esp+24]
        fsin
        mov     eax, DWORD PTR [edx+52]
        mov     DWORD PTR [esp+4], eax
        fmulp   st(1), st
        fmulp   st(1), st
        fild    DWORD PTR [esp+4]
        faddp   st(1), st
        fldcw   WORD PTR [esp+12]
        fistp   DWORD PTR [esp+8]
        fldcw   WORD PTR [esp+14]
        mov     eax, DWORD PTR [esp+8]
        mov     DWORD PTR [edx+52], eax
        jmp     CharDif_Action_Amy.L9
CharDif_Action_Amy.L13:
        fstp    st(0)
        fstp    st(0)
CharDif_Action_Amy.L9:
        add     esp, 32
        pop     ebx
        ret
CharDif_Action_Amy.L12:
        mov     ax, WORD PTR [edx+114]
        test    ax, ax
        jne     CharDif_Action_Amy.L2
        mov     DWORD PTR [edx+412], 30
        jmp     CharDif_Action_Amy.L2
CharDif_Action_Amy.LC0:
        .long   1413754136
        .long   1062806011
CharDif_Action_Amy.LC1:
        .long   4084984789
        .long   1069207273
CharDif_Action_Amy.LC2:
        .long   1413754136
        .long   1072243195
CharDif_Action_Amy.LC3:
        .long   1212370944
CharDif_Action_Amy.LC4:
        .long   2134057426
        .long   1073928572
CharDif_Action_Amy.LC5:
        .long   1193033728
        
#; Load even more SFX
LoadMoreSFX:
    mov edx, 0x38
    mov eax, offset SoundSfxRingLoss_wav
    call LoadSFXFiles
    call sub_4D0760 #; Hijacks this function call, still needs to be called
    ret

Unused_Start:
#; Forcibly stop unused space
.org 0x43D41A, 0x0B0F

#; Malloc-sub_4437FC
.org 0x4439B4
imul edx, 24
add edx, dword ptr [CharModel_QuadPtr]
sar edi, 8
.org 0x4439CA, 0x90

.org 0x4439E7
imul edx, 24
add edx, dword ptr [AnimFrames_BasePtr]
.org 0x4439FA, 0x90

.org 0x443BDD
add ecx, dword ptr [CharModel_BasePtr]
.org 0x443BE3, 0x90

.org 0x443D5B
imul edx, [eax+8], 0x32
add edx, dword ptr [CharModel_VertexPtr] #;CHECKME
.org 0x443D66, 0x90

.org 0x443D94
add eax, dword ptr [CharModel_BasePtr]
.org 0x443D9A, 0x90

.org 0x443DA6
xor ebx, ebx
imul bx, word ptr [ebx+0x22], 64
add ebx, dword ptr [CharModel_BasePtr]
.org 0x443DB6, 0x90

.org 0x443DCC	
add ecx, dword ptr [CharModel_BasePtr]
.org 0x443DD2, 0x90

.org 0x443DF2	
add edx, dword ptr [CharModel_BasePtr]
.org 0x443DF8, 0x90

.org 0x4441D5
mov ebx, [edx]
add ebx, [ebp-0x1C]
shl ebx, 6
add ebx, dword ptr [CharModel_BasePtr]
.org 0x4441E7, 0x90

.org 0x4441FF
mov esi, [edx]
add esi, [ebp-0x1C]
shl esi, 6
add esi, dword ptr [CharModel_BasePtr]
.org 0x444211, 0x90

.org 0x444234
add ecx, dword ptr [CharModel_BasePtr]
.org 0x44423A, 0x90

.org 0x444269
add edx, dword ptr [CharModel_BasePtr]
.org 0x44426F, 0x90



#; Malloc-DDraw_DisplayCharacterModel
.org 0x44D60A
lea edx, [edx*2 + edx]
shl edx, 3
add edx, [CharModel_QuadPtr]
mov edx, dword ptr [edx]
sar ebx, 0x0C
.org 0x44D620, 0x90

.org 0x44D658
lea edx, [edx+edx*2]
shl edx, 3
add edx, [AnimFrames_BasePtr]
mov edx, dword ptr [edx]
mov dword ptr [ebp-0xB8], esi
xor esi, esi
.org 0x44D673, 0x90

.org 0x44DE51
add ebx, dword ptr [CharModel_BasePtr]
.org 0x44DE57, 0x90

.org 0x44DF3C
imul edx, [eax+8], 0x30
add edx, [0x00713E68]
mov edx, [edx]
imul eax, [0x8FB358], 0x78
.org 0x44DF50, 0x90

.org 0x44DF8D
add eax, dword ptr [CharModel_BasePtr]
.org 0x44DF93, 0x90

.org 0x44DF9C
mov ebx, [ebp-0x100]
movzx edx, word ptr [ebx+0x22]
add ebx, edx
shl ebx, 6
add ebx, dword ptr [CharModel_BasePtr]
.org 0x44DFB2, 0x90

.org 0x44DFBC
mov ecx, [ebp-0x100]
movzx edx, word ptr [ecx+0x24]
add ecx, edx
add ecx, dword ptr [CharModel_BasePtr]
.org 0x44DFD2, 0x90

.org 0x44DFFB
add edx, dword ptr [CharModel_BasePtr]
.org 0x44E001, 0x90

.org 0x44E50E	
add edx, dword ptr [CharModel_BasePtr]
.org 0x44E514, 0x90

.org 0x44E52C
mov esi, [ebp-0x30]
add esi, [ebx]
shl esi, 6
add esi, dword ptr [CharModel_BasePtr]
.org 0x44E53E, 0x90

.org 0x44E564
add ebx, dword ptr [CharModel_BasePtr]
.org 0x44E56A, 0x90

.org 0x44E593
add ecx, dword ptr [CharModel_BasePtr]
.org 0x44E599, 0x90

#; Read VirtualLeftBound from donor address in Direct3D 2D renderer
.org 0x450C38
D3D_Render2DObject:

. = 0x450C8E
.byte 0xFC

#; Always render rings
.org 0x454C00
.org 0x454C02, 0x90

#; Malloc-D3D_RenderMenuCharacters
.org 0x45572B
lea eax, [ebx*2 + ebx]
mov ebx, dword ptr [CharModel_QuadPtr]
.org 0x455739, 0x90

.org 0x455755
lea eax, [ebx*2 + ebx] 
mov ebx, dword ptr [AnimFrames_BasePtr]
.org 0x455763, 0x90

.org 0x4558F7
add ecx, [CharModel_BasePtr]
.org 0x4558FD, 0x90

.org 0x455A8A
add ebx, dword ptr [CharModel_VertexPtr]
movzx eax, word ptr [ebx+0x20]
mov edi, dword ptr [CharModel_BasePtr]
.org 0x455A9B, 0x90

.org 0x455ABA
movzx eax, word ptr [ebx+0x22]
mov esi, dword ptr [CharModel_BasePtr]
.org 0x455AC5, 0x90

.org 0x455ADE
movzx eax, word ptr [ebx+0x24]
mov edx, dword ptr [CharModel_BasePtr]
.org 0x455AE9, 0x90

.org 0x455B18
movzx eax, word ptr [ebx+0x26]
mov edx, dword ptr [CharModel_BasePtr]
.org 0x455B23, 0x90

#; Disable character tinting on menus

    #; Quad A
    .org 0x455F38
    mov edx, 0x00FFFFFF
    .org 0x455F57, 0x90

    #; Quad B
    .org 0x455FF8
    mov eax, 0xFFFFFFFF
    .org 0x456019, 0x90

    #; Quad C
    .org 0x4560BE
    mov eax, 0xFFFFFFFF
    .org 0x4560F1, 0x90
    
    #; Quad D
    .org 0x456196
    mov edx, 0xFFFFFFFF
    .org 0x4561C9, 0x90
    
    #; Tri A
    .org 0x456410
    mov edx, 0xFFFFFFFF
    .org 0x456431, 0x90
    
    #; Tri B
    .org 0x4564D0
    mov eax, [ebp-0xC4]
    mov edx, 0xFFFFFFFF
    .org 0x4564F7, 0x90
    
    #; Tri C
    .org 0x456596
    mov eax, 0xFFFFFFFF
    .org 0x4565C9, 0x90
    
    #; Skip rendering Tails' tails
    .org 0x45660E
    jmp loc_456D3A
    .org 0x456614, 0x90


.org 0x45667B	
add esi, dword ptr [CharModel_BasePtr]
.org 0x456681, 0x90

.org 0x4566A2
mov edx, [ebp-0x6C]
add edx, [eax]
shl edx, 6
add edx, dword ptr [CharModel_BasePtr]
.org 0x4566B4, 0x90

.org 0x4566DC
mov edi, [ebp-0x6C]
add edi, [eax]
shl edi, 6
add edi, dword ptr [CharModel_BasePtr]
.org 0x4566EE, 0x90

.org 0x456717
mov edx, [ebp-0x6C]
add edx, [eax]
shl edx, 6
add edx, dword ptr [CharModel_BasePtr]
.org 0x456729, 0x90

.org 0x456D3A
loc_456D3A:

#; Disable rendering jump ball so we can reuse that space for the Boost Bar
.org 0x45B089
.org 0x45B08E, 0x90

.org 0x4621D2
MenuFadeIn_ret:

#; Malloc-D3D_DisplayPlayerModel
.org 0x463772
lea eax, [edx*2 + edx]
mov edx, dword ptr [CharModel_QuadPtr]
.org 0x463780, 0x90

.org 0x4637BA
lea eax, [edx*2 + edx]
mov edx, dword ptr [AnimFrames_BasePtr]
mov [ebp-0xF8], ecx
.org 0x4637CE, 0x90

.org 0x463FBE
add ebx, dword ptr [CharModel_BasePtr]
.org 0x463FC4, 0x90

.org 0x4640BC
add ebx, dword ptr [CharModel_VertexPtr] #;CHECKME
.org 0x4640C2, 0x90

.org 0x4640D4
movzx eax, word ptr [ebx+0x20]
mov edi, dword ptr [CharModel_BasePtr]
.org 0x4640DF, 0x90

.org 0x4640FA
movzx eax, word ptr [ebx+0x22]
mov ecx, dword ptr [CharModel_BasePtr]
.org 0x46410B, 0x90

.org 0x46412C
movzx eax, word ptr [ebx+0x24]
mov esi, dword ptr [CharModel_BasePtr]
.org 0x464137, 0x90

.org 0x464164
movzx eax, word ptr [ebx+0x26]
mov edx, dword ptr [CharModel_BasePtr]
.org 0x46416F, 0x90

#; Enable backface culling in-game for D3D
    .org 0x4641A2
    jmp loc_46433E
    .org 0x4641A8, 0x90
    
    .org 0x46433E
    loc_46433E:

#; Disable shading in-game for D3D

    #; Quad A
    .org 0x46465E
    #mov edx, [ebp-0x38]
    #mov eax, 0xFFFFFFFF
    mov edx, [ebp-0x100]
    mov edx, [edx+0x1BC] #; we'll reserve this one for tinting
    .org 0x464688, 0x90
    
    #;.org 0x46468F
    #;.org 0x464692, 0x90
    
    #; Quad B
    #.org 0x46474A
    .org 0x464731
    #mov eax, 0xFFFFFFFF
    mov eax, [ebp-0x100]
    mov eax, [eax+0x1BC]
    .org 0x464752, 0x90
    
    #; Quad C
    .org 0x4647FB
    #.org 0x464814
    #mov edx, 0xFFFFFFFF
    mov edx, [ebp-0x100]
    mov edx, [edx+0x1BC]
    .org 0x46481C, 0x90
    
    #; Quad D
    .org 0x4648C9
    #mov edx, 0xFFFFFFFF
    mov edx, [ebp-0x100]
    mov edx, [edx+0x1BC]
    mov eax, [ebp-0x38]
    jmp loc_464D6C
    nop
    #;.org 0x464904, 0x90
    
    #; Tri backface
    .org 0x464907
    jmp loc_464976
    .org 0x464909, 0x90
    
    .org 0x464976
    loc_464976:
    
    #; Tri A
    .org 0x464BA0
    #mov edx, 0xFFFFFFFF
    mov edx, [ebp-0x100]
    mov edx, [edx+0x1BC]
    .org 0x464BC1, 0x90
    
    #; Tri B
    .org 0x464C6E
    #mov edx, 0xFFFFFFFF
    mov edx, [ebp-0x100]
    mov edx, [edx+0x1BC]
    .org 0x464C8F, 0x90
    
    #; Tri C
    .org 0x464D45
    #mov edx, 0xFFFFFFFF
    mov edx, [ebp-0x100]
    mov edx, [edx+0x1BC]
    .org 0x464D66, 0x90
    
    .org 0x464D6C
    loc_464D6C:

#; Disable Tails' smooth tails in-game for D3D
.org 0x464D94
jmp MenuFadeIn_ret


.org 0x464E14
mov esi, [ebp-0x54]
add esi, [eax]
shl esi, 6
add esi, dword ptr [CharModel_BasePtr]
.org 0x464E26, 0x90

.org 0x464E4E
mov edx, [ebp-0x54]
add edx, [eax]
shl edx, 6
add edx, dword ptr [CharModel_BasePtr]
.org 0x464E60, 0x90

.org 0x464E91
mov edx, [ebp-0x54]
add edx, [eax]
shl edx, 6
add edx, dword ptr [CharModel_BasePtr]
.org 0x464EA3, 0x90

.org 0x464EE0
add edi, dword ptr [CharModel_BasePtr]
.org 0x464EE6, 0x90

#; Malloc-sub_469AE0
/*.org 0x469B01
lea eax, [edx*4 + edx]
mov edx, dword ptr [Sonic_ModelAttribBasePtr]
.org 0x469B0F, 0x90*/

.org 0x46A34A
lea eax, [edx*2 + edx]
mov edx, dword ptr [CharModel_QuadPtr]
.org 0x46A358, 0x90

.org 0x46A38B
lea eax, [edx*2 + edx]
mov edx, dword ptr [AnimFrames_BasePtr]
.org 0x46A399, 0x90

.org 0x46A6B8
add ebx, dword ptr [CharModel_BasePtr]
.org 0x46A6BE, 0x90

.org 0x46A910
mov edx, [esp+0xAC]
imul edx, [edx+8], 0x30
add edx, dword ptr [CharModel_VertexPtr] #;CHECKME
.org 0x46A922, 0x90

.org 0x46A954
movzx eax, word ptr [edx+0x20]
mov edx, [esp+0xAC]
add eax, [edx]
mov esi, dword ptr [CharModel_BasePtr]
.org 0x46A968, 0x90

.org 0x46A97E
movzx eax, word ptr [edx+0x22]
mov edx, [esp+0xAC]
add eax, [edx]
mov ecx, dword ptr [CharModel_BasePtr]
.org 0x46A992, 0x90

.org 0x46A9A8
movzx eax, word ptr [edx+0x24]
mov edx, [esp+0xAC]
add eax, [edx]
mov ebx, dword ptr [CharModel_BasePtr]
.org 0x46A9BC, 0x90

.org 0x46A9E5
movzx eax, word ptr [edx+0x26]
mov edx, [esp+0xAC]
add eax, [edx]
mov edi, dword ptr [CharModel_BasePtr]
.org 0x46A9F9, 0x90

#; Malloc-sub_470460	
.org 0x470460
push ebx
push edx
push esi
mov esi, ds:Game_QuadCount
mov edx, dword ptr [CharModel_VertexPtr] #;CHECKME
.org 0x47046F, 0x90

.org 0x4704D5
cmp word ptr [ebx], 0 
.org 0x4704DB, 0x90

.org 0x4704EB
pop esi
pop edx
pop ebx
ret
.org 0x4704EF, 0x90

#; Don't overwrite textures?
.org 0x470564
ret
.org 0x470580
ret

#; Unlock all 8 characters by default!
.org 0x470DC8
UnlockDefaults:
.org 0x470DEF
mov edi, eax #; Metal Pt.1
.org 0x470E11
mov [0x008FBA74], eax #; Nack
mov [0x008FBA78], eax #; Silver
mov [0x008FBA7C], eax #; Blaze
mov [0x008FBA80], eax #; ???
.org 0x470E29, 0x90

.org 0x470E46
.org 0x470E48, 0x90 #; Metal Pt.2

#; Use Nack instead of EggRobo for Reactive Factory challenge race
.org 0x471AF3
mov eax, 4
.org 0x471AF8, 0x90

#; InitLevel
#; Hijack some old 8-bit GFX function call to init our stuff
.org 0x475D4A
call InitLevel_2
pop edi
pop esi
pop edx
pop ecx
pop ebx
ret

#; LoadCharacters
.org 0x475D58, 0x0B0F
	
LoadCharacters:
    QuadCount = 6000
    TriCount = 6000
    VertexCount = 6000
    AnimFrameCount = 15000

	push	ebp
	mov	ebp, esp
	push	edi
	push	esi
	push	ebx
	sub	esp, 660
	
	#; This is probably cdecl
	push	OFFSET FLAT:LoadCharacters.LC0
	push	OFFSET FLAT:LoadCharacters.LC1
	push	1
        call	GetFileMatchCount
    add	esp, 12
    mov	DWORD PTR [ebp-556], eax
	
    xor	ebx, ebx
	mov	DWORD PTR Game_ModelCount, ebx
	mov	DWORD PTR Game_VertexCount, ebx
	mov	DWORD PTR Game_TriCount, ebx
	mov	DWORD PTR Game_QuadCount, ebx
	mov	DWORD PTR Game_AnimFrameCount, ebx
	
	#; Allocate stuff
	mov eax, (QuadCount*24)
	call _nmalloc_
	mov CharModel_QuadPtr, eax
	
	mov eax, ( (TriCount*24) + (QuadCount*32) )
	call _nmalloc_
	mov CharModel_VertexPtr, eax
	
	mov eax, (VertexCount*64)
	call _nmalloc_
	mov CharModel_BasePtr, eax
	
	mov eax, (100000*32)
	call _nmalloc_
	mov Sonic_GouradPtr, eax
	
	mov eax, (AnimFrameCount*80)
	call _nmalloc_
	mov AnimFrames_BasePtr, eax

#; Character loop start
LoadCharacters.L2:
	cmp	ebx, DWORD PTR [ebp-556]
	jge	LoadCharacters.L9
	
	lea	edi, [ebp-544]
    lea	esi, [ebp-284]
	
    #; wsprintf is cdecl
    push ebx
    push	OFFSET FLAT:LoadCharacters.LC2
    push	edi
        call	wsprintfA
    add esp, 12

    push	edi
    push	esi
        call	lstrcpyA

    push	OFFSET FLAT:LoadCharacters.LC3
    push	esi
        call	lstrcatA

    mov	eax, esi
    call Parse3DCharacter
	
	push	edi
	push	esi
        call	lstrcpyA
	
	#; Gourads
	/*push	OFFSET FLAT:LoadCharacters.LC4
	push	esi
        call	lstrcatA
	
	imul	eax, ebx, 80
	#mov	edx, DWORD PTR Sonic_ModelAttribBasePtr
	mov	edx, OFFSET Sonic_ModelAttribBasePtr
	#mov	DWORD PTR [ebp-564], eax
	add	edx, eax
	mov	eax, esi
	call Parse3DGourads #; Probably thinks this is cdecl!*/
	
	#; Attributes
	push	OFFSET FLAT:LoadCharacters.LC7
	push	esi
        call	lstrcatA
        
    mov eax, esi
    call LoadAttribs
	
	push	OFFSET FLAT:LoadCharacters.LC5
	push	edi
	push	0
        call	GetFileMatchCount
	add	esp, 12
	
	mov	DWORD PTR [ebp-560], eax
	
    xor	esi, esi
    
#; Animation loop
LoadCharacters.L3:
	cmp	esi, DWORD PTR [ebp-560]
	jge	LoadCharacters.L10
	lea	eax, [ebp-544]
	lea	edi, [ebp-284]
	
	push    esi #; i
	push    eax #; /bin/chars/?/
    push	OFFSET FLAT:LoadCharacters.LC6
    push	edi
        call	wsprintfA
    add esp, 16

    mov	eax, edi
    mov	edx, ebx
    call Parse3DAnimations
	
    inc	esi
	jmp	LoadCharacters.L3

#; Character loop end
LoadCharacters.L10:
	#; Model height
	imul edx, ebx, 80
	add edx, OFFSET (Sonic_ModelAttribBasePtr + 76)
	add [edx], DWORD PTR 0x20

	#; Increment counter and loop if last one
	inc	ebx
	cmp	ebx, DWORD PTR [ebp-556]
	je	LoadCharacters.L2
	
	#; Set next character's animation start index
	mov	edx, [Game_AnimFrameCount]
	imul eax, ebx, 80
	add	eax, OFFSET (Sonic_AnimFrameIdx)
	mov	DWORD PTR [eax], edx

	jmp	LoadCharacters.L2
	
#; Return
LoadCharacters.L9:
	lea	esp, [ebp-12]
	pop	ebx
	pop	esi
	pop	edi
	pop	ebp
	ret
	
Unused2:
.org 0x476750, 0x0B0F
LoadCharacterGourads:
ret
	
#; More unused space if needed
Unused3:
.org 0x4767F7, 0x0B0F

#; Always have Sonic tokens in GP mode, because why not?
.org 0x47E621
.org 0x47E649, 0x90

#; Malloc-sub_47FD04
.org 0x47FD24
imul eax, eax, 30
add eax, dword ptr [CharModel_VertexPtr] #;CHECKME
.org 0x47FD2F, 0x90

.org 0x47FDE8
Char_SetBlinkState:
ret

.org 0x47FEA0
Render_SetBlinkTexture:
ret

#; CPUfix 1
. = 0x480184
.byte 0xB8, 0x31, 0x00, 0x00, 0x00, 0x90, 0x90

#; CPUfix 2
. = 0x4801A0
.byte 0xB8, 0x01, 0x00, 0x00, 0x00, 0x90, 0x90

#; InitHook inject
. = 0x4801E9
call InitLoop

#; Cutoff speed for slope physics
SlopeFix_SpeedCutoff = 1000
#; Cutoff angle for slope physics
SlopeFix_AngleCutoff = 0x0FFFFF138

.org 0x480910
Eggman_ShootMissile:

#; Fix Bomb_Update to use FPU and vector math
#; instead of terrible integer hacks that don't work
.org 0x480D74
Bomb_Update:

.org 0x480D8D
loc_480D8D:

.org 0x480D93
jz loc_481121

#;.org 0x480DA1
#;jz loc_480D8D

.org 0x480DBA
        push ebx
        push ecx

        push    ebp
        push    edi
        push    esi
        push    ebx
        sub     esp, 24
        mov     eax, DWORD PTR [esp+40]
        mov     ecx, DWORD PTR [esp+44]
        mov     edx, DWORD PTR [eax]
        mov     edi, DWORD PTR [ecx]
        sar     edx, 4
        mov     ebx, edi
        sub     ebx, edx
        mov     esi, DWORD PTR [ecx+4]
        mov     edx, DWORD PTR [eax+4]
        mov     DWORD PTR [esp+4], ebx
        sar     edx, 4
        mov     ebx, esi
        sub     ebx, edx
        mov     eax, DWORD PTR [eax+8]
        fild    DWORD PTR [esp+4]
        sar     eax, 4
        mov     DWORD PTR [esp+4], ebx
        mov     ebx, DWORD PTR [ecx+8]
        mov     edx, ebx
        sub     edx, eax
        fild    DWORD PTR [esp+4]
        mov     DWORD PTR [esp+4], edx
        fild    DWORD PTR [esp+4]
        fld     st(2)
        fmul    st, st(3)
        fld     st(2)
        fmul    st, st(3)
        faddp   st(1), st
        fld     st(1)
        fmul    st, st(2)
        faddp   st(1), st
        fsqrt
        fld     DWORD PTR Bomb_Update.LC1
        fxch    st(1)
        fcom    st(1)
        fnstsw  ax
        test    ah, 69
        je      Bomb_Update.L2
        
        fstp    st(1)
        fld     st(0)
Bomb_Update.L2:
        fdivp   st(1), st
        fnstcw  WORD PTR [esp+14]
        mov     ax, WORD PTR [esp+14]
        mov     ah, 12
        mov     WORD PTR [esp+12], ax
        fmul    st(3), st
        fxch    st(3)
        #;fldcw   WORD PTR [esp+12]
        fistp   DWORD PTR [esp+8]
        #;fldcw   WORD PTR [esp+14]
        fxch    st(1)
        fmul    st, st(2)
        mov     ebp, DWORD PTR [esp+8]
        neg ebp
        mov     DWORD PTR [ecx+12], ebp
        #;sub     edi, ebp
        #;fldcw   WORD PTR [esp+12]
        fistp   DWORD PTR [esp+8]
        #;fldcw   WORD PTR [esp+14]
        fmulp   st(1), st
        mov     edx, DWORD PTR [esp+8]
        neg edx
        mov     DWORD PTR [ecx+16], edx
        #;sub     edx, esi
        #;fldcw   WORD PTR [esp+12]
        fistp   DWORD PTR [esp+8]
        #;fldcw   WORD PTR [esp+14]
        mov     eax, DWORD PTR [esp+8]
        #;mov     DWORD PTR [ecx], edi
        neg eax
        mov     DWORD PTR [ecx+20], eax
        #;sub     eax, ebx
        #;mov     DWORD PTR [ecx+4], edx
        #;mov     DWORD PTR [ecx+8], eax
        add     esp, 24
        pop     ebx
        pop     esi
        pop     edi
        pop     ebp
        
        pop ecx
        pop ebx
#;.org 0x480F31, 0x90

loc_480F31:                             #; CODE XREF: Bomb_Update+18Ej
                                        #; Bomb_Update+1A7j
                mov     ax, [edi]
                xor     ah, ah
                and     al, 0x1F
                mov     ecx, [ebx]
                cwde
                sar     ecx, 8
                sub     eax, 0x10
                add     ecx, eax
                imul    eax, ebp, 0x3C
                shl     ecx, 8
                #;mov     ds:Render_ParticleArray[eax], ecx
                mov     dword ptr 0x907F20[eax], ecx
                mov     dx, [edi+2]
                xor     dh, dh
                and     dl, 0x1F
                movsx   ecx, dx
                mov     edx, [ebx+4]
                sub     ecx, 0x10
                sar     edx, 8
                add     ecx, edx
                shl     ecx, 8
                mov     dword ptr 0x907F24[eax], ecx
                mov     cx, [edi+4]
                xor     ch, ch
                and     cl, 0x1F
                mov     edx, [ebx+8]
                movsx   ecx, cx
                sar     edx, 8
                sub     ecx, 0x10
                add     ecx, edx
                shl     ecx, 8
                mov     edx, 0x0FFFFFFE0
                mov     dword ptr 0x907F28[eax], ecx
                mov     dword ptr 0x907F38[eax], edx
                xor     ecx, ecx
                mov     dword ptr 0x907F2C[eax], ecx
                mov     dword ptr 0x907F30[eax], ecx
                mov     edx, 0x0A
                mov     dword ptr 0x907F34[eax], ecx
                mov     word ptr 0x907F3E[eax], dx
                mov     ecx, 0x210
                mov     edx, 1
                mov     word ptr 0x907F40[eax], cx
                mov     word ptr 0x907F42[eax], dx
                xor     ecx, ecx
                mov     edx, 0x40
                mov     dword ptr 0x907F44[eax], ecx
                mov     dword ptr 0x907F48[eax], edx
                mov     ecx, 3
                mov     word ptr 0x907F4C[eax], cx
                mov     edx, 0x20
                mov     word ptr 0x907F4E[eax], cx
                mov     word ptr 0x907F50[eax], dx
                mov     ecx, 0x10
                add     edi, 2
                mov     word ptr 0x907F3C[eax], cx
                xor     dl, dl
                mov     word ptr 0x907F52[eax], cx
                add     edi, 2
                mov     byte ptr 0x907F54[eax], dl
                mov     dh, 0x50
                #;mov     cl, byte ptr ds:ShadowFootstepTexPage
                mov     cl, byte ptr [0x8F6C28]
                mov     byte ptr 0x907F55[eax], dh
                add     edi, 2
                mov     byte ptr 0x907F56[eax], cl
                mov     edx, 0x10
                inc     ebp
                mov     word ptr 0x907F58[eax], dx
                cmp     ebp, 0x3C
                jl      short loc_481050
                xor     ebp, ebp

loc_481050:                             #; CODE XREF: Bomb_Update+2D8j
                mov     eax, dword ptr 0x907AF4[esi]
                mov     ecx, [ebx]
                mov     edx, [eax]
                sar     ecx, 8
                sar     edx, 0x0C
                sub     ecx, edx
                imul    ecx, ecx
                mov     edx, [ebx+4]
                sar     edx, 8
                mov     [esp+0x14-0x14], edx
                mov     edx, [eax+4]
                sar     edx, 0x0C
                mov     [esp+0x14-0x4], edx
                mov     edx, [esp+0x14-0x14]
                sub     edx, [esp+0x14-0x4]
                add     edx, 0x1E
                mov     [esp+0x14-0xC], edx
                mov     [esp+0x14-0x4], ecx
                mov     ecx, [esp+0x14-0xC]
                imul    ecx, ecx
                mov     edx, [ebx+8]
                sar     edx, 8
                mov     [esp+0x14-0x14], edx
                mov     edx, [eax+8]
                sar     edx, 0x0C
                mov     [esp+0x14-0x10], edx
                mov     edx, [esp+0x14-0x14]
                sub     edx, [esp+0x14-0x10]
                mov     [esp+0x14-0x8], edx
                mov     edx, [esp+0x14-0x4]
                add     edx, ecx
                mov     ecx, [esp+0x14-0x8]
                imul    ecx, ecx
                add     ecx, edx
                cmp     ecx, 0x3000
                jge     loc_480D8D
                mov     ecx, [ebx+0x0C] #; Bomb hit knockback
                shl     ecx, 4
                mov     dword ptr [eax+0x30], 0x0FFFE8000 #; Y speed
                neg ecx #; Kill velocity by inverting physics. Roll with it...
                mov     [eax+0x2C], ecx  #; X speed
                mov     ecx, [ebx+0x14]
                mov     word ptr [eax+0x96], 1 #; Stop flight
                mov     word ptr [eax+0x72], 0 #; Make airborne
                mov     word ptr [eax+0xEA], 0x38 #; *ring loss noise*
                mov     word ptr [eax+0x98], 5 #; Falling
                shl     ecx, 4
                mov     dword ptr [eax+0x204], 0x30003 #; Pointless diagnostic thing?
                neg ecx
                mov     [eax+0x34], ecx  #; Z speed
                
                #; Subtract 20 rings! (Make it super evil~!)
                cmp dword ptr [eax+0x18], 0 #; Are we already at 0?
                je loc_480170 #; If so, change SFX 
                
                sub dword ptr [eax+0x18], 20 #; If not, subtract 20 rings
                cmp dword ptr [eax+0x18], 0 #; Are we below 0? 
                jge loc_480180 #; If not, continue
                mov dword ptr [eax+0x18], 0  #; Snap to 0
                
                jmp loc_480180
                
loc_480170:
                mov word ptr [eax+0xEA], 15 #; *fwoooom* instead (no rings to scatter)
loc_480180:
                mov     word ptr [ebx+0x1E], 0 #; Clear bomb from particle list
                xor     ebx, ebx
                mov     dword ptr 0x907AF0[esi], ebx
                jmp     loc_480D8D
#; ---------------------------------------------------------------------------

loc_481121:                             #; CODE XREF: Bomb_Update+1Fj
                mov     dword ptr [0x9020A0], ebp
                #;mov     ds:RNGPtr, edi
                mov dword ptr [0x901CD0], edi
                add     esp, 0x14
                pop     ebp
                pop     edi
                pop     esi
                pop     edx
                pop     ecx
                pop     ebx
                ret
                
.org 0x481138, 0x0B0F


#; Change character-specific SFX
.org 0x4828AC
.int offset SetSFXIntensity_Tails #; Tails
.int offset SetSFXIntensity_Null  #; Knux
.int offset SetSFXIntensity_Null  #; Amy
.int offset SetSFXIntensity_Null  #; Fang
.int offset SetSFXIntensity_Jet   #; Metal Sonic
.int offset SetSFXIntensity_Silver  #; Silver
.int offset SetSFXIntensity_Null  #; Blaze

.org 0x48297B
SetSFXIntensity_Tails:
.org 0x48299A
jmp SetSFXIntensity_Null #; Disable SFX when running
nop
mov edx, 0x0B
mov edi, 0x28 #; Lower pitch of SFX
.org 0x4829AA, 0x90

.org 0x4829D0
SetSFXIntensity_Silver:
#; Get hover state
cmp dword ptr [esi+0x1A0], 1
jnz SetSFXIntensity_Null
#; I dunno, make some fun noise
mov     edx, ebx
mov     eax, ebx
sar     edx, 0x1F
sub     eax, edx
sar     eax, 1
lea     ebx, [eax+0x40]
mov     eax, [ebp-0x20]
mov     dword ptr [ebp-0x10], eax
mov     dword ptr [ebp-0x1C], 1


.org 0x482A16, 0x90
SetSFXIntensity_Jet:
.org 0x482A37
SetSFXIntensity_Null:

.org 0x4853A8
CharDiff_Jump:

.org 0x4855E8
CharDif_CheckSpring:

#; Jump table for CharPhysics
.org 0x485740
.int offset CharDif_Action_Sonic
.int offset CharDif_Action_Tails
.int offset CharDif_Action_Knux
.int offset CharDif_Action_Amy
.int offset CharDif_Action_Fang
.int offset CharDif_Action_MSonic
.int offset CharDif_Action_Silver
.int offset CharDif_Action_Blaze
.int offset CharDiff_SlopePhysics
.int offset CharDiff_SlopePhysics


#; Brand new character physics routine
.org 0x485768

CharPhysics:
var_58          = -0x58
var_54          = -0x54
var_50          = -0x50
var_4C          = -0x4C
UnkAttrib       = -0x48
var_44          = -0x44
Deaccel         = -0x40
AirStatus       = -0x3C
var_38          = -0x38
MaxFwdSpeed     = -0x34
ebx84           = -0x30
JumpHeight      = -0x2C
Accel           = -0x28
TurnTraction    = -0x24
Drift           = -0x20
TurnSpeed       = -0x1C
Temp01          = -0x18
Input           = -0x14
var_10          = -0x10

                push    ebp
                mov     ebp, esp
                push    ebx
                push    ecx
                push    esi
                push    edi
                sub     esp, 0x48
                
                mov     ebx, eax        #; EBX = Char RAM base
                mov     word ptr [ebp+Input], dx
                xor     ecx, ecx
                mov     edx, 0x44000
                mov     [ebp+var_44], ecx
                mov     [ebp+MaxFwdSpeed], edx
                
                movsx   edx, word ptr [eax+0x0F2]
                shl     edx, 7 #; [EAX+0x0F2] = Player Identity
                
                #; Top Speed (stores to ESI)
                mov     esi, (CharModel_AttribStart+0x3C)[edx] #; Get from lookup table
                
                #; Accel Speed
                mov     ecx, (CharModel_AttribStart+0x40)[edx]
                lea     eax, [ecx*4]
                sub     eax, ecx
                mov     ecx, eax
                sar     ecx, 31
                sub     eax, ecx
                sar     eax, 1
                mov     [ebp+Accel], eax
                
                #; Turn traction
                mov     eax, (CharModel_AttribStart+0x50)[edx]
                mov     [ebp+TurnTraction], eax #; Actually deaccel?!
                
                #; Flat-land decel
                mov     eax, (CharModel_AttribStart+0x54)[edx]
                sar     eax, 1
                mov     [ebp+Deaccel], eax #; Actually jump height!
                
                #; Jump height
                mov     eax, (CharModel_AttribStart+0x58)[edx]
                mov     [ebp+JumpHeight], eax
                
                #; Rolling Acceleration
                mov     eax, (CharModel_AttribStart+0x5C)[edx]
                mov     [ebp+var_38], eax
                
                #; Water top speed? (Stores in EDI)
                mov     edi, (CharModel_AttribStart+0x60)[edx]
                
                #; Unknown
                mov     eax, (CharModel_AttribStart+0x4C)[eax]
                mov     [ebp+UnkAttrib], eax
                
                #; Turn speed (standing still/midair)
                mov     ecx, (CharModel_AttribStart+0x44)[edx]
                
                #; Slipperiness
                mov     eax, (CharModel_AttribStart+0x48)[edx]
                mov     [ebp+TurnSpeed], eax

                #; Multiplayer? If so, get out
                mov     edx, ds:Game_HudStyle
                cmp     edx, 1
                jnz     short loc_4858E1 
                
                cmp     ds:Game_HUDTTStyle, dword ptr 0 #; Time Trial?
                jnz     short loc_4858E1
                
                mov     edx, ds:CatchUpOpt #; CatchUp Off?
                cmp     edx, 1
                jnz     short loc_4858E1
                
                mov     eax, [ebx+0x5A]  #; Part of the timer?
                sar     eax, 0x10
                cmp     eax, edx
                jle     short loc_4858E1
                
                lea     edx, [esi*4] #; Rubber band the top speed
                add     edx, esi
                mov     eax, edx
                sar     edx, 0x1F
                shl     edx, 2
                sbb     eax, edx
                sar     eax, 2
                mov     esi, eax
                cmp     eax, 0x3C000
                jle     short loc_4858E1
                mov     esi, 0x3C000

loc_4858E1:                             #; CODE XREF: CharPhysics+135j
                                        #; CharPhysics+13Ej ...
                mov     eax, ds:Game_HudStyle
                cmp     eax, 2          #; Time Attack?
                jnz     short loc_4858F7
                cmp     eax, ds:Game_HUDTTStyle
                jg      CharDif_ActionStart

loc_4858F7:                             #; CODE XREF: CharPhysics+181j
/*                movsx   eax, word ptr [ebx+0x0F2] #; ??
                cmp     eax, 3          #; Sonic-Amy
                jle     short loc_485913
                movsx   eax, word ptr [ebx+0x0F2]
                cmp     eax, 8          #; EggRobo or S. Sonic?
                jl      CharDif_ActionStart      #; (AKA Not the metal chars)*/

loc_485913:                             #; CODE XREF: CharPhysics+199j
/*                movsx   eax, word ptr [ebx+0x0F2]
                cmp     eax, 8          #; EggRobo
                jnz     short loc_485931*/
                
                mov     eax, [ebx+0x96]  #; Time in air?
                sar     eax, 0x10
                cmp     eax, 0x0C
                jz      CharDif_ActionStart

loc_485931:                             #; CODE XREF: CharPhysics+1B5j
/*                movsx   eax, word ptr [ebx+0x0F2]
                cmp     eax, 9          #; Super Sonic?
                jnz     short loc_48594F
                mov     eax, [ebx+0x96]
                sar     eax, 0x10
                cmp     eax, 0x0C
                jz      CharDif_ActionStart*/

loc_48594F:                             #; CODE XREF: CharPhysics+1D3j
                cmp     word ptr [ebx+0x72], 0 #; On Ground?
                jz      CharDif_ActionStart
                cmp     ds:Game_Course, dword ptr 5 #; Radiant Emerald
                jz      CharDif_ActionStart
                mov     edx, ds:Game_Weather
                cmp     edx, 1          #; Rainy?
                jnz     short loc_4859B3

CharDif_Rain:
                mov     eax, [ebp+TurnSpeed]
                lea     edx, [eax*4]
                add     edx, eax
                mov     [ebp+Temp01], dword ptr 6
                mov     eax, edx
                sar     edx, 0x1F
                idiv    dword ptr [ebp+Temp01]    #; TurnSpeed * 5/6
                mov     [ebp+TurnSpeed], eax
                mov     eax, [ebp+TurnTraction]
                lea     edx, [eax*4]
                add     edx, eax
                mov     [ebp+Temp01], dword ptr 6
                mov     eax, edx
                sar     edx, 0x1F
                idiv    dword ptr [ebp+Temp01]
                mov     [ebp+TurnTraction], eax
                jmp     CharDif_ActionStart
#; --------------------------------------------------------------------------

loc_4859B3:                             #; CODE XREF: CharPhysics+208j
                cmp     edx, 2          #; Snowy?
                jnz     CharDif_ActionStart
                cmp     dword ptr [ebx+0x200], 0
                jz      short CharDif_Snow

CharDif_Ice:
                mov     eax, [ebp+TurnSpeed]
                lea     edx, [eax*4]
                sub     edx, eax
                mov     [ebp+Temp01], dword ptr 6
                mov     eax, edx
                sar     edx, 0x1F
                idiv    dword ptr [ebp+Temp01]    #; TurnSpeed * 1/2
                mov     [ebp+TurnSpeed], eax
                mov     eax, [ebp+TurnTraction]
                lea     edx, [eax*4]
                sub     edx, eax
                mov     [ebp+Temp01], dword ptr 6
                mov     eax, edx
                sar     edx, 0x1F
                idiv    dword ptr [ebp+Temp01]
                mov     [ebp+TurnTraction], eax
                jmp     CharDif_ActionStart
#; --------------------------------------------------------------------------

CharDif_Snow:                           #; CODE XREF: CharPhysics+25Bj
                mov     edx, [ebp+TurnSpeed]
                mov     eax, 6
                shl     edx, 2
                mov     [ebp+Temp01], eax
                mov     eax, edx
                sar     edx, 0x1F
                idiv    dword ptr [ebp+Temp01]    #; TurnSpeed * 2/3
                mov     edx, [ebp+TurnTraction]
                mov     [ebp+TurnSpeed], eax
                mov     eax, 6
                shl     edx, 2
                mov     [ebp+Temp01], eax
                mov     eax, edx
                sar     edx, 0x1F
                idiv    dword ptr [ebp+Temp01]
                mov     [ebp+TurnTraction], eax

CharDif_ActionStart:                    #; CODE XREF: CharPhysics+189j
                                        #; CharPhysics+1A5j ...
                mov     eax, [ebx+0x20]
                mov     ds:CharDif_X, eax
                mov     eax, [ebx+0x24]
                mov     ds:CharDif_Y, eax
                mov     eax, [ebx+0x28]
                mov     edx, [ebx+0x24]
                mov     ds:CharDif_Z, eax
                mov     eax, [ebx+4]    #; Actual Y
                sub     eax, edx
                mov     [ebx+0x0E4], eax #; DeltaY?
                mov     eax, [ebx]      #; Actual X
                mov     [ebx+0x20], eax  #; X Mirror
                mov     eax, [ebx+4]    #; Actual Y
                mov     [ebx+0x24], eax  #; Y Mirror
                mov     eax, [ebx+8]    #; Actual Z
                mov     [ebx+0x28], eax  #; Z Mirror
                mov     ax, [ebx+0x0F2]  #; Controls jump action
                cmp     ax, 9           #; switch 10 cases
                ja      CharDiff_SlopePhysics #; default
                and     eax, 0x0FFFF
                jmp     0x485740[eax*4] #; switch jump

CharDif_Action_Sonic:                             #; DATA XREF: BEGTEXT:0x485740o
                mov     eax, [ebx+0x84]  #; I'll bet you this is rolling
                sar     eax, 0x10
                mov     [ebp+ebx84], eax
                test    eax, eax
                jg      loc_485F62      #; Dunno
                test    byte ptr [ebp+Input], 0x40 #; Camera
                jz      loc_4860B0
                mov     eax, [ebx+0x70]  #; On Ground?
                sar     eax, 0x10
                cmp     eax, 1
                jnz     loc_4860B0
                cmp     dword ptr [ebx+0x68], 0 #; Water walk timer
                jnz     loc_4860B0
                mov     al, byte ptr [ebp+Input+1]
                test    al, 0x40         #; Left
                jnz     loc_4860B0
                test    al, 0x80         #; Right
                jnz     loc_4860B0      #; Are we moving?
                cmp     dword ptr [ebx+0x44], 0 #; Forward Speed
                jnz     short loc_485F32
                cmp     dword ptr [ebx+0x48], 0 #; ??
                jnz     short loc_485F32
                cmp     dword ptr [ebx+0x2C], 0 #; X Speed
                jnz     short loc_485F32
                cmp     dword ptr [ebx+0x34], 0 #; Z Speed
                jnz     short loc_485F32
                mov     word ptr [ebx+0x86], 2
                jmp     loc_4860B9
#; --------------------------------------------------------------------------

loc_485F32:                             #; CODE XREF: CharPhysics+7A8j
                                        #; CharPhysics+7AEj ...
                dec     word ptr [ebx+0x86]
                mov     eax, [ebx+0x84]
                sar     eax, 0x10
                cmp     eax, 0x0FFFFFFFC
                jge     loc_4860B9
                mov     word ptr [ebx+0x0EA], 0x0A #; Set sound to roll
                mov     word ptr [ebx+0x86], 1 #; Roll mode flag?
                jmp     loc_4860B9
#; --------------------------------------------------------------------------

loc_485F62:                             #; CODE XREF: CharPhysics+768j
                cmp     eax, 2          #; Start rolling logic
                jl      short loc_485FC8
                mov     ah, byte ptr [ebp+Input]
                test    ah, 0x40         #; Camera
                jz      short loc_485FC8
                #test    ah, 1           #; Jump
                #jz      short loc_485FB1
                cmp     [ebp+ebx84], dword ptr 0x80
                jge     loc_4860B9
                add     word ptr [ebx+0x86], 0x81
                mov     eax, [ebx+0x84]
                sar     eax, 0x10
                cmp     eax, 0x86
                jle     short loc_485FA3
                mov     word ptr [ebx+0x86], 0x86

loc_485FA3:                             #; CODE XREF: CharPhysics+830j
                mov     word ptr [ebx+0x0EA], 8 #; Set sound to spindash charge
                jmp     loc_4860B9
#; --------------------------------------------------------------------------

loc_485FB1:                             #; CODE XREF: CharPhysics+80Aj
                mov     ax, [ebx+0x86]
                xor     ah, ah
                and     al, 0x7F
                mov     [ebx+0x86], ax
                jmp     loc_4860B9
#; --------------------------------------------------------------------------

loc_485FC8:                             #; CODE XREF: CharPhysics+7FDj
                                        #; CharPhysics+805j
                mov     eax, [ebx+0x84]  #; Spindash start
                sar     eax, 0x10
                cmp     eax, 2
                jz      loc_4860B0
                cmp     ds:TimeToRaceStart, dword ptr 0
                jnz     loc_4860B0      #; Don't move forward if race hasn't started
                #;mov     esi, [ebp+var_38] #; Spindash accel
                mov esi, 0x000B0000 #; 000X0000, x = spindash speed.
                cmp     eax, 2
                jle     loc_486078
                mov     dx, [ebx+0x86]
                xor     dh, dh
                and     dl, 0x7F
                mov     eax, [ebx+0x10]
                mov     [ebx+0x86], dx
                mov     edx, esi
                mov     eax, 0x92568C[eax*4]
                sar     edx, 0x0C
                imul    eax, edx
                mov     [ebp+Temp01], eax
                mov     eax, [ebx+0x84]
                mov     [ebp+var_4C], edx
                sar     eax, 0x10
                mov     edx, [ebp+Temp01]
                sub     eax, 2
                imul    eax, edx
                sar     eax, 4
                mov     [ebx+0x2C], eax  #; X Speed
                mov     eax, [ebx+0x10]
                mov     edx, ds:0x51E074
                shl     eax, 2
                add     eax, edx
                mov     edx, [ebp+var_4C]
                mov     eax, [eax]
                imul    eax, edx
                mov     [ebp+Temp01], eax
                mov     eax, [ebx+0x84]
                sar     eax, 0x10
                mov     edx, [ebp+Temp01]
                sub     eax, 2
                imul    eax, edx
                sar     eax, 4
                mov     [ebx+0x34], eax  #; Z speed
                mov     eax, 1
                mov     word ptr [ebx+0x0EA], 9 #; Set sound to spindash takeoff
                mov     [ebp+var_44], eax

loc_486078:                             #; CODE XREF: CharPhysics+885j
                mov     edx, 6
                mov     eax, ecx
                mov     [ebp+Temp01], edx
                mov     edx, ecx
                mov     ecx, [ebp+Temp01]
                sar     edx, 0x1F
                idiv    ecx
                mov     ecx, eax
                mov     eax, [ebx+0x44]
                mov     word ptr [ebx+0x86], 1
                test    eax, eax
                jnz     short loc_4860B9
                cmp     dword ptr [ebx+0x48], 0
                jnz     short loc_4860B9
                cmp     dword ptr [ebx+0x2C], 0 #; X Speed
                jnz     short loc_4860B9
                cmp     dword ptr [ebx+0x34], 0 #; Z Speed
                jnz     short loc_4860B9

loc_4860B0:                             #; CODE XREF: CharPhysics+772j
                                        #; CharPhysics+781j ...
                mov     word ptr [ebx+0x86], 0 #; Stop rolling
                jmp     CharDiff_SlopePhysics #; default
#; --------------------------------------------------------------------------

CharDif_Action_Tails:                             #; CODE XREF: CharPhysics+31Dj
                                        #; DATA XREF: BEGTEXT:0x485740o
                                        
                #; Boost bar display management that is very ineffecient
                cmp    word ptr [ebx+0x72], 0 #; On ground?
                jz CharDif_Action_Tails_BarSkip
                mov dword ptr [ebx+0x19C], 62 #; Reset meter to full
                
                
CharDif_Action_Tails_BarSkip:
                mov     eax, [ebx+0x94]  #; Tails
                sar     eax, 0x10
                cmp     eax, 2          #; Got airtime?
                jnz     short loc_485AFF
                mov     eax, [ebx+0x72]  #; Not on ground?
                sar     eax, 0x10
                cmp     eax, 2
                jnz     short loc_485AFF
                mov     word ptr [ebx+0x0FE], 1 #; Set flying flag

loc_485AFF:                             #; CODE XREF: CharPhysics+381j
                                        #; CharPhysics+38Cj
                mov     eax, [ebx+0x0FC] #; Currently not flying?
                sar     eax, 0x10
                cmp     eax, 1
                jnz     CharDiff_SlopePhysics #; default
                mov     eax, [ebx+0x72]
                sar     eax, 0x10
                cmp     eax, 2          #; Flying?
                jnz     short loc_485B44
                mov     eax, [ebx+0x9E]  #; In a loop?
                sar     eax, 0x10
                test    eax, eax
                jnz     short loc_485B44
                mov     eax, [ebx+0x70]  #; On ground?
                sar     eax, 0x10
                test    eax, eax
                jnz     short loc_485B44
                mov     eax, [ebx+0x94]  #; Fall timer expired?
                sar     eax, 0x10
                cmp     eax, 0x3C
                jle     short loc_485B53

loc_485B44:                             #; CODE XREF: CharPhysics+3B5j
                                        #; CharPhysics+3C2j ...
                mov     word ptr [ebx+0x74], 0x0FFFF #; Start falling
                mov     word ptr [ebx+0x0FE], 0

loc_485B53:                             #; CODE XREF: CharPhysics+3DAj
                inc     word ptr [ebx+0x96] #; Increase fly counter
                mov eax, 62
                sub ax, word ptr [ebx+0x96] #; Increase fly counter
                mov dword ptr [ebx+0x19C], eax
                jmp     CharDiff_SlopePhysics #; default
#; --------------------------------------------------------------------------

CharDif_Action_Knux:                             #; CODE XREF: CharPhysics+31Dj
                                        #; DATA XREF: BEGTEXT:0x485740o
                mov     eax, [ebx+0x94]  #; Knux
                sar     eax, 0x10        #; Jumping, not falling
                cmp     eax, 2
                jnz     short loc_485B81
                mov     eax, [ebx+0x72]  #; Double jumping?
                sar     eax, 0x10
                cmp     eax, 2
                jnz     short loc_485B81
                mov     word ptr [ebx+0x0FE], 4 #; Set flag

loc_485B81:                             #; CODE XREF: CharPhysics+403j
                                        #; CharPhysics+40Ej
                mov     eax, [ebx+0x0FC] #; Is flag set?
                sar     eax, 0x10
                cmp     eax, 4
                jnz     CharDiff_SlopePhysics #; default
                mov     eax, [ebx+0x72]  #; Dbl jmp?
                sar     eax, 0x10
                mov     esi, [ebp+JumpHeight]
                cmp     eax, 2
                jnz     short loc_485BB8
                mov     eax, [ebx+0x9E]  #; In loop?
                sar     eax, 0x10
                test    eax, eax
                jnz     short loc_485BB8
                mov     eax, [ebx+0x70]  #; On ground?
                sar     eax, 0x10
                test    eax, eax
                jz      short loc_485BC7

loc_485BB8:                             #; CODE XREF: CharPhysics+437j
                                        #; CharPhysics+444j
                mov     word ptr [ebx+0x74], 0x0FFFF #; Start jumping?
                mov     word ptr [ebx+0x0FE], 0

loc_485BC7:                             #; CODE XREF: CharPhysics+44Ej
                mov     word ptr [ebx+0x96], 3 #; Set flight flag
                jmp     CharDiff_SlopePhysics #; default
#; --------------------------------------------------------------------------

CharDif_Action_Amy:                             #; CODE XREF: CharPhysics+31Dj
    
    #; Lots of FPU stuff, because angles.
    #; Hopefully this'll work alright?
    
    #; In an external function because I had to use a C compiler for this
    
    push eax
    push ecx
    push edx
    push edi
    push esi
        push ebx
        push [ebp+Input]
        call CharDif_Action_Amy_Extern
        add esp, 8
    pop esi
    pop edi
    pop edx
    pop ecx
    pop eax
    
    jmp CharDiff_SlopePhysics
#; --------------------------------------------------------------------------

CharDif_Action_Fang:                             #; CODE XREF: CharPhysics+31Dj
                                        #; DATA XREF: BEGTEXT:0x485740o
	mov     eax, [ebp+Input] #; Eggman, Eggrobo
	xor     edx, edx
	#and     eax, 0x620
	and eax, 0x40
	mov     dx, ax
	mov     eax, ebx
	call    Eggman_ShootMissile
	
	#; Set BoostBar vars
	mov ax, 90
	sub ax, word ptr [ebx+0x7E] #; Cooldown timer
	cwde
	mov dword ptr [ebx+0x19C], eax
	
	cmp dword ptr [ebx+0x18], 10 #; Do we have rings?
	jg CharDiff_SlopePhysics
	xor eax, eax
	mov dword ptr [ebx+0x19C], eax #; Clear Boost Bar
	
	jmp     CharDiff_SlopePhysics #; default
#; --------------------------------------------------------------------------

CharDif_Action_MSonic:
    #; Hybrid of Blaze and Silver
    #; Never ending boost that takes away all of your controls

    #; Check if we're holding Action
    test word ptr [ebp+Input], 0x40
    jz CharDiff_SlopePhysics
    
    #; Accel Speed
    shl dword ptr [ebp+Accel]
    #; Turn traction
    mov     dword ptr [ebp+TurnTraction], 0 #; Actually deaccel?!
    #; Flat-land decel
    #;mov     dword ptr [ebp+Deaccel], 0 #; Actually jump height!
    #; Jump height
    mov     dword ptr [ebp+JumpHeight], 0
    #; Turn speed (standing still/midair)
    #;xor     ecx, ecx
    shr ecx, 3
    #; Slipperiness
    #;mov     dword ptr [ebp+TurnSpeed], 0
    shr dword ptr [ebp+TurnSpeed], 4
    jmp CharDiff_SlopePhysics

CharDif_Action_Blaze:                             #; CODE XREF: CharPhysics+31Dj
    test word ptr [ebp+Input], 0x40
    mov word ptr [ebx+0xFE], 0
    jz CharDif_Action_Blaze_RingRecover
    
#; Check if we have any boost left
    cmp dword ptr [ebx+0x19C], 0
    jle CharDif_Action_Blaze_RingRecover
    
#; Decrement boost counter
    dec dword ptr [ebx+0x19C]
    
#; Double acceleration, 1/4 turn speed
    shl dword ptr [ebp+Accel]
    shr dword ptr [ebp+TurnSpeed], 3
    
#; Add cool particle effects~!
    mov word ptr [ebx+0xFE], 3
                
CharDif_Action_Blaze_RingRecover:
    #; Subtract ring count with last ring count and add to boost meter
    mov eax, [ebx+0x18]
    sub eax, dword ptr [ebx+0x1A0]
    add dword ptr [ebx+0x1A0], eax #; Update var
    cmp eax, 0
    jl CharDif_Action_Blaze_LapRecover #; Don't add negative rings!
    shl eax, 2
    add dword ptr [ebx+0x19C], eax
    
CharDif_Action_Blaze_LapRecover:
    #; For each new lap, add 1/2 bar size
    movsx eax, word ptr [ebx+0x5E]
    sub eax, dword ptr [ebx+0x1A4]
    add dword ptr [ebx+0x1A4], eax #; Update var
    imul eax, 150 #;MaxBoost_Blaze / 2
    add dword ptr [ebx+0x19C], eax
    
    #; If race hasn't started, set to MaxBoost_Blaze (= 300)
    cmp     ds:TimeToRaceStart, dword ptr 0
    jz      CharDif_Action_Blaze_BoostCap
    mov     dword ptr [ebx+0x19C], 300
    
    #; Cap at MaxBoost_Blaze
CharDif_Action_Blaze_BoostCap:
    cmp dword ptr [ebx+0x19C], 300
    jl CharDiff_SlopePhysics
    mov dword ptr [ebx+0x19C], 300
    
    jmp     CharDiff_SlopePhysics #;Done

#; --------------------------------------------------------------------------

CharDif_Action_Silver:                             #; CODE XREF: CharPhysics+31Dj
    #; While action button is held, Silver should hover.
    #; He can hover indefinitely on the ground.
    #; He can only hover for a brief period of time (6 seconds) in air

    #; "Hovering" means "ignore friction/turning/acceleration/gravity".
    #; If Silver hovers off a cliff, the hover timer will start running.

    #; Flight Timer is used as Boost Bar source
    #;
    #; Variables:
    #; [ebx+0x19C] = Air hover time remaining (Range 0-300)
    #; --------------------------------------------------------------
    #; Boost bar display management
    
    mov dword ptr [ebx+0x1BC], 0xFFFFFFFF #; Reset character tint
    mov dword ptr [ebx+0x1A0], 0 #; Reset hover state
    cmp    word ptr [ebx+0x72], 0 #; On ground?
    jz CharDif_Action_Silver_InAir
    #;mov dword ptr [ebx+0x19C], 300 #; Reset meter to full
    cmp dword ptr [ebx+0x19C], 300
    jge CharDif_Action_Silver_Update
    add dword ptr [ebx+0x19C], 2 #; Refill meter
    jmp CharDif_Action_Silver_Update
    
CharDif_Action_Silver_InAir:
    #; Check if we have hover time remaining
    cmp dword ptr [ebx+0x19C], 0
    jle CharDif_Action_Silver_Update
    
    test word ptr [ebp+Input], 0x40 #; Check if we're holding Action
    jz CharDiff_SlopePhysics #; If not, do nothing
    
    dec dword ptr [ebx+0x19C] #; Decrement hover counter
    mov dword ptr [ebx+0x30], -8192 #; Cancel air fall speed

CharDif_Action_Silver_Update:
    #; Check if we're holding Action
    test word ptr [ebp+Input], 0x40
    jz CharDiff_SlopePhysics
    
    #; Set hover state
    mov dword ptr [ebx+0x1A0], 1
    mov dword ptr [ebx+0x1BC], 0xFFCBFFEC #; "Psychic" color
    
    #; Accel Speed
    mov     dword ptr [ebp+Accel], 0
    #; Turn traction
    mov     dword ptr [ebp+TurnTraction], 0 #; Actually deaccel?!
    #; Flat-land decel
    mov     dword ptr [ebp+Deaccel], 0 #; Actually jump height!
    #; Jump height
    mov     dword ptr [ebp+JumpHeight], 0
    #; Turn speed (standing still/midair)
    xor     ecx, ecx
    #; Slipperiness
    mov     dword ptr [ebp+TurnSpeed], 0
    
    #; Animation
    #;mov word ptr [ebx+98], 5 #; Not how that works...
    
    #; Change textures (how?)

CharDiff_SlopePhysics:                  #; CODE XREF: CharPhysics+312j
                                        #; CharPhysics+31Dj ...
                cmp     word ptr [ebx+0x72], 0 #; Jumping?
                jz      CharDiff_RollStart #; Skip if not
                mov     eax, [ebx+0x0B4] #; Going uphill?
                sar     eax, 0x10
                cmp     eax, 0x0FFFFF138
                jle     CharDiff_RollStart
                mov     eax, [ebx+0x40]  #; In water?
                sar     eax, 0x10
                test    eax, eax
                jnz     short CharDiff_RollStart
                test    byte ptr [ebp+Input+1], 0b10001 #; Accelerating with fwd or button?
                jz      short loc_485E8C
                mov     eax, [ebx+0x84]  #; Always FFFF
                sar     eax, 0x10        #; Always 0000
                test    eax, eax
                jg      short loc_485E8C #; Will never execute (?)
                mov     dh, byte ptr [ebp+Input]
                test    dh, 8           #; Pressing left
                jz      short loc_485E69
                test    dh, 0x80         #; Pressing right
                jnz     short loc_485E8C

loc_485E69:                             #; CODE XREF: CharPhysics+6FAj
                mov     eax, [ebx+0x0B2] #; Active Movement
                sar     eax, 0x10        #; Slope
                mov     edx, [ebx+0x2C]  #; X momenteum
                sar     eax, 1
                add     edx, eax
                mov     eax, [ebx+0x0B6] #; Slope
                mov     [ebx+0x2C], edx
                sar     eax, 0x10
                mov     edx, [ebx+0x34]  #; Z momenteum
                sar     eax, 1
                jmp     short loc_485EAD
#; --------------------------------------------------------------------------

loc_485E8C:                             #; CODE XREF: CharPhysics+6E5j
                                        #; CharPhysics+6F2j ...
                mov     eax, [ebx+0x0B2] #; Passive Movement
                sar     eax, 0x10        #; Slope
                mov     edx, [ebx+0x2C]  #; X Momenteum
                add     eax, eax
                add     edx, eax
                mov     eax, [ebx+0x0B6] #; Slope
                mov     [ebx+0x2C], edx
                sar     eax, 0x10
                mov     edx, [ebx+0x34]  #; Z Momenteum
                add     eax, eax

loc_485EAD:                             #; CODE XREF: CharPhysics+722j
                add     edx, eax
                mov     [ebx+0x34], edx

CharDiff_RollStart:                     #; CODE XREF: CharPhysics+6BDj
                                        #; CharPhysics+6D1j ...
                #movsx   eax, word ptr [ebx+0x0F2]
                #cmp     eax, 3
                #jge     loc_4860B9      #; Not Sonic, Tails or Knux
                #jmp     loc_4860B9      #; Not Sonic, Tails or Knux

loc_4860B9:                             #; CODE XREF: CharPhysics+754j
                                        #; CharPhysics+7C5j ...
                cmp     word ptr [ebx+0x0A0], 0 #; Jump if in a loop
                jz      short loc_4860D5
                xor     edx, edx
                mov     eax, ebx
                mov     dx, word ptr [ebp+Input]
                #call    CharDiff_Loop #; Lets you move and deaccelerate in loops.
                                       #; Crashes game right now, so I'm just not gonna bother.
                jmp     loc_48670A
#; --------------------------------------------------------------------------

loc_4860D5:                             #; CODE XREF: CharPhysics+959j
                mov     eax, ebx
                call    CharDif_CheckSpring
                mov     eax, [ebx+0x84]
                sar     eax, 0x10
                cmp     eax, 2
                jge     loc_48623D
                cmp     [ebp+var_44], dword ptr 1
                jz      loc_48623D
                mov     eax, [ebp+Deaccel] #; Don't calculate deaccel if not needed
                mov     edx, [ebx+0x30]  #; Y Speed
                test    eax, eax
                jz      loc_48629A
                test    word ptr [ebp+Input], 0x620 #; Jump button!
                jz      short loc_48614F
                cmp     dword ptr [ebx+0x68], 0
                jnz     short loc_48614F #; Jump if running on water?
                mov     eax, [ebx+0x76]  #; Out of airtime
                sar     eax, 0x10
                test    eax, eax
                jnz     short loc_48614F
                mov     eax, [ebx+0x72]  #; Check current flightmode
                sar     eax, 0x10
                test    eax, eax
                jz      short loc_48612D
                cmp     eax, 2
                jnz     short loc_486147

loc_48612D:                             #; CODE XREF: CharPhysics+9BEj
                mov     eax, [ebx+0x70]  #; Check ground flag
                sar     eax, 0x10
                test    eax, eax
                jnz     short loc_48613F
                mov     word ptr [ebx+0x74], 2 #; On ground
                jmp     short loc_486155
#; --------------------------------------------------------------------------

loc_48613F:                             #; CODE XREF: CharPhysics+9CDj
                mov     word ptr [ebx+0x74], 1 #; Falling
                jmp     short loc_486155
#; --------------------------------------------------------------------------

loc_486147:                             #; CODE XREF: CharPhysics+9C3j
                mov     word ptr [ebx+0x74], 0x0FFFF #; Jumping
                jmp     short loc_486155
#; --------------------------------------------------------------------------

loc_48614F:                             #; CODE XREF: CharPhysics+9A4j
                                        #; CharPhysics+9AAj ...
                mov     word ptr [ebx+0x74], 0 #; Involuntarily falling

loc_486155:                             #; CODE XREF: CharPhysics+9D5j
                                        #; CharPhysics+9DDj ...
                mov     eax, [ebx+0x72]
                sar     eax, 0x10
                mov     [ebp+AirStatus], eax
                test    eax, eax
                jz      loc_48629A
                mov     eax, [ebx+0x70]  #; On ground?
                sar     eax, 0x10
                test    eax, eax
                jz      loc_4861F3      #; Don't jump
                cmp     [ebp+AirStatus], dword ptr 0
                jle     loc_48629A      #; Redundancy, I guess
                mov     word ptr [ebx+0x76], 1
                mov     edx, 0x8FB94C
                mov     word ptr [ebx+0x72], 0
                cmp     edx, 1
                jnz     short loc_4861B1
                cmp     ebx, 0x8FD4E8
                jnz     short loc_4861B1
                xor     eax, eax
                mov     edx, 0x180
                mov     [0x901C60], eax
                mov     [0x901C5C], edx
                jmp     short loc_4861C3
#; --------------------------------------------------------------------------

loc_4861B1:                             #; CODE XREF: CharPhysics+A2Bj
                                        #; CharPhysics+A33j
                xor     eax, eax
                mov     edx, 0x180
                mov     [0x901C58], eax
                mov     [0x901C54], edx

loc_4861C3:                             #; CODE XREF: CharPhysics+A47j
                mov     word ptr [ebx+0x86], 0
                mov     word ptr [ebx+0x98], 1 #; Jumping animation
                mov     edx, [ebp+Deaccel]
                mov     word ptr [ebx+0x96], 2 #; Time in air
                mov     eax, ebx
                mov     word ptr [ebx+0x0EA], 7 #; Jump sound
                call    CharDiff_Jump    #; Probably moves character too.
                mov     edx, eax

loc_4861F3:                             #; CODE XREF: CharPhysics+A06j
                                        #; CharPhysics+B3Aj ...
                add     edx, 0x2000      #; Fall Acceleration
                cmp     edx, 0x25800     #; Max fall speed
                jle     short loc_486206
                mov     edx, 0x25800

loc_486206:                             #; CODE XREF: CharPhysics+A97j
                mov     eax, [ebx+0x70]  #; On Ground?
                sar     eax, 0x10
                test    eax, eax
                jz      short loc_486212 #; If so, stop falling
                xor     edx, edx

loc_486212:                             #; CODE XREF: CharPhysics+AA6j
                                        #; CharPhysics+B67j
                mov     eax, [ebx+0x0FC] #; Tails flying
                sar     eax, 0x10
                cmp     eax, 1
                jnz     short loc_486222
                
                mov     edx, 0x8200
                test    word ptr [ebp+Input], 0x40 #; Holding Camera?
                jz      loc_486222
                
                neg edx #; If not holding button, fall

loc_486222:                             #; CODE XREF: CharPhysics+AB6j
                mov     eax, [ebx+0x0FC] #; Knux gliding
                sar     eax, 0x10
                cmp     eax, 4
                jnz     short loc_486235
                mov     edx, 0x6000

loc_486235:                             #; CODE XREF: CharPhysics+AC6j
                mov     [ebx+0x30], edx
                mov     eax, edx
                add     [ebx+4], eax    #; Y speed

loc_48623D:                             #; CODE XREF: CharPhysics+980j
                                        #; CharPhysics+98Aj
                cmp     word ptr [ebx+0x88], 0 #; Has speed shoes
                jz      short loc_486262
                mov     eax, 5
                mov esi, [ebp+JumpHeight] #; New; was in all character actions.
                mov     edx, esi        #; Jump height (from forever ago)
                mov     [ebp+Temp01], eax
                sar     edx, 0x1F
                mov     eax, esi
                idiv    dword ptr [ebp+Temp01]
                add     esi, eax        #; ESI = forward speed?
                dec     word ptr [ebx+0x88] #; Speed shoes timer

loc_486262:                             #; CODE XREF: CharPhysics+ADDj
                mov     edx, [ebx+0x16]  #; X-Y Rotation
                sar     edx, 0x10
                imul    edx, esi
                mov     [ebp+Temp01], dword ptr 0x3E8
                mov     eax, edx
                sar     edx, 0x1F
                idiv    dword ptr [ebp+Temp01]
                add     esi, eax
                xor     edx, edx
                mov     eax, [ebx+0x68]  #; Water depth (?)
                mov     [ebp+var_50], edx
                test    eax, eax
                jz      short loc_4862E3 #; ??
                mov     [ebp+var_50], dword ptr 1
                cmp     eax, 0x60000
                jnz     short loc_4862D4
                mov     esi, edi
                jmp     short loc_4862F1
#; --------------------------------------------------------------------------

loc_48629A:                             #; CODE XREF: CharPhysics+998j
                                        #; CharPhysics+9F8j ...
                mov     eax, [ebx+0x74]  #; Air timeout for Tails
                sar     eax, 0x10
                test    eax, eax
                jz      loc_4861F3
                test    edx, edx        #; ebp+30
                jge     loc_4861F3
                cmp     edx, 0x0FFFF3800
                jge     short loc_4862BE
                add     edx, 0x6000

loc_4862BE:                             #; CODE XREF: CharPhysics+B4Ej
                mov     eax, edx
                sar     edx, 0x1F
                sub     eax, edx
                sar     eax, 1
                mov     word ptr [ebx+0x76], 0 #; Now we're out of airtime
                mov     edx, eax
                jmp     loc_486212
#; --------------------------------------------------------------------------

loc_4862D4:                             #; CODE XREF: CharPhysics+B2Cj
                mov     edx, edi
                mov     eax, edi
                sar     edx, 0x1F
                sub     eax, edx
                sar     eax, 1
                mov     esi, eax
                jmp     short loc_4862F1
#; --------------------------------------------------------------------------

loc_4862E3:                             #; CODE XREF: CharPhysics+B1Ej
                mov     eax, [ebx+0x3E]
                sar     eax, 0x10
                cmp     eax, 1
                jnz     short loc_4862F1
                mov     esi, [ebp+UnkAttrib]

loc_4862F1:                             #; CODE XREF: CharPhysics+B30j
                                        #; CharPhysics+B79j ...
                xor     edi, edi
                mov     word ptr [ebx+0x0D4], 0
                mov     [ebp+Drift], edi
                /*movsx   eax, word ptr [ebx+0x0F2]
                cmp     eax, 3          #; Jump if Amy
                jz      short loc_486317
                movsx   eax, word ptr [ebx+0x0F2]
                cmp     eax, 4          #; Jump if not Robotnik
                jnz     short loc_486372 #; They never go underwater*/

loc_486317:                             #; CODE XREF: CharPhysics+BA1j
                test    byte ptr [ebp+Input+1], 0x40 #; Left
                jz      short loc_486326
                add     word ptr [ebx+0x0D4], 0x80

loc_486326:                             #; CODE XREF: CharPhysics+BB3j
                test    byte ptr [ebp+Input+1], 0x80 #; Right
                jz      short loc_486335
                sub     word ptr [ebx+0x0D4], 0x80

loc_486335:                             #; CODE XREF: CharPhysics+BC2j
                test    byte ptr [ebp+Input], 8
                jz      short loc_486341
                inc     byte ptr [ebx+0x0D5]

loc_486341:                             #; CODE XREF: CharPhysics+BD1j
                test    byte ptr [ebp+Input], 0x80
                jz      short loc_486350
                sub     word ptr [ebx+0x0D4], 0x100

loc_486350:                             #; CODE XREF: CharPhysics+BDDj
                mov     eax, [ebx+0x0D2]
                sar     eax, 0x10
                cdq
                xor     eax, edx
                sub     eax, edx
                cmp     eax, 0x100
                jl      short loc_4863A0
                mov     eax, [ebx+0x0D2]
                sar     eax, 0x10
                add     eax, eax
                jmp     short loc_48639D
#; --------------------------------------------------------------------------

loc_486372:                             #; CODE XREF: CharPhysics+BADj
                cmp     [ebp+var_50], dword ptr 0
                jnz     short loc_4863A0
                test    byte ptr [ebp+Input], 8
                jz      short loc_486385
                add     byte ptr [ebx+0x0D5], 2

loc_486385:                             #; CODE XREF: CharPhysics+C14j
                test    byte ptr [ebp+Input], 0x80
                jz      short loc_486394
                sub     word ptr [ebx+0x0D4], 0x200

loc_486394:                             #; CODE XREF: CharPhysics+C21j
                mov     eax, [ebx+0x0D2]
                sar     eax, 0x10

loc_48639D:                             #; CODE XREF: CharPhysics+C08j
                mov     [ebp+Drift], eax

loc_4863A0:                             #; CODE XREF: CharPhysics+BFBj
                                        #; CharPhysics+C0Ej
                movsx   eax, word ptr [ebx+0x0F2]
                test    eax, eax        #; Jump if not Sonic
                jnz     short loc_4863BF
                mov     eax, [ebx+0x70]
                sar     eax, 0x10
                test    eax, eax        #; Jump if on ground
                jnz     short loc_4863BF
                mov     edx, [ebp+Drift]
                sar     edx, 1
                sar     ecx, 1
                mov     [ebp+Drift], edx

loc_4863BF:                             #; CODE XREF: CharPhysics+C41j
                                        #; CharPhysics+C4Bj
                cmp     dword ptr [ebx+0x44], 0 #; Fwd Speed
                jnz     short loc_4863E7 #; Jump if not still
                cmp     dword ptr [ebx+0x48], 0
                jnz     short loc_4863E7
                mov     edx, ecx
                mov     eax, ecx
                sar     edx, 0x1F
                sub     eax, edx
                sar     eax, 1
                mov     ecx, eax
                mov     eax, [ebp+Drift]
                mov     edx, eax
                sar     edx, 0x1F
                sub     eax, edx
                sar     eax, 1
                mov     [ebp+Drift], eax

loc_4863E7:                             #; CODE XREF: CharPhysics+C5Bj
                                        #; CharPhysics+C61j
                mov     eax, [ebx+0x6C]  #; Pressing fwd key?
                sar     eax, 0x10
                test    eax, eax
                jz      short loc_486408 #; Jump if not pressing
                mov     eax, [ebp+TurnSpeed]
                mov     edx, eax
                sar     edx, 0x1F
                sub     eax, edx
                sar     eax, 1
                mov     edx, [ebp+Accel]
                add     edx, edx
                mov     [ebp+TurnSpeed], eax
                mov     [ebp+Accel], edx

loc_486408:                             #; CODE XREF: CharPhysics+C87j
                mov     dl, byte ptr [ebp+Input]
                test    dl, 8
                jz      short loc_48641F
                test    dl, 0x80
                jz      short loc_48641F
                cmp     dword ptr [ebx+0x44], 0
                jz      loc_486497

loc_48641F:                             #; CODE XREF: CharPhysics+CA6j
                                        #; CharPhysics+CABj
                mov     edx, [ebp+Drift]
                imul    edx, ecx
                mov     eax, edx
                sar     edx, 0x1F
                shl     edx, 0x0A
                sbb     eax, edx
                sar     eax, 0x0A
                mov     dl, byte ptr [ebp+Input+1]
                test    dl, 0x40
                jz      short loc_48645E
                cmp     [ebp+Drift], dword ptr 0
                jz      short loc_486459
                mov     edi, [ebx+0x48]
                add     ecx, eax
                mov     eax, [ebx+0x44]
                cmp     eax, edi
                jge     short loc_486459
                cmp     eax, 0x8000
                jle     short loc_486459
                mov     word ptr [ebx+0x6E], 1

loc_486459:                             #; CODE XREF: CharPhysics+CD6j
                                        #; CharPhysics+CE2j ...
                sub     [ebx+0x10], ecx
                jmp     short loc_486497
#; --------------------------------------------------------------------------

loc_48645E:                             #; CODE XREF: CharPhysics+CD0j
                test    dl, 0x80
                jz      short loc_486489
                cmp     [ebp+Drift], dword ptr 0
                jz      short loc_486484
                sub     ecx, eax
                mov     eax, [ebx+0x44]  #; Fwd Speed
                mov     edx, [ebx+0x48]
                neg     eax
                cmp     eax, edx
                jle     short loc_486484
                cmp     eax, 0x0FFFF8000
                jge     short loc_486484
                mov     word ptr [ebx+0x6E], 0x0FFFF

loc_486484:                             #; CODE XREF: CharPhysics+CFFj
                                        #; CharPhysics+D0Dj ...
                add     [ebx+0x10], ecx
                jmp     short loc_486497
#; --------------------------------------------------------------------------

loc_486489:                             #; CODE XREF: CharPhysics+CF9j
                mov     eax, [ebp+Drift]
                mov     edx, [ebx+0x10]
                sar     eax, 5
                sub     edx, eax
                mov     [ebx+0x10], edx

loc_486497:                             #; CODE XREF: CharPhysics+CB1j
                                        #; CharPhysics+CF4j ...
                mov     eax, [ebx+0x6C]
                sar     eax, 0x10
                cmp     eax, 1
                jnz     short loc_4864B0
                mov     ecx, [ebx+0x48]
                cmp     ecx, [ebx+0x44]
                jg      short loc_4864B0
                mov     word ptr [ebx+0x6E], 0

loc_4864B0:                             #; CODE XREF: CharPhysics+D38j
                                        #; CharPhysics+D40j
                mov     eax, [ebx+0x6C]
                sar     eax, 0x10
                cmp     eax, 0x0FFFFFFFF
                jnz     short loc_4864CD
                mov     eax, [ebx+0x44]
                mov     edi, [ebx+0x48]
                neg     eax
                cmp     eax, edi
                jg      short loc_4864CD
                mov     word ptr [ebx+0x6E], 0 #; Clear fwd key flag

loc_4864CD:                             #; CODE XREF: CharPhysics+D51j
                                        #; CharPhysics+D5Dj
                cmp     word ptr [ebx+0x72], 0 #; Jump if in air
                jz      short loc_4864E5
                mov     eax, [ebx+0x0DC]
                mov     edx, [ebx+0x10]
                sar     eax, 0x10
                add     edx, eax
                mov     [ebx+0x10], edx

loc_4864E5:                             #; CODE XREF: CharPhysics+D6Aj
                mov     edx, [ebx+0x6E]
                mov     ecx, [ebx+0x10]  #; XY Rotation
                sar     edx, 0x10
                and     ecx, 0x0FFF
                sub     edx, ecx
                and     edx, 0x0FFF
                mov     [ebx+0x10], ecx
                cmp     edx, 0x800
                jl      short loc_486512
                mov     eax, 0x1000
                sub     eax, edx
                mov     edx, eax
                neg     edx

loc_486512:                             #; CODE XREF: CharPhysics+D9Dj
                mov     eax, [ebx+0x6E]
                sar     edx, 3
                sar     eax, 0x10
                sub     eax, edx
                mov     [ebx+0x70], ax
                mov     cl, [ebx+0x71]
                mov     eax, [ebx+0x84]
                and     cl, 0x0F
                sar     eax, 0x10
                mov     [ebx+0x71], cl
                cmp     eax, 2
                jge     loc_48670A
                mov     eax, 0x1000
                sub     eax, [ebx+0x10]
                and     eax, 0x0FFF
                mov     edx, 0x92568C[eax*4]
                sar     edx, 2
                mov     [ebp+var_58], edx
                mov     edx, ds:0x51E074
                mov     ecx, [edx+eax*4]
                sar     ecx, 2
                mov     eax, [ebx+0x2C]
                imul    eax, ecx
                mov     edi, [ebp+var_58]
                mov     edx, [ebx+0x34]
                imul    edx, edi
                add     edx, eax
                mov     eax, edx
                sar     edx, 0x1F
                shl     edx, 0x0C
                sbb     eax, edx
                sar     eax, 0x0C
                mov     edx, [ebx+0x34]
                imul    edx, ecx
                mov     edi, eax
                mov     eax, [ebx+0x2C]
                imul    eax, [ebp+var_58]
                sub     edx, eax
                mov     eax, edx
                sar     edx, 0x1F
                shl     edx, 0x0C
                sbb     eax, edx
                sar     eax, 0x0C
                mov     edx, [ebp+Drift]
                mov     ecx, eax
                mov     eax, [ebp+TurnSpeed]
                imul    eax, edx
                sar     eax, 0x0A
                test    edi, edi
                jge     short loc_4865BD
                mov     edx, [ebp+TurnSpeed]
                sub     edx, eax
                add     edi, edx
                test    edi, edi
                jle     short loc_4865CA
                jmp     short loc_4865C8
#; --------------------------------------------------------------------------

loc_4865BD:                             #; CODE XREF: CharPhysics+E46j
                jle     short loc_4865CA
                add     eax, [ebp+TurnSpeed]
                sub     edi, eax
                test    edi, edi
                jge     short loc_4865CA

loc_4865C8:                             #; CODE XREF: CharPhysics+E53j
                xor     edi, edi

loc_4865CA:                             #; CODE XREF: CharPhysics+E51j
                                        #; CharPhysics:loc_4865BDj ...
                mov     eax, [ebp+TurnTraction]
                add     eax, eax
                test    ecx, ecx
                jge     short loc_4865DB
                add     ecx, eax
                test    ecx, ecx
                jle     short loc_4865E5
                jmp     short loc_4865E3
#; --------------------------------------------------------------------------

loc_4865DB:                             #; CODE XREF: CharPhysics+E69j
                jle     short loc_4865E5
                sub     ecx, eax
                test    ecx, ecx
                jge     short loc_4865E5

loc_4865E3:                             #; CODE XREF: CharPhysics+E71j
                xor     ecx, ecx

loc_4865E5:                             #; CODE XREF: CharPhysics+E6Fj
                                        #; CharPhysics:loc_4865DBj ...
                mov     al, byte ptr [ebp+Input]
                test    al, 8
                jz      short CharDif_FinalizeAccel
                test    al, 0x80
                jz      short CharDif_FinalizeAccel
                mov     eax, [ebx+0x70]
                sar     eax, 0x10
                test    eax, eax
                jz      short CharDif_FinalizeAccel
                test    ecx, ecx
                jle     short loc_486654
                mov     eax, [ebx+0x44]
                cdq
                xor     eax, edx
                sub     eax, edx
                mov     [ebp+Temp01], eax
                mov     eax, [ebx+0x48]
                cdq
                xor     eax, edx
                sub     eax, edx
                cmp     eax, [ebp+Temp01]
                jge     short loc_486625
                cmp     dword ptr [ebx+0x44], 0x1000
                jle     short loc_486625
                inc     word ptr [ebx+0x6C]
                jmp     short loc_48662B
#; --------------------------------------------------------------------------

loc_486625:                             #; CODE XREF: CharPhysics+EACj
                                        #; CharPhysics+EB5j
                mov     word ptr [ebx+0x6C], 0

loc_48662B:                             #; CODE XREF: CharPhysics+EBBj
                sub     ecx, [ebp+Accel]
                test    ecx, ecx
                jge     short loc_48665A
                xor     ecx, ecx
                jmp     short loc_48665A
#; --------------------------------------------------------------------------

CharDif_FinalizeAccel:                             #; CODE XREF: CharPhysics+E82j
                                        #; CharPhysics+E86j ...
                test    byte ptr [ebp+Input+1], 0x31 #; Forward or accelerate or backwards?
                jz      short loc_486654

                cmp     ds:TimeToRaceStart, dword ptr 0 #; Has race started?
                jnz     short loc_486654

                mov     word ptr [ebx+0x6C], 0x0FFFF
                cmp     ecx, esi
                jge     short loc_48665A

                test    byte ptr [ebp+Input+1], 0x20 #; Backwards
                je     CharDif_FinalizeAccel_Fwd
CharDif_FinalizeAccel_Back:
                sub     ecx, [ebp+Accel]
                jmp     short loc_48665A
CharDif_FinalizeAccel_Fwd:
                add     ecx, [ebp+Accel]
                jmp     short loc_48665A
#; --------------------------------------------------------------------------

loc_486654:                             #; CODE XREF: CharPhysics+E94j
                                        #; CharPhysics+ED2j ...
                mov     word ptr [ebx+0x6C], 0

loc_48665A:                             #; CODE XREF: CharPhysics+EC8j
                                        #; CharPhysics+ECCj ...
                cmp     edi, esi
                jle     short loc_486660
                mov     edi, esi

loc_486660:                             #; CODE XREF: CharPhysics+EF4j
                mov     eax, esi
                neg     eax
                cmp     edi, eax
                jge     short loc_48666A
                mov     edi, eax

loc_48666A:                             #; CODE XREF: CharPhysics+EFEj
                cmp     [ebp+var_50], dword ptr 1
                jnz     short loc_48667A
                cmp     ecx, esi
                jle     short loc_48667A
                sub     ecx, 0x1000

loc_48667A:                             #; CODE XREF: CharPhysics+F06j
                                        #; CharPhysics+F0Aj
                neg     esi
                cmp     ecx, esi
                jge     short loc_486686
                add     ecx, 0x4000

loc_486686:                             #; CODE XREF: CharPhysics+F16j
                mov     edx, [ebp+MaxFwdSpeed]
                cmp     ecx, edx
                jle     short loc_48668F
                mov     ecx, edx

loc_48668F:                             #; CODE XREF: CharPhysics+F23j
                mov     eax, [ebp+MaxFwdSpeed]
                neg     eax
                cmp     ecx, eax
                jge     short loc_48669A
                mov     ecx, eax

loc_48669A:                             #; CODE XREF: CharPhysics+F2Ej
                mov     [ebx+0x48], edi
                mov     eax, [ebx+0x10]
                mov     [ebx+0x44], ecx
                shl     eax, 2
                mov     edx, ds:0x51E074
                mov     esi, 0x92568C[eax]
                sar     esi, 2
                add     eax, edx
                mov     edx, ecx
                imul    edx, esi
                mov     eax, [eax]
                sar     eax, 2
                mov     [ebp+var_54], eax
                imul    eax, edi
                add     edx, eax
                mov     eax, edx
                sar     edx, 0x1F
                shl     edx, 0x0C
                sbb     eax, edx
                sar     eax, 0x0C
                imul    ecx, [ebp+var_54]
                mov     edx, edi
                imul    edx, esi
                sub     ecx, edx
                mov     [ebx+0x2C], eax  #; Load X speed
                mov     edx, ecx
                mov     eax, ecx
                sar     edx, 0x1F
                shl     edx, 0x0C
                sbb     eax, edx
                sar     eax, 0x0C
                mov     [ebx+0x34], eax  #; Set Z Speed
                mov     ecx, [ebx]      #; Load X pos
                mov     eax, [ebx+0x2C]  #; Load X Speed
                mov     esi, [ebx+8]    #; Load Z pos
                add     ecx, eax
                mov     eax, [ebx+0x34]  #; Load Z Speed
                mov     [ebx], ecx      #; X pos += X speed
                add     esi, eax
                mov     [ebx+8], esi    #; Z pos += Z Speed

loc_48670A:                             #; CODE XREF: CharPhysics+968j
                                        #; CharPhysics+DCEj
                lea     esp, [ebp-0x10]
                pop     edi
                pop     esi
                pop     ecx
                pop     ebx
                pop     ebp
                ret
.org 0x486714, 0x0F0B

/*
#; Slope "bug" fix
#; See https://iinvisibleup.neocities.org/articles/16
. = 0x485E20
CharDiff_SpeedCheck:
    cmp     word ptr [ebx+0x72], 0 # Skip if jumping
    jz      CharDiff_RollStart
    mov     eax, [ebx+44]
    cmp     eax, dword ptr SlopeFix_SpeedCutoff    # Speed cutoff
    jg      CharDiff_SlopeCheckSkip

    mov     eax, [ebx+0xB4] # Skip if not on big hill
    sar     eax, 0x10
    cmp     eax, dword ptr SlopeFix_AngleCutoff # Cutoff angle
    jle     CharDiff_RollStart

CharDiff_SlopeCheckSkip:
    test    byte ptr [ebp-0x13], 0x11 # Accelerating with fwd or button?
    jz      CharDiff_RollStart
    mov     eax, [ebx+0x84]
    sar     eax, 0x10
    test    eax, eax
    jg      CharDiff_RollStart
    mov     dh, byte ptr [ebp-0x14]
    test    dh, 0x08           # Pressing left
    jz      loc_485E69
    test    dh, 0x80        # Pressing right
    jnz     CharDiff_RollStart

.org 0x485E69, 0x90
    loc_485E69:

.org 0x485E8C
    loc_485E8C:

.org 0x485EB2
CharDiff_RollStart:
*/

#; DebugText_Write patch (Printf_NetDummy)
. = 0x4868D0
jmp DebugText_Write
nop

#; Malloc-InitCharacterSelect
.org 0x48C985 #; Skip jets
xor edi, edi
jmp loc_48CA21
.org 0x48CA21, 0x90
loc_48CA21:

.org 0x48CAF5
jmp CharSelect_LoadTex

.org 0x48CAFA
loc_48CAFA:

#; Randomize GP characters!
.org 0x48CFE1
push    word ptr [0x8FD5E6]
RandomizeChars:
        push    ebx
        mov     ebx, 0x8FD5E6 + 0x71C
        sub     esp, 24
        #;movsx   eax, WORD PTR [esp+32]
        movsx eax, WORD PTR [0x8FD5E6]
        mov     DWORD PTR [esp+8], 0
        mov     DWORD PTR [esp+12], 0
        mov     BYTE PTR [esp+8+eax], 1
RandomizeChars.L2:
        call    rand
        and     eax, 7
        movsx   edx, ax
        cmp     BYTE PTR [esp+8+edx], 0
        jne      RandomizeChars.L2
        
        mov     BYTE PTR [esp+8+edx], 1
        mov     WORD PTR [ebx], ax
        add     ebx, 0x71C
        cmp     ebx, 0x8FF972
        jne     RandomizeChars.L2
        add     esp, 24
        pop     ebx
pop eax
.org 0x48D0C6, 0x90

#; Display char portrait instead of model
    #; It's a loop, where
    #; ESI is # of portraits to draw
    #; EDI is P1 RAM base
    #; [ebp-0x48] is your loop iterator
    #; [ebp-0x24] is # of portraits to draw << 4
    #; [ebp-0x38] is X offset to draw to?
    #; It is OK to destory EAX, EBX, ECX, EDX.
    #; (This is super space-crunched, btw.)
.org 0x48DADA

jmp CharSelect_DispPortrait
    
.org 0x48DB54, 0x90
loc_48DB54:

#; Disable jet update and stuff on Records screen
.org 0x4912CE
.org 0x4912D3, 0x90

#; Make Nack not 12 feet under
.org 0x491B19
mov edx, dword ptr [0x05018C0]
.org 0x491B20, 0x90

#; Remove 640px width cap on resolution selector
. = 0x492210
.org 0x492218, 0x90

#; Make results screen not crash due to missing EggRobo model
.org 0x4C72E8
jmp loc_4C737D
.org 0x4C737D, 0x90
loc_4C737D:

#; Fix Nack's position on results screen
.org 0x4C82DE
.org 0x4C82E1, 0x90

#; VirtWindowsSize -> SetAspRatio
. = 0x004CBE1A

SetAspRatio:
    mov edx, [0x008FD484] #; Window size
    test edx, edx
    je Fullscreen
    
#; Multiply width by 0.75 to go from "widescreen" -> "fullscreen"
    mov edi, [0x006E9898]
    mov esi, edi
    shr esi, 02
    sub edi, esi
    mov esi, [0x006E989C]
    jmp Done
    
. = 0x004CBE5F
Fullscreen:

. = 0x004CBE6B
Done:

#; Write VirtualLeftBound to donor address
#;. = 0x4CC0F7
#;.byte 0xFC

#; Hackishly fix clipping by taking some random, always large address and using that as the clipping bound. May or may not be bad for performannce.
#;. = 0x4CC10E
#;.byte 0x30

#;.org 0x4CC10C
.org 0x4CC0F5
    call Render_SetViewport_Classic
    cmp dword ptr [0x6E9908], 3 #; 3 or 4P?
    jg Render_SetViewport_HDSkip
    cmp dword ptr [0x6E9908], 1 #; Not 2P?
    je Render_SetViewport_HDCall
    cmp dword ptr [0x8FD45C], 1 #; 2P Split?
    je Render_SetViewport_HDSkip
    
Render_SetViewport_HDCall:
    call Render_SetViewport_HD
Render_SetViewport_HDSkip:
.org 0x4CC1A6, 0x90
#;org 0x4CC115, 0x90

#; Reserve donor memory address to keep UI elements centered
#;. = 0x4CC18D
#;nop
#;nop
#;nop
#;nop
#;nop
#;nop

#; Use actual screen width when setting camera viewport
. = 0x4CC206
.byte 0x98

#; Avoid calling wrong character load functions
.org 0x4CDA9C
.org 0x4CDAA6, 0x90

#; Increase draw distance multiplier
.org 0x4CDBB4
mov eax, 0x7FF
.org 0x4CDBD1
mov edi, 0x1FF

#; Skip mode selection screen; always use Direct3D because DDraw WILL crash instantly
.org 0x4CE22F
xor eax, eax
.org 0x4CE240, 0x90

#; Always be able to pick up rings
.org 0x4CF552
.org 0x4CF554, 0x90

#; Make the console shut up about the CD
.org 0x4D01DB
.org 0x4D01E9, 0x90

#; Required by LoadMoreSFX
.org 0x4D064C
LoadSFXFiles:

.org 0x4D0760
sub_4D0760:

#; Hijack call to point to LoadMoreSFX
.org 0x4D0AB5
call LoadMoreSFX

#; No-CD patch
. = 0x4D0FC3
nop
nop

. = 0x4D0FEA
.byte 0x90, 0x90, 0xEB

#; Inject BoostBar into D3D_Render_HudElements
.org 0x4D2EBA
push [ebp-0x1C]
call BoostBar_Draw
#;.org 0x4D2F3B, 0x90
.org 0x4D2FC9, 0x90

#; Always render ring counter
.org 0x4D3420
.org 0x4D3426, 0x90

#; Move up the place icons in multiplayer to be above BoostBar
.org 0x4D36C8
mov edx, 0x160

#; Remove rendering balloon/coin counter, as BoostBar handles that now
.org 0x4D3717
.org 0x4D38FA, 0x90

.org 0x4D59F9
CharDiff_Loop:

.org 0x4D9DD0
sub_4D9DD0:

.org 0x4DAB24
Credits_ShowTextLine:
#.org 0x4DAB53
#loc_4DAB53:

#; Disable Sonic R branding on title screen
.org 0x4DDE09
.org 0x4DDF48, 0x90

#; Define builtin functions
. = 0x4E09A0
_nmalloc_:

. = 0x4E0CEB
fopen_:

. = 0x4E0DD7
fread_:

. = 0x4E0FD6
fclose_:

. = 0x4E1342
rand:

. = 0x4EA8D2
lstrcatA:

. = 0x4EA968
lstrcpyA:

. = 0x4EAA28
GetProcAddress:

. = 0x4EAA2E
LoadLibraryA:

. = 0x4EAA3A
wsprintfA:

#; Force padding
.org 0x4EAB18, 0x00

.data

#; Edit animations table
.org 0x4FBDF8
    #; Sonic
    .int 0x4FA4C0
    .int 0x0C
    
    #; Tails
    .int 0x4FA6C8
    .int 0x10
    
    #; Knux
    .int 0x4FA9C0
    .int 0x0B
    
    #; Amy (copy Sonic)
    .int 0x4FA4C0
    .int 0x0C
    
    #; Fang (copy Sonic)
    .int 0x4FA4C0
    .int 0x0C
    
    #; Metal Sonic
    .int 0x4FB15C
    .int 0x0A
    
    #; Silver (copy Sonic)
    .int 0x4FA4C0
    .int 0x0C
    
    #; Blaze (copy Sonic)
    .int 0x4FA4C0
    .int 0x0C
    
#; Everyone must sink. EVERYONE.
#; Making them all 4 because my terrible asm patcher doesn't like all 0s
.org 0x50157C
.word 4 #; Sonic
.word 4 #; Tails
.word 4 #; Knux
.word 4 #; Amy
.word 4 #; Fang
.word 4 #; M.Sonic
.word 4 #; Silver
.word 4 #; Blaze
    
.org 0x5050E2
Ending_LogoXPosTable:
    
#; "rb" string (one of like 32)
.org 0x51FD44 
aRb:

.org 0x524746
MSVCRT:
	.string	"msvcrt.dll"
KERNEL32:
	.string	"kernel32.dll"
FREOPEN:
	.string	"freopen"
ALLOCCONSOLE:
	.string	"AllocConsole"
FREELIBRARY:
	.string	"FreeLibrary"
__IOB_FUNC:
	.string	"__iob_func"
W:
	.string	"w"
CONOUT:
	.string	"CONOUT$"
VPRINTF:
	.string	"vprintf"
FINDFIRST:
	.asciz "FindFirstFileA"
FINDNEXT:
	.asciz "FindNextFileA"
NEWLINE:
    .string "\n"
	
LoadCharacters.LC0:
	.string	"*"
LoadCharacters.LC1:
	.string	"bin\\chars\\"
LoadCharacters.LC2:
	.string	"bin\\chars\\%d\\"
LoadCharacters.LC3:
	.string	"model.srm"
LoadCharacters.LC4:
	.string	"tint.grd"
LoadCharacters.LC5:
	.string	"an*.bin"
LoadCharacters.LC6:
	.string	"%san%d.bin"
LoadCharacters.LC7:
    .string "attribs.dat"
	
#;GFMC_Debug:
#;    .string "Files found: %d\n"
    
CharSelect_Portraits:
    .string "bin\\option\\charpix.raw"
    
#;GDT_Test:
#;    .string "@0Test Font1@1Test Font2@x"
    
BoostBar_Draw.LC0:
	.string	"@x"
BoostBar_Draw.LC1:
	.long	1140457472
	
Bomb_Update.LC1:
    .float 16000.0
    
SoundSfxRingLoss_wav:
    .string "sound\\sfx\\ringloss.wav"
	
#; Character position data

CharPos_Small:
#; (0)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (1)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (2)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (3)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (4)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (5)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (6)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (7)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (8)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (9)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (10)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (11)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (12)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (13)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (14)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (15)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (16)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (17)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (18)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (19)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (20)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (21)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (22)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (23)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (24)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (25)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (26)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (27)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (28)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (29)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (30)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (31)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (32)
.word 0x00FD
.word 0x0000
.word 0x0003
#; (33)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (34)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (35)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (36)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (37)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (38)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (39)
.word 0x009B
.word 0x0000
.word 0x0004
#; (40)
.word 0x00A8
.word 0x0000
.word 0x0004
#; (41)
.word 0x00AC
.word 0x0000
.word 0x0004
#; (42)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (43)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (44)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (45)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (46)
.word 0x009F
.word 0x0000
.word 0x0003
#; / (47)
.word 0x00EB
.word 0x0000
.word 0x0005
#; 0 (48)
.word 0x00B0
.word 0x0000
.word 0x0006
#; 1 (49)
.word 0x00B6
.word 0x0000
.word 0x0005
#; 2 (50)
.word 0x00BB
.word 0x0000
.word 0x0006
#; 3 (51)
.word 0x00C1
.word 0x0000
.word 0x0006
#; 4 (52)
.word 0x00C7
.word 0x0000
.word 0x0006
#; 5 (53)
.word 0x00CD
.word 0x0000
.word 0x0006
#; 6 (54)
.word 0x00D3
.word 0x0000
.word 0x0006
#; 7 (55)
.word 0x00D9
.word 0x0000
.word 0x0006
#; 8 (56)
.word 0x00DF
.word 0x0000
.word 0x0006
#; 9 (57)
.word 0x00E5
.word 0x0000
.word 0x0006
#; (58)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (59)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (60)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (61)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (62)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (63)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (64)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (65)
.word 0x0000
.word 0x0000
.word 0x0006
#; (66)
.word 0x0006
.word 0x0000
.word 0x0006
#; (67)
.word 0x000C
.word 0x0000
.word 0x0006
#; (68)
.word 0x0012
.word 0x0000
.word 0x0006
#; (69)
.word 0x0018
.word 0x0000
.word 0x0005
#; (70)
.word 0x001C
.word 0x0000
.word 0x0005
#; (71)
.word 0x0022
.word 0x0000
.word 0x0006
#; (72)
.word 0x0028
.word 0x0000
.word 0x0006
#; (73)
.word 0x002E
.word 0x0000
.word 0x0005
#; (74)
.word 0x0033
.word 0x0000
.word 0x0005
#; (75)
.word 0x0038
.word 0x0000
.word 0x0006
#; (76)
.word 0x003E
.word 0x0000
.word 0x0005
#; (77)
.word 0x0043
.word 0x0000
.word 0x0008
#; (78)
.word 0x004B
.word 0x0000
.word 0x0007
#; (79)
.word 0x0052
.word 0x0000
.word 0x0006
#; (80)
.word 0x0058
.word 0x0000
.word 0x0006
#; (81)
.word 0x005E
.word 0x0000
.word 0x0006
#; (82)
.word 0x0064
.word 0x0000
.word 0x0006
#; (83)
.word 0x006A
.word 0x0000
.word 0x0006
#; (84)
.word 0x0070
.word 0x0000
.word 0x0005
#; (85)
.word 0x0075
.word 0x0000
.word 0x0006
#; (86)
.word 0x007B
.word 0x0000
.word 0x0006
#; (87)
.word 0x0081
.word 0x0000
.word 0x0009
#; (88)
.word 0x008A
.word 0x0000
.word 0x0006
#; (89)
.word 0x0090
.word 0x0000
.word 0x0006
#; (90)
.word 0x0096
.word 0x0000
.word 0x0006
#; (91)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (92)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (93)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (94)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (95)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (96)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (97)
.word 0x0000
.word 0x000C
.word 0x0006
#; (98)
.word 0x0006
.word 0x000C
.word 0x0006
#; (99)
.word 0x000C
.word 0x000C
.word 0x0006
#; (100)
.word 0x0012
.word 0x000C
.word 0x0006
#; (101)
.word 0x0018
.word 0x000C
.word 0x0006
#; (102)
.word 0x001E
.word 0x000C
.word 0x0005
#; (103)
.word 0x0023
.word 0x000C
.word 0x0006
#; (104)
.word 0x0029
.word 0x000C
.word 0x0006
#; (105)
.word 0x002F
.word 0x000C
.word 0x0003
#; (106)
.word 0x0032
.word 0x000C
.word 0x0004
#; (107)
.word 0x0036
.word 0x000C
.word 0x0006
#; (108)
.word 0x003C
.word 0x000C
.word 0x0004
#; (109)
.word 0x0040
.word 0x000C
.word 0x0009
#; (110)
.word 0x0049
.word 0x000C
.word 0x0006
#; (111)
.word 0x004F
.word 0x000C
.word 0x0006
#; (112)
.word 0x0055
.word 0x000C
.word 0x0006
#; (113)
.word 0x005B
.word 0x000C
.word 0x0006
#; (114)
.word 0x0061
.word 0x000C
.word 0x0005
#; (115)
.word 0x0066
.word 0x000C
.word 0x0006
#; (116)
.word 0x006C
.word 0x000C
.word 0x0005
#; (117)
.word 0x0071
.word 0x000C
.word 0x0006
#; (118)
.word 0x0077
.word 0x000C
.word 0x0006
#; (119)
.word 0x007D
.word 0x000C
.word 0x0009
#; (120)
.word 0x0086
.word 0x000C
.word 0x0006
#; (121)
.word 0x008C
.word 0x000C
.word 0x0006
#; (122)
.word 0x0092
.word 0x000C
.word 0x0006
#; (123)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (124)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (125)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (126)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (127)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (128)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (129)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (130)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (131)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (132)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (133)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (134)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (135)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (136)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (137)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (138)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (139)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (140)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (141)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (142)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (143)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (144)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (145)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (146)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (147)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (148)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (149)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (150)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (151)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (152)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (153)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (154)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (155)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (156)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (157)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (158)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (159)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (160)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (161)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (162)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (163)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (164)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (165)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (166)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (167)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (168)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (169)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (170)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (171)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (172)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (173)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (174)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (175)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (176)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (177)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (178)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (179)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (180)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (181)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (182)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (183)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (184)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (185)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (186)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (187)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (188)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (189)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (190)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (191)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (192)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (193)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (194)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (195)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (196)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (197)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (198)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (199)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (200)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (201)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (202)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (203)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (204)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (205)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (206)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (207)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (208)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (209)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (210)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (211)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (212)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (213)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (214)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (215)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (216)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (217)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (218)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (219)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (220)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (221)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (222)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (223)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (224)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (225)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (226)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (227)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (228)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (229)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (230)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (231)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (232)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (233)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (234)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (235)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (236)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (237)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (238)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (239)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (240)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (241)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (242)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (243)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (244)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (245)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (246)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (247)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (248)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (249)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (250)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (251)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (252)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (253)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (254)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (255)
.word 0xFFFF
.word 0x0000
.word 0x0000

CharFmt_Big:
#; (0)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (1)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (2)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (3)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (4)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (5)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (6)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (7)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (8)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (9)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (10)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (11)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (12)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (13)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (14)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (15)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (16)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (17)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (18)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (19)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (20)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (21)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (22)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (23)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (24)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (25)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (26)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (27)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (28)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (29)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (30)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (31)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (32)
.word 0x00FC
.word 0x0000
.word 0x0004
#; (33)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (34)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (35)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (36)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (37)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (38)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (39)
.word 0x00D2
.word 0x0056
.word 0x0005
#; (40)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (41)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (42)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (43)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (44)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (45)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (46)
.word 0x00D7
.word 0x0056
.word 0x0004
#; (47)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (48)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (49)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (50)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (51)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (52)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (53)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (54)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (55)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (56)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (57)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (58)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (59)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (60)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (61)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (62)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (63)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (64)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (65)
.word 0x0000
.word 0x0056
.word 0x0008
#; (66)
.word 0x0008
.word 0x0056
.word 0x0008
#; (67)
.word 0x0010
.word 0x0056
.word 0x0008
#; (68)
.word 0x0018
.word 0x0056
.word 0x0008
#; (69)
.word 0x0020
.word 0x0056
.word 0x0007
#; (70)
.word 0x0027
.word 0x0056
.word 0x0007
#; (71)
.word 0x002E
.word 0x0056
.word 0x0008
#; (72)
.word 0x0036
.word 0x0056
.word 0x0008
#; (73)
.word 0x003E
.word 0x0056
.word 0x0006
#; (74)
.word 0x0045
.word 0x0056
.word 0x0006
#; (75)
.word 0x004B
.word 0x0056
.word 0x0008
#; (76)
.word 0x0053
.word 0x0056
.word 0x0006
#; (77)
.word 0x0059
.word 0x0056
.word 0x000C
#; (78)
.word 0x0065
.word 0x0056
.word 0x0009
#; (79)
.word 0x006E
.word 0x0056
.word 0x0008
#; (80)
.word 0x0076
.word 0x0056
.word 0x0008
#; (81)
.word 0x007E
.word 0x0056
.word 0x0008
#; (82)
.word 0x0086
.word 0x0056
.word 0x0008
#; (83)
.word 0x008E
.word 0x0056
.word 0x0008
#; (84)
.word 0x0096
.word 0x0056
.word 0x0008
#; (85)
.word 0x009E
.word 0x0056
.word 0x0008
#; (86)
.word 0x00A6
.word 0x0056
.word 0x0008
#; (87)
.word 0x00AE
.word 0x0056
.word 0x000C
#; (88)
.word 0x00BA
.word 0x0056
.word 0x0008
#; (89)
.word 0x00C2
.word 0x0056
.word 0x0008
#; (90)
.word 0x00CA
.word 0x0056
.word 0x0008
#; (91)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (92)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (93)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (94)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (95)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (96)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (97)
.word 0x0000
.word 0x0048
.word 0x0008
#; (98)
.word 0x0008
.word 0x0048
.word 0x0008
#; (99)
.word 0x0010
.word 0x0048
.word 0x0008
#; (100)
.word 0x0018
.word 0x0048
.word 0x0008
#; (101)
.word 0x0020
.word 0x0048
.word 0x0008
#; (102)
.word 0x0028
.word 0x0048
.word 0x0007
#; (103)
.word 0x002F
.word 0x0048
.word 0x0008
#; (104)
.word 0x0037
.word 0x0048
.word 0x0008
#; (105)
.word 0x003F
.word 0x0048
.word 0x0004
#; (106)
.word 0x0044
.word 0x0048
.word 0x0005
#; (107)
.word 0x0049
.word 0x0048
.word 0x0008
#; (108)
.word 0x0051
.word 0x0048
.word 0x0005
#; (109)
.word 0x0056
.word 0x0048
.word 0x000C
#; (110)
.word 0x0062
.word 0x0048
.word 0x0008
#; (111)
.word 0x006A
.word 0x0048
.word 0x0008
#; (112)
.word 0x0072
.word 0x0048
.word 0x0008
#; (113)
.word 0x007A
.word 0x0048
.word 0x0008
#; (114)
.word 0x0082
.word 0x0048
.word 0x0007
#; (115)
.word 0x0089
.word 0x0048
.word 0x0008
#; (116)
.word 0x0091
.word 0x0048
.word 0x0007
#; (117)
.word 0x0098
.word 0x0048
.word 0x0008
#; (118)
.word 0x00A0
.word 0x0048
.word 0x0008
#; (119)
.word 0x00A8
.word 0x0048
.word 0x000C
#; (120)
.word 0x00B4
.word 0x0048
.word 0x0008
#; (121)
.word 0x00BC
.word 0x0048
.word 0x0008
#; (122)
.word 0x00C4
.word 0x0048
.word 0x0008
#; (123)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (124)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (125)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (126)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (127)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (128)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (129)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (130)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (131)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (132)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (133)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (134)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (135)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (136)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (137)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (138)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (139)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (140)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (141)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (142)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (143)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (144)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (145)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (146)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (147)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (148)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (149)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (150)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (151)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (152)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (153)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (154)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (155)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (156)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (157)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (158)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (159)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (160)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (161)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (162)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (163)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (164)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (165)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (166)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (167)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (168)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (169)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (170)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (171)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (172)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (173)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (174)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (175)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (176)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (177)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (178)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (179)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (180)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (181)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (182)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (183)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (184)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (185)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (186)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (187)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (188)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (189)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (190)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (191)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (192)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (193)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (194)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (195)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (196)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (197)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (198)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (199)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (200)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (201)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (202)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (203)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (204)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (205)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (206)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (207)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (208)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (209)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (210)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (211)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (212)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (213)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (214)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (215)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (216)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (217)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (218)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (219)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (220)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (221)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (222)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (223)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (224)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (225)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (226)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (227)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (228)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (229)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (230)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (231)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (232)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (233)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (234)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (235)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (236)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (237)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (238)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (239)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (240)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (241)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (242)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (243)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (244)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (245)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (246)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (247)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (248)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (249)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (250)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (251)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (252)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (253)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (254)
.word 0xFFFF
.word 0x0000
.word 0x0000
#; (255)
.word 0xFFFF
.word 0x0000
.word 0x0000

	
#; HookAddr table
HookCount = 1
HookAddr:
    .long DebugText_Init
    
#; Dummy FF because my build system is kind of really slapped together
DummyTerminator:
    .string "!END!"
  
#; Force padding
.org 0x53479C, 0x00

#; Variables
.bss

. = 0x625BFC
CurrentFile:

. = 0x6260A4
TexturePagesLoaded:

. = 0x6897C8
CharDif_X:
. = 0x6897CC
CharDif_Y:
. = 0x6897D0
CharDif_Z:

. = 0x6DA61C
Ending_TextTexPage:

. = 0x6DA636
Credits_ControlCharLookup:

. = 0x6DB834
Credits_CharRenderTable:

. = 0x6DD860
RenderMode:

. = 0x6E9908
Game_WindowCount:

. = 0x6E991C
Game_HUDSplitStyle:

. = 0x713060
Game_ModelCount:

. = 0x713064
Game_PartCount:

. =  = 0x713068
Game_VertexCount:

. = 0x71306C
Game_TriCount:

. = 0x713070
Game_QuadCount:

. = 0x713074
Game_AnimFrameCount:

. = 0x713080 
Sonic_ModelAttribBasePtr:

. = 0x7130BC
Sonic_AnimFrameIdx:

. = 0x7133A0
CharModel_QuadPtr:

. = 0x7133A4 #; Custom; see attribs.dat
CharModel_AttribStart:

. = 0x713E68
CharModel_VertexPtr:

. = 0x72A5D8
CharModel_BasePtr:

. = 0x75EB18
AnimFrames_BasePtr:

. = 0x7BC4A8
Sonic_GouradPtr:

. = 0x8F6C28
MISC00TexPage:

. = 0x8F6C30
Tex_Player00:

. = 0x8F6C3C
HUDTexPage:

. = 0x8F6C49
TilesetPage:

. = 0x8FB8EC
Game_Course:

. = 0x8FB950
Game_HudStyle:

. = 0x8FB954
Game_HUDTTStyle:

. = 0x8FBA74
CoinCollection:

. = 0x8FD450
CatchUpOpt:

. = 0x901C70
Game_TaggedCharCount:

. = 0x901CC4
TimeToRaceStart:

. = 0x94BCF4
Game_Weather:
