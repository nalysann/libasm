global _ft_strcmp

section .text

_ft_strcmp:
    jmp     .loop               ; start loop
.cmp:
    cmp     [rsi], al           ; if *tmp != *s2
    jne     .return             ; mismatch
    add     rdi, 1              ; advance s1
    add     rsi, 1              ; advance s2
.loop:
    movzx   rax, byte [rdi]     ; tmp = *s1
    test    al, al              ; if *tmp != '\0'
    jne     .cmp                ; compare current chars
.return:
    movzx   rdx, byte [rsi]     ; tmp = *s2
    sub     rax, rdx            ; ret = ret - tmp
    ret                         ; return *s1 - *s2
