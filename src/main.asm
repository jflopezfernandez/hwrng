
                BITS 64
                GLOBAL main
                EXTERN printf

%DEFINE SYSCALL_EXIT 0x3C

                SECTION .data

fmt: db "%ld", 0x0A, 0x00

                SECTION .text

main:           PUSH RBP

.get_random_num:RDRAND RDX
                JNC .get_random_num

                LEA RDI, [rel fmt]
                MOV RSI, RDX
                MOV AL, 0x00
                CALL printf

                POP RBP
                RET
