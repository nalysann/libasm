global _ft_list_remove_if

extern _free

section .text

_ft_list_remove_if:
    mov     rax, [rdi]      ; *head
    test    rax, rax        ; if *head == NULL
    je      .return         ; empty list
    push    r13             ; save r13
    push    r12             ; save r12
    mov     r12, rsi        ; save data_ref
    push    rbp             ; save rbp
    mov     rbp, rdx        ; save cmp
    push    rbx             ; save rbx
    mov     rbx, rdi        ; save head
    jmp     .loop           ; start loop
.next:
    mov     rbx, [rbx]      ; *head
    mov     rax, [rbx+8]    ; (*head)->next
    add     rbx, 8          ; head = &((*head)->next)
    test    rax, rax        ; if *head == NULL
    je      .clean          ; exit loop
.loop:
    mov     rdi, [rax]      ; arg1 = (*head)->data
    mov     rsi, r12        ; arg2 = data_ref
    call    rbp             ; cmp(arg1, arg2)
    test    rax, rax        ; if cmp != 0
    jne     .next           ; fetch next node
    mov     r13, [rbx]      ; t_list* tmp = *head
    mov     rax, [r13+8]    ; (*head)->next
    mov     [rbx], rax      ; *head = (*head)->next
    mov     rdi, [r13]      ; tmp->data
    call    _free           ; free(tmp->data)
    mov     rdi, r13        ; tmp
    call    _free           ; free(tmp)
    mov     rax, [rbx]      ; *head
    test    rax, rax        ; if *head != NULL
    jne     .loop           ; keep going
.clean:
    pop     rbx             ; load rbx
    pop     rbp             ; load rbp
    pop     r12             ; load r12
    pop     r13             ; load r13
.return:
    ret
