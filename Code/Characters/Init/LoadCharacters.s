	.file	"LoadCharacters.c"
	.intel_syntax noprefix
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"*"
.LC1:
	.string	"bin\\chars\\"
.LC2:
	.string	"bin\\chars\\%d\\"
.LC3:
	.string	"model.srm"
	.text
	.globl	LoadCharacters
	.type	LoadCharacters, @function
LoadCharacters:
	push	ebp
	mov	ebp, esp
	push	edi
	push	esi
	push	ebx
	xor	ebx, ebx
	sub	esp, 544
	push	OFFSET FLAT:.LC0
	push	OFFSET FLAT:.LC1
	push	1
	call	GetFileMatchCount
	mov	DWORD PTR Game_ModelCount, 0
	mov	edi, eax
	mov	DWORD PTR Game_VertexCount, 0
	imul	eax, eax, 80
	mov	DWORD PTR Game_TriCount, 0
	mov	DWORD PTR Game_QuadCount, 0
#APP
# 46 "LoadCharacters.c" 1
	call _nmalloc_
	
# 0 "" 2
#NO_APP
	mov	DWORD PTR Game_AnimFrameCount, 0
	mov	DWORD PTR Sonic_ModelAttribBasePtr, eax
	add	esp, 16
	mov	eax, 60504
#APP
# 46 "LoadCharacters.c" 1
	call _nmalloc_
	
# 0 "" 2
#NO_APP
	mov	DWORD PTR CharModel_QuadStart, eax
	mov	eax, 141176
#APP
# 46 "LoadCharacters.c" 1
	call _nmalloc_
	
# 0 "" 2
#NO_APP
	mov	DWORD PTR CharModel_VertexStart, eax
	mov	eax, 167872
#APP
# 46 "LoadCharacters.c" 1
	call _nmalloc_
	
# 0 "" 2
#NO_APP
	mov	DWORD PTR CharModel_BasePtr, eax
	mov	eax, 83936
#APP
# 46 "LoadCharacters.c" 1
	call _nmalloc_
	
# 0 "" 2
#NO_APP
	mov	DWORD PTR Sonic_GouradOffset, eax
	mov	eax, 904080
#APP
# 46 "LoadCharacters.c" 1
	call _nmalloc_
	
# 0 "" 2
#NO_APP
	mov	DWORD PTR AnimFrames_BasePtr, eax
.L2:
	cmp	ebx, edi
	jge	.L6
	lea	esi, [ebp-544]
	push	eax
	push	ebx
	push	OFFSET FLAT:.LC2
	push	esi
	call	wsprintfA
	pop	edx
	pop	ecx
	push	esi
	lea	esi, [ebp-284]
	push	esi
	call	lstrcpyA
	pop	eax
	pop	edx
	push	OFFSET FLAT:.LC3
	push	esi
	call	lstrcatA
	mov	eax, esi
#APP
# 17 "LoadCharacters.c" 1
	call Parse3DCharacter
	
# 0 "" 2
#NO_APP
	inc	ebx
	add	esp, 16
	jmp	.L2
.L6:
	lea	esp, [ebp-12]
	pop	ebx
	pop	esi
	pop	edi
	pop	ebp
	ret
	.size	LoadCharacters, .-LoadCharacters
	.globl	AnimFrameCount
	.section	.rodata
	.align 4
	.type	AnimFrameCount, @object
	.size	AnimFrameCount, 4
AnimFrameCount:
	.long	11301
	.globl	VertexCount
	.align 4
	.type	VertexCount, @object
	.size	VertexCount, 4
VertexCount:
	.long	2623
	.globl	TriCount
	.align 4
	.type	TriCount, @object
	.size	TriCount, 4
TriCount:
	.long	2521
	.globl	QuadCount
	.align 4
	.type	QuadCount, @object
	.size	QuadCount, 4
QuadCount:
	.long	2521
	.ident	"GCC: (SUSE Linux) 7.2.1 20171005 [gcc-7-branch revision 253439]"
	.section	.note.GNU-stack,"",@progbits
