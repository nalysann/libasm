global _ft_list_push_front

extern _malloc

section .text

_ft_list_push_front:
    push    rbp             ; save rbp
    mov     rbp, rsi        ; save data
    push    rbx             ; save rbx
    mov     rbx, rdi        ; save head
    mov     rdi, 16         ; prepare arg for malloc
    call    _malloc         ; node = malloc(sizeof(t_list))
    test    rax, rax        ; if malloc failed
    je      .clean          ; clean up and return
    mov     [rax], rbp      ; node->data = data
    mov     rdi, [rbx]      ; *head
    mov     [rax+8], rdi    ; node->next = *head
    mov     [rbx], rax      ; *head = node
.clean:
    pop     rbx             ; load rbx
    pop     rbp             ; load rbp
    ret                     ; return
