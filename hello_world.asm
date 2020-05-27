bits 64

section .rodata
  hello: db "Hello world", 10
  hello_len: equ $ - hello

section .text
global main

main:

push rbp
mov rbp, rsp

mov rax, 1
mov rdi, 1
mov rsi, hello
mov rdx, hello_len
syscall

mov rsp, rbp
pop rbp

mov rax, 60
mov rdi, 0
syscall