.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AL,16
    
    MOV CL,2
    SHL AL,CL
    MOV BL,AL
    MOV AH,AL
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN