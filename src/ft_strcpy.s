global _ft_strcpy

section .text

_ft_strcpy:
    mov     rax, rdi        ; ret = dst
    xor     rdx, rdx        ; i = 0
.loop:
    mov     cl, [rsi+rdx]   ; tmp = src[i]
    mov     [rax+rdx], cl   ; dst[i] = tmp
    add     rdx, 1          ; ++i
    test    cl, cl          ; if src[i] != '\0'
    jne     .loop           ; do another loop
    ret                     ; return dst
