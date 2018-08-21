.intel_syntax noprefix
.text

#; Malloc-D3D_DisplayPlayerModel
.org 0x463773
lea eax, [edx*2 + edx]
mov edx, dword ptr [CharModel_QuadStart]

.org 0x4637BA
lea eax, [edx*2 + edx]
mov edx, dword ptr [AnimFrames_BasePtr]
mov [ebp-0xF8], ecx

.org 0x463FBE
add ebx, dword ptr [CharModel_BasePtr]

.org 0x4640BC
add ebx, dword ptr [CharModel_VertexStart]

.org 0x4640D4
movzx eax, word ptr [ebx+0x20]
mov edi, dword ptr [CharModel_BasePtr]

.org 0x4640FA
movzx eax, word ptr [ebx+0x22]
mov ecx, dword ptr [CharModel_BasePtr]

.org 0x46412C
movzx eax, word ptr [ebx+0x24]
mov esi, dword ptr [CharModel_BasePtr]

.org 0x464164
movzx eax, word ptr [ebx+0x26]
mov edx, dword ptr [CharModel_BasePtr]

.org 0x464E14
mov esi, [ebp-0x54]
add esi, [eax]
shl esi, 6
add esi, dword ptr [CharModel_BasePtr]
.intel_syntax noprefix

.org 0x464E4E
mov edx, [ebp-0x54]
add edx, [eax]
shl edx, 6
add edx, dword ptr [CharModel_BasePtr]

.org 0x464E91
mov edx, [ebp-0x54]
add edx, [eax]
shl edx, 6
add edx, dword ptr [CharModel_BasePtr]

.org 0x464EE0
add edi, dword ptr [CharModel_BasePtr]

#; Malloc-DDraw_DisplayCharacterModel
.org 0x0044CDB3
shl eax, 4
lea edx, [eax + eax*4]
add edx, [Sonic_ModelAttribBasePtr]
mov edx, dword ptr [edx]
add edi, 0x23000
sub edi, ebx
	
.org 0x0044D60A
lea edx, [edx*2 + edx]
shl edx, 3
add edx, [CharModel_QuadStart]
mov edx, dword ptr [edx]
sar ebx, 0x0C

.org 0x0044D658
lea edx, [edx+edx*2]
shl edx, 3
add edx, [AnimFrames_BasePtr]
mov edx, dword ptr [edx]
mov dword ptr [ebp-0xB8], esi
xor esi, esi

.org 0x44DE51
add ebx, dword ptr [CharModel_BasePtr]

.org 0x44DF3C
imul edx, [eax+8], 0x30
add edx, [0x00713E68]
mov edx, [edx]
imul eax, [0x8FB358], 0x78

.org 0x44DF8D
add eax, dword ptr [CharModel_BasePtr]

.org 0x44DF9C
mov ebx, [ebp-0x100]
movzx edx, word ptr [ebx+0x22]
add ebx, edx
shl ebx, 6
add ebx, dword ptr [CharModel_BasePtr]

.org 0x44DFBC
mov ecx, [ebp-0x100]
movzx edx, word ptr [ecx+0x24]
add ecx, edx
add ecx, dword ptr [CharModel_BasePtr]

.org 0x44DFFB
add edx, dword ptr [CharModel_BasePtr]

.org 0x44E50E	
add edx, dword ptr [CharModel_BasePtr]

.org 0x44E52C
mov esi, [ebp-0x30]
add esi, [ebx]
shl esi, 6
add esi, dword ptr [CharModel_BasePtr]

.org 0x44E564
add ebx, dword ptr [CharModel_BasePtr]

.org 0x44E593
add ecx, dword ptr [CharModel_BasePtr]

#; Malloc-InitCharacterSelect
.org 0x48C9B3
add eax, dword ptr [CharModel_VertexStart]

.org 0x48C9E3
add eax, dword ptr [CharModel_VertexStart]

.org 0x48CA15
add eax, dword ptr [CharModel_VertexStart]

#; Malloc-InitResultsScreen
.org 0x4C730F
add eax, dword ptr [CharModel_VertexStart]

.org 0x4C7341
add eax, dword ptr [CharModel_VertexStart]

.org 0x4C7373	
add eax, dword ptr [CharModel_VertexStart]

#; Malloc-Parse3DAnimations
.org 0x0042E796
mov [ebp+OwnerChara], edx

imul esi, edx, 80
add esi, dword ptr [0x00713080]
mov [ebp-0x14], esi

imul esi, ds:Game_AnimFrameCount, 24
add esi, dword ptr [0x00713074]

mov edx, offset 0x005201A0
call Malloc_Parse3DAnimations_Call

.org 0x4E0CEB
Malloc_Parse3DAnimations_Call:

#; Malloc-Parse3DCharacters
.org 0x42E053

imul eax, [0x00713060], 80
add eax, [0x00713080]
mov eax, [eax]
mov [ebp-52], eax

imul eax, [0x00713064], 24
add eax, [0x007133A0]
mov eax, [eax]
mov [ebp-36], eax

imul edi, [0x00713070], 48
add edi, [0x00713E68]
mov edi, [edi]

mov eax, [0x00713068]
shl eax, 6
add eax, [0x0072A5D8]
mov eax, [eax]
mov [ebp-32], edx

#; Malloc-Parse3DGourads
.org 0x42E85E
imul esi, 384
add esi, dword ptr [Sonic_GouradOffset]
xor edi, edi

#; Malloc-sub_4217F8
.org 0x42186E
add eax, dword ptr [CharModel_VertexStart]

.org 0x4218DA
add eax, dword ptr [CharModel_VertexStart]

.org 0x42194F
add eax, dword ptr [CharModel_VertexStart]

#; Malloc-sub_421968
.org 0x4219CA
lea edx, [eax*2 + eax]
mov eax, dword ptr [CharModel_VertexStart]
add ebx, 0x7F
inc ebx

#; Malloc-sub_4219FC
.org 0x421A5E
lea edx, [eax*2 + eax]
mov eax, dword ptr [CharModel_VertexStart]
add ebx, 0x7F
inc ebx
	
#; Malloc-sub_421A90
.org 0x421AB2
lea edx, [eax*2 + eax]
mov eax, dword ptr [CharModel_VertexStart]
add ebx, 0x7F
inc ebx

#; Malloc-sub_430638
.org 0x430651
imul edx, 80
add edx, [Sonic_ModelAttribBasePtr]

.org 0x430678
shl eax, 7
add esi, dword ptr [Sonic_GouradOffset]
imul eax, ecx, 12
mov edx, [edx+0x24]
add edx, dword ptr [CharModel_BasePtr]
add eax, esi

#; Malloc-sub_430ED4
.org 0x430F1B
imul ecx, ebx, 80
add ecx, dword ptr [Sonic_ModelAttrib_BasePtr]

.org 0x430F37
imul esi, 512
add esi, dword ptr [Sonic_GouradOffset]

.org 0x430F5F
add eax, dword ptr [CharModel_BasePtr]
cmp dword ptr ds:Game_Course, 5

#; Malloc-sub_4437FC
.org 0x4439A3
add ecx, dword ptr [Sonic_ModelAttribBasePtr]

.org 0x4439B4
imul edx, 24
add edx, dword ptr [CharModel_QuadStart]
sar edi, 8

.org 0x4439E7
imul edx, 24
add edx, dword ptr [AnimFrames_BasePtr]

.org 0x443BDD
add ecx, dword ptr [CharModel_BasePtr]

.org 0x443D5B
imul edx, [eax+8], 0x32
add edx, dword ptr [CharModel_VertexStart]

.org 0x443D94
add eax, dword ptr [CharModel_BasePtr]

.org 0x443DA6
xor ebx, ebx
imul bx, word ptr [ebx+0x22], 64
add ebx, dword ptr [CharModel_BasePtr]

.org 0x443DCC	
add ecx, dword ptr [CharModel_BasePtr]

.org 0x443DF2	
add edx, dword ptr [CharModel_BasePtr]

.org 0x4441D5
mov ebx, [edx]
add ebx, [ebp-0x1C]
shl ebx, 6
add ebx, dword ptr [CharModel_BasePtr]

.org 0x4441FF
mov esi, [edx]
add esi, [ebp-0x1C]
shl esi, 6
add esi, dword ptr [CharModel_BasePtr]

.org 0x444234
add ecx, dword ptr [CharModel_BasePtr]

.org 0x444269
add edx, dword ptr [CharModel_BasePtr]

#; Malloc-sub_4555B8
.org 0x45571A
add edx, dword ptr [Sonic_ModelAttribBasePtr]

.org 0x45572B
lea eax, [ebx*2 + ebx]
mov ebx, dword ptr [CharModel_QuadStart]

.org 0x455755
lea eax, [ebx*2 + ebx] 
mov ebx, dword ptr [AnimFrames_BasePtr]

.org 0x455A8A
add ebx, dword ptr [CharModel_VertexStart]

.org 0x455A90
movzx eax, word ptr [ebx+0x20]
mov edi, dword ptr [CharModel_BasePtr]

.org 0x455ABA
movzx eax, word ptr [ebx+0x22]
mov edi, dword ptr [CharModel_BasePtr]

.org 0x455ADE
movzx eax, word ptr [ebx+0x24]
mov edx, dword ptr [CharModel_BasePtr]

.org 0x455B18
movzx eax, word ptr [ebx+0x26]
mov edx, dword ptr [CharModel_BasePtr]

.org 0x45667B	
add esi, dword ptr [CharModel_BasePtr]

.org 0x4566A2
mov edx, [ebp-0x6C]
add edx, [eax]
shl edx, 6
add edx, dword ptr [CharModel_BasePtr]

.org 0x4566DC
mov edi, [ebp-0x6C]
add edi, [eax]
shl edi, 6
add edi, dword ptr [CharModel_BasePtr]

.org 0x456717
mov edx, [ebp-0x6C]
add edx, [eax]
shl edx, 6
add edx, dword ptr [CharModel_BasePtr]

#; Malloc-sub_469AE0
.org 0x469B01
lea eax, [edx*4 + edx]
mov edx, dword ptr [Sonic_ModelAttribBasePtr]

.org 0x46A34A
lea eax, [edx*2 + edx]
mov edx, dword ptr [CharModel_QuadStart]

.org 0x46A38B
lea eax, [edx*2 + edx]
mov edx, dword ptr [AnimFrames_BasePtr]

.org 0x46A6B8
add ebx, dword ptr [CharModel_BasePtr]

.org 0x46A910
mov edx, [esp+0xAC]
imul edx, [edx+8], 0x30
add edx, dword ptr [CharModel_VertexStart]

.org 0x46A954
movzx eax, word ptr [edx+0x20]
mov edx, [esp+0xAC]
add eax, [edx]
mov esi, dword ptr [CharModel_BasePtr]

.org 0x46A980
movzx eax, word ptr [edx+0x22]
mov edx, [esp+0xAC]
add eax, [edx]
mov ecx, dword ptr [CharModel_BasePtr]

.org 0x46A9AA
movzx eax, word ptr [edx+0x24]
mov edx, [esp+0xAC]
add eax, [edx]
mov ebx, dword ptr [CharModel_BasePtr]

.org 0x46A9E7
movzx eax, word ptr [edx+0x26]
mov edx, [esp+0xAC]
add eax, [edx]
mov edi, dword ptr [CharModel_BasePtr]

#; Malloc-sub_470460	
.org 0x470460
push ebx
push edx
push esi
mov esi, ds:Game_QuadCount
mov edx, dword ptr [CharModel_VertexStart]

.org 0x4704D5
cmp word ptr [ebx], 0 

.org 0x4704EB
pop esi
pop edx
pop ebx
ret

#; Malloc-sub_47FD04
.org 0x47FD27
add eax, dword ptr [CharModel_VertexStart]

#; Malloc-Tint3DGourads
.org 0x430cb7

add eax, 0x1000
shl edx, 5
mov [ebp-0x18], eax
mov eax, dword ptr [Sonic_GouradOffset]
cmp dword ptr ds:Game_RenderMode, 2

