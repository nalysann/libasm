global _ft_strdup

extern _ft_strcpy
extern _ft_strlen
extern _malloc

section .text

_ft_strdup:
    call    _ft_strlen  ; i = ft_strlen(s)
    add     rax, 1      ; ++i, count last '\0'
    push    rdi         ; save s
    mov     rdi, rax    ; prepare argument for malloc
    call    _malloc     ; allocate new string
    pop     rsi         ; src = s
    test    rax, rax    ; if malloc failed
    je      .return     ; return NULL
    mov     rdi, rax    ; dst = malloc(i)
    call    _ft_strcpy  ; ft_strcpy(dst, src)
.return:
    ret                 ; return dst or NULL
