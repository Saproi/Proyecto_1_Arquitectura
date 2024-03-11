section .data
	pathname DD "/home/saproi/configuracion.txt"
	tag_inicial DB "A"
section .bss
	buffer: resb 1
section .text
global _start

_start:
	MOV eax,5
	MOV ebx,pathname
	MOV ecx,0
	INT 80h

	MOV ebx,eax
	MOV eax,19
	MOV ecx,125
	MOV edx,0
	INT 80h

	MOV eax,3
	MOV ecx,buffer
	MOV edx,1
	INT 80h

	MOV ecx,[tag_inicial]
	CMP ecx,[buffer]
	JZ alfabetico
	JNE numerico

	MOV eax,1
	MOV ebx,0
	INT 80h

numerico:
	MOV eax,1
	MOV ebx,30
	INT 80h
alfabetico:
	MOV eax,1
	MOV ebx,20
	INT 80h
