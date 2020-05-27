bits 64
global memset:function
section .text

memset:
  push rbp
  mov rbp, rsp

  xor rcx, rcx
  cmp rdi, 0
  je .end

  .loop:
    cmp rcx, rdx
    je .end
    mov byte[rdi + rcx], sil
    inc rcx
    jmp .loop
  
  .end:
    mov rax, rdi

  mov rsp, rbp
  pop rbp

  ret