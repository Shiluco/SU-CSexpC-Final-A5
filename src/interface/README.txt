ここにはinterfaceの簡単な使い方をあげていく。

====================================
if_MDR.v ピン割り当て (8ビット版)
====================================

【入力】
KEY[0]    : CLK (クロック)
KEY[1]    : CLR (クリア)
KEY[2]    : MDM (MDR→M-bus)
KEY[3]    : MDA (MDR→A-bus)

SW[7:0]   : S_bus[7:0] (Sバス入力)
SW[15:8]  : M_bus[7:0] (Mバス入力)
SW[16]    : MMD (M-bus→MDR)
SW[17]    : SMD (S-bus→MDR)

【出力】
LEDR[7:0]   : MDR_to_A[7:0] (Aバス出力)
LEDR[15:8]  : MDR_to_M[7:0] (Mバス出力)

LEDG[0]  : MMD 状態表示
LEDG[1]  : SMD 状態表示
LEDG[2]  : MDM 状態表示
LEDG[3]  : MDA 状態表示

※負論理：SW=0, KEY押下=0 が論理的に1

====================================
if_GPR.v ピン割り当て (16ビット版)
====================================

【入力】
KEY[0]    : CLK (クロック)
KEY[1]    : CLR (クリア)

SW[15:0]  : S_bus[15:0] (Sバス入力)
SW[16]    : SR (ストア制御)
SW[17]    : RA (レジスタ→A-bus)

【出力】
LEDR[15:0]  : data_out[15:0] (Aバス出力)
LEDR[16]    : SR 状態表示
LEDR[17]    : RA 状態表示

※負論理：SW=0, KEY押下=0 が論理的に1

====================================
if_PSW_setreset.v ピン割り当て
====================================

【入力】
KEY[0]    : CLK (クロック)
KEY[1]    : CLR (クリア)

SW[7]     : J_N (Nフラグ J入力)
SW[6]     : K_N (Nフラグ K入力)
SW[5]     : J_Z (Zフラグ J入力)
SW[4]     : K_Z (Zフラグ K入力)
SW[3]     : J_V (Vフラグ J入力)
SW[2]     : K_V (Vフラグ K入力)
SW[1]     : J_C (Cフラグ J入力)
SW[0]     : K_C (Cフラグ K入力)

【出力】
LEDR[7:0]   : JK入力状態表示 (SW[7:0]と同じ)
LEDR[11]    : N フラグ
LEDR[10]    : Z フラグ
LEDR[9]     : V フラグ
LEDR[8]     : C フラグ

※負論理：SW=0, KEY押下=0 が論理的に1

====================================
if_shifter.v ピン割り当て (16ビット版)
====================================

【入力】
KEY[3:1]  : 制御モード選択 (3ビット = 8パターン)
KEY[0]    : 未使用

SW[15:0]  : A_bus[15:0] (入力データ)
SW[16]    : Cf_in (キャリー入力)
SW[17]    : SHS (Shifter→S-bus)

【制御モードパターン (Q2 Q1 Q0)】
000: ROL (Rotate Left)
001: ROR (Rotate Right)
010: ASL (Arithmetic Shift Left)
011: ASR (Arithmetic Shift Right)
100: LSL (Logical Shift Left)
101: LSR (Logical Shift Right)
110: RLC (Rotate Left through Carry)
111: RRC (Rotate Right through Carry)

【出力】
LEDR[15:0]  : shifter_out[15:0] (シフト結果)
LEDG[0]     : Cf (キャリーフラグ)
LEDG[3:1]   : 選択モード表示

※負論理：SW=0, KEY押下=0 が論理的に1
※KEY[3:1]は押下状態の組み合わせでモード選択

====================================
if_H4.v ピン割り当て (下位8ビット版)
====================================

【入力】
KEY[3:1]  : ALU操作選択 (3ビット = 8パターン)
KEY[0]    : 未使用

SW[7:0]   : A_bus[7:0] (Aバス下位8ビット)
SW[15:8]  : B_bus[7:0] (Bバス下位8ビット)
SW[17]    : ALS_H4 (H4→S-bus)

【制御モードパターン (Q2 Q1 Q0)】
000: ADD (a + b)
001: INC (a + b + 1)
010: SUB (a - b)
011: DEC (a - b - 1)
100: AND (a ∧ b)
101: OR  (a ∨ b)
110: XOR (a ⊕ b)
111: NOT (NOT b, a=0で入力)

【出力】
LEDR[7:0]   : H4_out[7:0] (ゲート済み出力)
LEDR[15:8]  : ALU_result_bus[7:0] (生の出力)
LEDG[0]     : carry (キャリーフラグ)
LEDG[1]     : overflow (オーバーフローフラグ)
LEDG[4:2]   : 選択モード表示

※負論理：SW=0, KEY押下=0 が論理的に1
※KEY[3:1]は押下状態の組み合わせでモード選択
※下位8ビット実装（上位8ビット=0）