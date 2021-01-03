.MODEL SMALL
.STACK 100H
.DATA

MSG1 DB 'ENTER A STRING: $'
MSG2 DB 0DH,0AH,'NUMBER OF VOWELS $'
S DB 50 DUP<'$'>


.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    MOV SI,OFFSET S
    
    INPUT:
    
    MOV AH,1
    INT 21H 
    CMP AL,13
    JE L1
    MOV [SI],AL
    INC SI
    JMP INPUT
    
    
    L1:
    
    XOR CL,CL
    LEA DI,S
    XOR AL,AL
    
    L2:
    
    MOV AL,[DI]
    
    CMP AL,'$'
    JZ PRINT_VOWEL_COUNTER
    
    CMP AL,'A'
    JZ VOWEL_COUNTER
    CMP AL,'E'
    JZ VOWEL_COUNTER
    CMP AL,'I'
    JZ VOWEL_COUNTER
    CMP AL,'O'
    JZ VOWEL_COUNTER
    CMP AL,'U'
    JZ VOWEL_COUNTER
    CMP AL,'a'
    JZ VOWEL_COUNTER
    CMP AL,'e'
    JZ VOWEL_COUNTER
    CMP AL,'i'
    JZ VOWEL_COUNTER
    CMP AL,'o'
    JZ VOWEL_COUNTER
    CMP AL,'u'
    JZ VOWEL_COUNTER
    
    INC DI
    JMP L2
    
    VOWEL_COUNTER:
    
    INC CL
    INC DI
    JMP L2
    
    PRINT_VOWEL_COUNTER:
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    
    MOV DL,CL
    ADD DL,30H
    MOV AH,2
    INT 21H
    
    EXIT:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN