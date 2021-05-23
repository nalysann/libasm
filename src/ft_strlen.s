global _ft_strlen

section .text

_ft_strlen:
    xor     rax, rax            ; i = 0
    cmp     byte [rdi], 0       ; if s[0] == '\0'
    je      .return             ; empty string
.loop:
    add     rax, 1              ; ++i
    cmp     byte [rdi+rax], 0   ; if s[i] != '\0'
    jne     .loop               ; do another loop
.return:
    ret                         ; return i
