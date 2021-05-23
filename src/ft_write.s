global _ft_write

extern ___error

section .text

_ft_write:
    mov     rax, 0x2000004  ; set syscall id
    syscall                 ; call write
    jc      .error          ; handle error
    ret
.error:
    push    rbx             ; save rbx
    mov     rbx, rax        ; save error
    call    ___error        ; get errno address
    mov     [rax], rbx      ; set errno
    xor     rax, rax        ; set return value
    not     rax             ; to -1
    pop     rbx             ; load rbx
    ret
