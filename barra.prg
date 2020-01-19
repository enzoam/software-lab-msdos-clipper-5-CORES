CLS
SET CURSOR OFF
BAR:="/"
CONT:=0
C:=L:=10
WHILE LASTKEY()#27
   @ L,C SAY BAR
   TECLA:=INKEY(.01)
   @ L,C SAY " "
   IF TECLA=5
      SOBE()
   ELSEIF TECLA=24
      DECE()
   ELSEIF TECLA=4
      DIREITA()
   ELSEIF TECLA=19
      ESQUERDA()
   ENDIF
   CONT++
   IF CONT=1
      BAR:="-"
   ELSEIF CONT=2 
      BAR:="\"
   ELSEIF CONT=3 
      BAR:="|"
   ELSE
      BAR:="/"
   ENDIF
   IF CONT=4
      CONT:=0
   ENDIF
ENDDO
FUNCTION SOBE
   IF L=0
      L:=24
   ELSE
      L--
   ENDIF
RETURN
FUNCTION DECE
   IF L=24
      L:=0
   ELSE
      L++
   ENDIF
RETURN
FUNCTION DIREITA
   IF C=79
      C:=0
   ELSE
      C++
   ENDIF
RETURN
FUNCTION ESQUERDA
   IF C=0
      C:=79
   ELSE
      C--
   ENDIF
RETURN
