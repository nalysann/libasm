global _ft_list_size

section .text

_ft_list_size:
    xor     rax, rax        ; size = 0
    test    rdi, rdi        ; if head == NULL
    je      .return         ; empty list
.loop:
    mov     rdi, [rdi+8]    ; head = head->next
    add     rax, 1          ; ++size
    test    rdi, rdi        ; if head != NULL
    jne     .loop           ; keep going
.return:
    ret                     ; return size
