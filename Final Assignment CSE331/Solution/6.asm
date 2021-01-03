.MODEL SMALL
 .STACK 100H

 .DATA
    PROMPT_1  DB  'Enter the first number : $ '
    PROMPT_2  DB  'Enter the second number : $'
    PROMPT_3  DB  0DH,0AH,'The number is : $'

 .CODE
   MAIN PROC
     MOV AX, @DATA                
     MOV DS, AX

     LEA DX, PROMPT_1             
     MOV AH, 9
     INT 21H

     MOV AH, 1                    
     INT 21H

     MOV BL, AL                   

     LEA DX, PROMPT_2             
     MOV AH, 9
     INT 21H

     MOV AH, 1                    
     INT 21H 

     MOV CL, AL

     LEA DX, PROMPT_3             
     MOV AH, 9
     INT 21H

     CMP BL, CL
     JG @CALC;

     @CALC: 
     MOV AH, 0
     MOV AL,BL
     DIV CL
     CMP AH,0
                      

     JG @DN                    

       MOV AL, BL
       MUL CL
       MOV AH, 2                  
       MOV DL, AL
       INT 21H

     JMP @EXIT                    

     @DN:
      MOV AH, 2                  
      MOV DL, BL
      INT 21H
                             


     @EXIT:                       

     MOV AH, 4CH                  
     INT 21H
   MAIN ENDP 
 END MAIN