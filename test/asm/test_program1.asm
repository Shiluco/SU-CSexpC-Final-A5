; ============================================================
; サンプルプログラム1 (0xf840〜)
; シフト命令(ASL, ASR, LSL, LSR, ROL, ROR)とクリア命令(CLR)のテスト
; ============================================================
        .=0xf840
        jmp label_0xf9b0

        .=0xf9b0
label_0xf9b0:
        mov #0xffe0,r0
        mov #0xffff,r1
        mov r1,(r0)
        mov (r0),r2
        clr r1
        mov r1,(r0)
        mov (r0),r2
        mov #0x7a80,r1
label_0xf9bb:
        mov r1,(r0)
        mov (r0),r2
        asl r1
        rbc label_0xf9bb
        mov #0x80a8,r1
label_0xf9c2:
        mov r1,(r0)
        mov (r0),r2
        asr r1
        rbc label_0xf9c9
        rjp label_0xf9c2
label_0xf9c9:
        mov #0xf500,r1
label_0xf9cb:
        mov r1,(r0)
        mov (r0),r2
        lsl r1
        rbc label_0xf9cb
        mov #0x0a0f,r1
label_0xf9d2:
        mov r1,(r0)
        mov (r0),r2
        lsr r1
        rbc label_0xf9d2
        mov #0xf0a0,r1
label_0xf9d9:
        mov r1,(r0)
        mov (r0),r2
        rol r1
        rbc label_0xf9d9
        mov #0x0a0f,r1
label_0xf9e0:
        mov r1,(r0)
        mov (r0),r2
        ror r1
        rbc label_0xf9e0
        hlt

