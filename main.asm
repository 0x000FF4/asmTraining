

global _start
 
section .data
        ; Align to the nearest 2 byte boundary, must be a power of two
        align 2
        ; String, which is just a collection of bytes, 0xA is newline
        str:     db 'Hello, world!',0xA
        strLen:  equ $-str
 
section .bss
 	int1: resb 4
	int2: resb 4
	int3: resb 4
	resultAVG: resb 64
section .text
	%define STDIN 0
	%define STDOUT 1
	%macro avrg 3
	mov eax, 10;[%1]
	mov ebx, 10;[%2]
	mov ecx, 10;[%3]
	add eax, ebx
	
	sar eax ,1

	;add eax , ecx
	;shr eax , 1
	add eax,48	
	mov [resultAVG] , eax
	s4 STDOUT, resultAVG ,1
	%endmacro
	%macro min 3
	mov eax, [%1]
	mov ebx, [%2]
	mov ecx, [%3]
	cmp eax , ebx
	jl min1
	jmp min2
min1:
	cmp ecx , eax
	jl min3
	s4 STDOUT, %1,1
	jmp out
min2:
	cmp ecx , ebx
	jl min3
	s4 STDOUT, %2,1
	jmp out
	
min3:
	s4 STDOUT, %3,1

out:
	
	%endmacro
	%macro max 3
	mov eax, [%1]
	mov ebx, [%2]
	mov ecx, [%3]
	cmp eax , ebx
	jg max1
	jmp max2
max1:
	cmp ecx , eax
	jg max3
	s4 STDOUT, %1,1
	jmp out2
max2:
	cmp ecx , ebx
	jg max3
	s4 STDOUT, %2,1
	jmp out2
	
max3:
	s4 STDOUT, %3,1

out2:
	
	%endmacro
	%macro s1 3
	mov eax, 1
	mov ebx, %1
	mov ecx, %2
	mov edx, %3
	int 0x80
	%endmacro
	%macro s2 3
	mov eax, 2
	mov ebx, %1
	mov ecx, %2
	mov edx, %3
	int 0x80
	%endmacro
	%macro s3 3
	mov eax, 3
	mov ebx, %1
	mov ecx, %2
	mov edx, %3
	int 0x80
	%endmacro
	%macro s4 3
	mov eax, 4
	mov ebx, %1
	mov ecx, %2
	mov edx, %3
	int 0x80
	%endmacro
	%macro s5 3
	mov eax, 5
	mov ebx, %1
	mov ecx, %2
	mov edx, %3
	int 0x80
	%endmacro
	%macro s6 3
	mov eax, 6
	mov ebx, %1
	mov ecx, %2
	mov edx, %3
	int 0x80
	%endmacro
	%macro s7 3
	mov eax, 7
	mov ebx, %1
	mov ecx, %2
	mov edx, %3
	int 0x80
	%endmacro
	%macro s8 3
	mov eax, 8
	mov ebx, %1
	mov ecx, %2
	mov edx, %3
	int 0x80
	%endmacro
	%macro s9 3
	mov eax, 9
	mov ebx, %1
	mov ecx, %2
	mov edx, %3
	int 0x80
	%endmacro
	%macro s10 3
	mov eax, 10
	mov ebx, %1
	mov ecx, %2
	mov edx, %3
	int 0x80
	%endmacro
        _start:
 
        ;s3 STDIN,int1,4
	;s3 STDIN,int2,4
	;s3 STDIN,int3,4
	avrg int1,int2,int3
	s4 STDOUT,str,strLen                        ;
       
 
                                ;
                                ; Call exit(3) syscall
                                ;       void exit(int status)
                                ;
        mov     ebx, 0          ; Arg one: the status
        mov     eax, 1          ; Syscall number:
        int     0x80



