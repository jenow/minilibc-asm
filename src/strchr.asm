bits 64
global strchr:function
section .text

strchr:

  push rbp
  mov rbp, rsp

  xor rax, rax

  cmp rdi, 0
  je .null

  xor rcx, rcx

  .loop:
    cmp byte[rdi + rcx], 0
    je .null
    cmp byte[rdi + rcx], sil
    je .found
    inc rcx
    jmp .loop
    jmp .end

  .null:
    xor rax, rax
    jmp .end

  .found:
    mov rax, rdi
    add rax, rcx
    jmp .end

  .end:

  mov rsp, rbp
  pop rbp

  ret