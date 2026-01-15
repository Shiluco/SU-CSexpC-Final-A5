; ============================================================
; サンプルプログラム5 (0xf860〜)
; サブルーチンコール命令(JSR, RJS, RET)のテスト
; ============================================================
        .=0xf860
        jmp label_0xfa70

        .=0xfa70
label_0xfa70:
        mov #0xffe0,r0
        mov #0x0001,r1
        jsr label_0xfa7b
        mov (r0),r2
        add r1,r1
        rjs label_0xfa7b
        hlt 
label_0xfa7b:
        mov r1,(r0)
        ret

