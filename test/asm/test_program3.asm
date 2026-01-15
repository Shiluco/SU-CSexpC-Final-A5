; ============================================================
; サンプルプログラム3 (0xf850〜)
; 算術演算命令(ADD, SUB)及びBRx命令のテスト
; ============================================================
        .=0xf850
        jmp label_0xfa10

        .=0xfa10
label_0xfa10:
        mov #0xffe0,r0
        mov #0x0001,r1
        mov #0xefff,r2
        add r1,r2
        mov r2,(r0)
        mov (r0),(r0)
        sub r2,r2
        mov r2,(r0)
        mov (r0),(r0)
        mov #0x0008,r5
        brn label_0xfa21
        hlt 
label_0xfa21:
        mov #0x0004,r5
        brz label_0xfa26
        hlt 
label_0xfa26:
        mov #0x0002,r5
        brv label_0xfa2b
        hlt 
label_0xfa2b:
        mov #0x0001,r5
        brc label_0xfa30
        hlt 
label_0xfa30:
        mov r1,(r0)
        hlt

