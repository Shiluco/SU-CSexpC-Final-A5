; ============================================================
; サンプルプログラム2 (0xf848〜)
; 論理演算命令(OR, XOR, AND)のテスト
; ============================================================
        .=0xf848
        jmp label_0xf9f0

        .=0xf9f0
label_0xf9f0:
        mov #0xffe0,r0
        mov #0x000c,r1
        mov #0x000a,r2
        or r2,r1
        mov r1,(r0)
        mov (r0),(r0)
        mov #0x000c,r1
        xor r2,r1
        mov r1,(r0)
        mov (r0),(r0)
        mov #0x000c,r1
        and r2,r1
        mov r1,(r0)
        mov (r0),(r0)
        hlt

