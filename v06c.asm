                .project line-ei.rom
                .tape v06c-rom
		.org 100h

		di
; ---
start:
		xra	a
		out	10h
		lxi	sp,100h
		mvi	a,0C3h
		sta	0
		;lxi	h,Restart
		;shld	1
		mvi	a,0C9h
		sta	38h
		ei
		hlt

		
		lxi	h, colors+15
colorset:
		mvi	a, 88h
		out	0
		mvi	c, 15
colorset1:	mov	a, c
		out	2
		mov	a, m
		out	0Ch
		dcx	h
		out	0Ch
		out	0Ch
		dcr	c
		out	0Ch
		out	0Ch
		out	0Ch
		jp	colorset1
		mvi	a,255
		out	3


                mvi     a,7
		out     2
		lxi     h,80e0h
		call    print_main
		;lxi     h,80b0h
		mvi     l,0b0h
		call    print_main
		;lxi     h,8080h
		mvi     l,80h
		call    print_main
		di
		hlt
		
		
print_main:
		lxi     d,01f8h
print_star:
                push    h
                ;mvi     a,0c8h
                ;add     l
                ;mov     l,a
                ;mvi     a,5
                ;add     h
                ;mov     h,a
		mvi     m,14h
		inr     l
		mvi     m,08h
		inr     l
		mvi     m,3eh
		inr     l
		mvi     m,08h
		inr     l
		mvi     m,14h
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
                cpi     80h
                rz
                cpi     92h
                jnz     print_star
invertx:
                sub     a
                sub     d
                mov     d,a
                jmp     print_star


colors:
		.db 00000000b,00001001b,00010010b,00011011b,00100100b,00101101b,00110110b,00111111b
		.db 11111111b,00001001b,00010010b,00011011b,00100100b,00101101b,00110110b,00111111b

		.end
