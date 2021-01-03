.MODEL SMALL
 .STACK 100H

 .DATA
    PROMPT_1  DB  'Enter the first number : $ '
    PROMPT_2  DB  'Enter the second number : $'
    PROMPT_3  DB  0DH,0AH,'$'

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


                     

       MOV AL, BL
       MUL CL
       CMP AL, 15

       JG @GR 
       MOV AH, 2
       MOV DL, "0"
       INT 21H
       JMP @EXIT

     @GR:
      MOV AH, 2
      MOV DL, "1"
      INT 21H
      JMP @EXIT
                             


     @EXIT:                       

     MOV AH, 4CH                  
     INT 21H
   MAIN ENDP 
 END MAIN