bits 64
global strlen:function
section .text

strlen:
  push rbp
  mov rbp, rsp

  xor rcx, rcx
  cmp rdi, 0
  je .end

  .loop:
    cmp byte[rdi + rcx], 0
    je .end
    inc rcx
    jmp .loop
  
  .end:
    mov rax, rcx

  mov rsp, rbp
  pop rbp

  ret