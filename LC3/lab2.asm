
        .ORIG x3000

;基础说明以及对定义
; Matrix dimension: x30FF
; Matrix base address: x3100
; Dimension range: 2 <= i <= 8
;
; R0: Address of A[r][c]
; R1: Address of A[c][r]
; R2: Inner loop counter内部循环
; R3: Temporary value of A[r][c]用于swap
; R4: Matrix dimension i
; R5: Outer loop counter r外部循环
; R6: Current row base address
; R7: Temporary register / A[c][r] value

; Initialization 

        LD  R4, SIZE_PTR    ;R4找到地址
        LDR R4, R4, #0       ; R4 = i

        LD  R6, MATRIX_PTR   ; R6 = x3100

        AND R5, R5, #0       ; R5 = r = 0


; 外部循环

OUTER

        ; Calculate inner loop count:
        ; R2 = i - r - 1

        NOT R7, R5
        ADD R7, R7, #1       ; R7 = -r

        ADD R2, R4, R7
        ADD R2, R2, #-1      ; R2 = i-r-1

        BRnz DONE            ; 内层只剩0(已循环完毕)


        ; Initialize A[r][r+1] address:
        ; R0 = row_base + r + 1

        ADD R0, R6, R5
        ADD R0, R0, #1


        ; Initialize A[r+1][r] address:
        ; R1 = row_base + i + r

        ADD R1, R6, R4   
        ADD R1, R1, R5          

; 内部循环

INNER

        ; Read A[r][c]
        LDR R3, R0, #0

        ; Read A[c][r]
        LDR R7, R1, #0

        ; Swap
        STR R7, R0, #0
        STR R3, R1, #0


        ; 行不变，列移动一位
        ADD R0, R0, #1

        ; 列不变，到下一行
        ADD R1, R1, R4


        ; Decrease inner loop counter
        ADD R2, R2, #-1

        BRp INNER       ;正数继续循环


; 内部已循环完毕

        ; Move to next row
        ADD R6, R6, R4

        ; r = r + 1
        ADD R5, R5, #1

        BRnzp OUTER




;End 

DONE
        TRAP x25


;address

SIZE_PTR    .FILL x30FF
MATRIX_PTR  .FILL x3100

        .END
