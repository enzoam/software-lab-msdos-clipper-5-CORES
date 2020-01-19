PRIVATE cont:=0,BAR:="/",cor:={"N", "B", "G", "BG", "R", "RB", "GR", "W"}
CLS
SET CURSOR OFF
SETBLINK(.F.)
CORES()
L:=7
C:=55
@ 06,23 TO 15,56
@ 06,37 SAY "CORES"
DO WHILE LASTKEY()#27
   DEFINE() 
   SAVE SCREEN TO RES
   @ L,C SAY BAR
   TECLA:=INKEY(0.02)
   @ L,C SAY " "
   IF TECLA=5
      SOBE()
   ELSEIF TECLA=24
      DESCE()
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
   IF c%2=0
      IF c%4=0
         @ 17,38 SAY SETCOLOR(cor[l-6] + "/" + cor[(c/4)-5])
      ELSE
         @ 17,38 SAY SETCOLOR(cor[l-6] + "/" + cor[(c/4)-5] + "*")
      ENDIF
    ELSE
      IF ((c-1)%4)=0
         @ 17,38 SAY SETCOLOR(cor[l-6] + "+/" + cor[(c/4)-5])
      ELSE
         @ 17,38 SAY SETCOLOR(cor[l-6] + "+/" + cor[(c/4)-5] + "*")
      ENDIF
    ENDIF
   RESTORE SCREEN FROM RES
   @ 24,69 SAY TIME() COLOR "W"
ENDDO
FUNCTION SOBE
   IF L=07
      L:=14
   ELSE
      L--
   ENDIF
RETURN
FUNCTION DESCE
   IF L=14
      L:=07
   ELSE
      L++
   ENDIF
RETURN
FUNCTION DIREITA
   IF C=55
      C:=24
   ELSE
      C++
   ENDIF
RETURN
FUNCTION ESQUERDA
   IF C=24
      C:=55
   ELSE
      C--
   ENDIF
RETURN
FUNCTION CORES
   FOR c:=24 TO 55 step 4
      FOR l:=7 TO 14
          @ l,c SAY "*" COLOR cor[l-6] + "/" + cor[(c/4)-5]
          @ l,c+1 SAY "*" COLOR cor[l-6] + "+/" + cor[(c/4)-5]
          @ l,c+2 SAY "*" COLOR cor[l-6] + "/" + cor[(c/4)-5] + "*"
          @ l,c+3 SAY "*" COLOR cor[l-6] + "+/" + cor[(c/4)-5] + "*"
      NEXT l
   NEXT c
RETURN
FUNCTION DEFINE
   @ 17,24 CLEAR TO 17,55
   @ 17,31 SAY c-23
   @ 17,28 SAY l-6
   @ 17,38 SAY "/"
   @ 17,32 SAY "MAT ["
   @ 17,41 SAY "]"
   IF c%2=0
      IF c%4=0
         @ 17,44 SAY SUBSTR(SETCOLOR(cor[l-6] + "/" + cor[(c/4)-5]),1,AT(",",SETCOLOR(cor[l-6] + "/" + cor[(c/4)-5]))-1)
      ELSE
         @ 17,44 SAY SUBSTR(SETCOLOR(cor[l-6] + "/" + cor[(c/4)-5] + "*"),1,AT(",",SETCOLOR(cor[l-6] + "/" + cor[(c/4)-5] + "*"))-1)
      ENDIF
    ELSE
      IF ((c-1)%4)=0
         @ 17,44 SAY SUBSTR(SETCOLOR(cor[l-6] + "+/" + cor[(c/4)-5]),1,AT(",",SETCOLOR(cor[l-6] + "+/" + cor[(c/4)-5]))-1)
      ELSE
         @ 17,44 SAY SUBSTR(SETCOLOR(cor[l-6] + "+/" + cor[(c/4)-5] + "*"),1,AT(",",SETCOLOR(cor[l-6] + "+/" + cor[(c/4)-5] + "*"))-1)
      ENDIF
    ENDIF
RETURN
