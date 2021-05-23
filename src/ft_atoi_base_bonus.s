global _ft_atoi_base

section .text

check_base:
    movzx   rcx, byte [rdi]     ; base[i]
    test    cl, cl              ; if base[0] == '\0'
    je      .bad_base           ; empty base
    lea     rsi, [rdi+1]        ; &base[i + 1]
    neg     rdi                 ; -&base[0]
.is_valid:
    lea     rax, [rcx-48]       ; if '0' <= base[i]
    cmp     al, 9               ; and base[i] <= '9'
    jbe     .good_base          ; isdigit
    mov     rax, rcx            ; base[i]
    and     rax, -33            ; if isupper
    sub     rax, 65             ; or islower
    cmp     al, 25              ; then symbol is valid
    ja      .bad_base           ; else not a valid symbol
.good_base:
    movzx   r8, byte [rsi]      ; base[i + 1]
    lea     rax, [rdi+rsi]      ; j - i
    test    r8, r8              ; if base[i + 1] == '\0'
    je      .return             ; exit loop
    mov     rdx, rsi            ; &base[j]
    mov     rax, r8             ; base[j]
    jmp     .unique             ; check uniqueness
.inner:
    movzx   rax, byte [rdx+1]   ; base[j + 1]
    add     rdx, 1              ; &base[j + 1]
    test    al, al              ; if base[j + 1] == '\0'
    je      .outer              ; advance outer
.unique:
    cmp     al, cl              ; if base[i] != base[j]
    jne     .inner              ; advance inner
.bad_base:
    xor     rax, rax            ; return 0
.return:
    ret                         ; return radix
.outer:
    add     rsi, 1              ; &base[i + 1]
    mov     rcx, r8             ; base[i + 1]
    jmp     .is_valid           ; check next symbol

_ft_atoi_base:
    mov     r9, rdi             ; save str
    mov     r10, rsi            ; save base
    mov     rdi, rsi            ; arg = base
    call    check_base          ; check_base(arg)
    mov     r11, rax            ; radix = check(base)
    xor     rax, rax            ; n = 0
    cmp     r11, 1              ; if radix > 1
    jg      .process            ; process str
    jmp     .return             ; else return 0
.skip_space:
    add     r9, 1               ; ++str
.process:
    movzx   r8, byte [r9]       ; *str
    lea     rax, [r8-9]         ; if 9 <= *str
    cmp     al, 4               ; and *str <= 13
    jbe     .skip_space         ; skip
    cmp     r8, 32              ; if *str == ' '
    je      .skip_space         ; skip
    lea     rax, [r8-43]        ; if *str == '-'
    test    al, -3              ; or *srt == '+'
    je      .skip_sign          ; skip '+' or '-'
    movzx   rsi, byte [r9]      ; *str
    mov     rdi, r9             ; str
    test    rsi, rsi            ; if *str == '\0'
    je      .no_digits          ; return 0
.digits:
    movzx   r9, byte [r10]      ; *base
    xor     rax, rax            ; 0
.loop:
    test    r9, r9              ; if *base == '\0'
    je      .handle_sign        ; exit loop
    mov     rdx, r10            ; base
    mov     rcx, r9             ; *base
    jmp     .get_digit          ; get_digit
.not_found:
    movzx   rcx, byte [rdx+1]   ; *(base + 1)
    add     rdx, 1              ; ++base
    test    cl, cl              ; *base == '\0'
    je      .handle_sign        ; exit loop
.get_digit:
    cmp     sil, cl             ; if *str == *base
    jne     .not_found          ; next digit
    sub     rdx, r10            ; pos in base, i.e. digit
    add     edx, 1              ; pos + 1
    je      .handle_sign        ; exit loop
    imul    eax, r11d           ; n *= radix
    movzx   rsi, byte [rdi+1]   ; *(str + 1)
    add     rdi, 1              ; ++str
    lea     rax, [rdx-1+rax]    ; n += digit
    test    rsi, rsi            ; if *str != '\0'
    jne     .loop               ; check next symbol in str
.handle_sign:
    mov     rdx, rax            ; n
    neg     rdx                 ; -n
    cmp     r8, 45              ; if sign == '-'
    cmove   rax, rdx            ; n = -n
    ret                         ; return n
.skip_sign:
    movzx   rsi, byte [r9+1]    ; *(str + 1)
    lea     rdi, [r9+1]         ; ++str
    test    rsi, rsi            ; if *str != '\0'
    jne     .digits             ; handle digits
.no_digits:
    xor     rax, rax            ; n = 0
.return:
    ret                         ; return n
