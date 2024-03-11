section .data
	pathname DD "/home/saproi/configuracion.txt"
	tag_inicial DB "A"
section .bss
	buffer: resb 1
section .text
global _start

_start:
	MOV rax,2
	MOV rdi,pathname
	MOV rsi,0
	syscall

	MOV rdi,rax
	MOV rax,8
	MOV rsi,125
	MOV rdx,0
	syscall

	MOV rax,0
	MOV rsi,buffer
	MOV rdx,1
	syscall

	MOV rsi,[tag_inicial]
	CMP rsi,[buffer]
	JZ alfabetico
	JNE numerico

	MOV rax,60
	MOV rdi,0
	syscall

numerico:
	MOV rax,60
	MOV rdi,30
	syscall
alfabetico:
	MOV rax,60
	MOV rdi,20
	syscall
