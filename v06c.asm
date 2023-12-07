; Vector-06c entry for https://logiker.com/Vintage-Computing-Christmas-Challenge-2023
; $> pasm v06c.asm vccc2023v06c.rom && /d/8-16bit/Vector-06c/emulators/v06x-8b8-win64/v06x.exe --rom vccc2023v06c.rom
    .project vccc2023v06c.rom
    .tape vccc2023v06c

    .org 100h

        di
        lxi     sp,100h
        lxi     h,0c0e0h
        call    print_main
        mvi     l,0b0h
        call    print_main
        mvi     l,80h
        call    print_main
        hlt


print_main:
        lxi     d,01f8h
        lxi     b,0814h
print_star:
        push    h
        mov     m,c
        inr     l
        mov     m,b
        inr     l
        mvi     m,3eh
        inr     l
        mov     m,b
        inr     l
        mov     m,c
        pop     h
checky:
        mov     a,l
        add     e
        mov     l,a
        cpi     68h
        jz      inverty
        add     e
        jnz     checkx
inverty:
        sub     a
        sub     e
        mov     e,a
checkx:
        mov     a,h
        add     d
        mov     h,a
        cpi     0c0h
        rz
        cpi     0d2h
        jnz     print_star
invertx:
        sub     a
        sub     d
        mov     d,a
        jmp     print_star

        .end
