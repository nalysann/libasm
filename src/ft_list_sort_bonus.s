global _ft_list_sort

section .text

_ft_list_sort:
    push    r12             ; save r12
    push    rbp             ; save rbp
    push    rbx             ; save rbx
    mov     rbp, [rdi]      ; first = *head
    test    rbp, rbp        ; if first == NULL
    je      .clean          ; empty list
    mov     r12, rsi        ; save cmp
.outer:
    mov     rbx, [rbp+8]    ; second = first->next
    test    rbx, rbx        ; if second == NULL
    je      .clean          ; sorted
.inner:
    mov     rdi, [rbp]      ; arg1 = first->data
    mov     rsi, [rbx]      ; arg2 = second->data
    call    r12             ; cmp(arg1, arg2)
    test    eax, eax        ; if cmp > 0 (returns int, so test eax)
    jle     .no_swap        ; right order
    mov     rax, [rbp]      ; tmp1 = first->data
    mov     rdx, [rbx]      ; tmp2 = second->data
    mov     [rbp], rdx      ; first->data = tmp2
    mov     [rbx], rax      ; second->data = tmp1
.no_swap:
    mov     rbx, [rbx+8]    ; second = second->next
    test    rbx, rbx        ; if second != NULL
    jne     .inner          ; inner loop
    mov     rbp, [rbp+8]    ; first = first->next
    test    rbp, rbp        ; if first != NULL
    jne     .outer          ; outer loop
.clean:
    pop     rbx             ; load rbx
    pop     rbp             ; load rbp
    pop     r12             ; load r12
    ret
