; ZX-SPECTRUM entry for https://logiker.com/Vintage-Computing-Christmas-Challenge-2023
; $> sjasmplus.exe zx.asm && Unreal.exe zx.sna
    device ZXSPECTRUM48

    org 0x8000
start:
        ei
        ld      a,2
        call    5633
        ld      de,0x0300
        ld      bc,0x0512
        halt
loop:
        ld      a,0x10
        rst     0x10
        ld      a,r
        xor     l
        rrca
        ld      l,a
        and     0x07
        inc     a
        rst     0x10
        ld      a,0x16
        rst     0x10
        ld      a,c
        sub     d
        jr      nc,sety
        neg
sety:
        rst     0x10
        ld      a,c
        sub     e
        jr      nc,setx
        neg
setx:
        rst     0x10
        ld      a,'*'
        rst      0x10
        inc     d
        ld      a,d
        sub     c
        sub     c
        jr      nz,checkx
        ld      d,a
checkx:
        ld      a,e
        inc     e
        sub     c
        sub     c
        jr      nz,loop
        ld      e,a
        ld      a,b
        add     a,d
        ld      d,a
        cp      c
        jr      c,loop
        jp     start

    display "Length: ",/A,$-start
    savesna "zx.sna",start