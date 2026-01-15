; ============================================================
; サンプルプログラム4 (0xf858〜)
; 分岐命令(JMP, RJP, RBx)のテスト
; ============================================================
        .=0xf858
        jmp label_0xfa40

label_0xfa40:
        mov #0xffe0,r0
        jmp label_0xfa47
        mov #0xffff,(r0)
        hlt 
label_0xfa47:
        rjp label_0xfa4b
        jmp label_0xfa66
label_0xfa4b:
        mov #0x0008,r5
        rbn label_0xfa51
        jmp label_0xfa66
label_0xfa51:
        mov #0x0004,r5
        rbz label_0xfa57
        jmp label_0xfa66
label_0xfa57:
        mov #0x0002,r5
        rbv label_0xfa5d
        jmp label_0xfa66
label_0xfa5d:
        mov #0x0001,r5
        rbc label_0xfa63
        jmp label_0xfa66
label_0xfa63:
        mov #0x0001,(r0)
        hlt 
label_0xfa66:
        mov #0xffff,(r0)
        hlt

