/* здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
   Ё    Programa........        CORES.PRG                           Ё
   Ё    Micro...........        N╖ 19                               Ё
   Ё    Turma...........        2╖ ANO - PROC. DADOS - NOTURNO      Ё
   Ё    Alunos..........        ANSELMO MICHALSKI       N╖08        Ё
   Ё                            ANDR░ F. A. SANTOS      N╖05        Ё
   Ё    Professor.......        EDSON LECHETTA                      Ё
   Ё    Codificado......        MAR─O/1999                          Ё
   юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды   
                                                                       */
PRIVATE cont:=0,CUR:="/",cor:={"N", "B", "G", "BG", "R", "RB", "GR",  "W"};
       ;Fim:="<<-EQUIPE: ANSELMO N╖08    ANDR░ N╖05->>"
CLS
SET CURSOR OFF
SETBLINK(.F.)
CORES()
L:=7
C:=55
@ 06,23 TO 15,56
@ 06,37 SAY "CORES"
FOR i:=1 to 80
    @ 01,0 CLEAR TO 01,80
    @ 01,0 SAY PADL(FIM,80-i) COLOR [G/N]
    INKEY(.1)
NEXT i
DO WHILE LASTKEY()#27
   DEFINE() 
   SAVE SCREEN TO RES
   @ L,C SAY CUR
   TECLA:=INKEY(0.01)
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
      CUR:="-"
   ELSEIF CONT=2
      CUR:="\"
   ELSEIF CONT=3 
      CUR:="|"
   ELSE
      CUR:="/"
   ENDIF
   IF CONT=4
      CONT:=0
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
   @ 16,24 CLEAR TO 16,55
   @ 16,31 SAY c-23
   @ 16,28 SAY l-6
   @ 16,38 SAY "/"
   @ 16,32 SAY "MAT ["
   @ 16,41 SAY "]"
   @ 16,42 SAY "="
   IF c%2=0
      IF c%4=0
         @ 16,43 SAY SUBSTR(SETCOLOR(cor[l-6] + "/" + cor[(c/4)-5]);
         ,1,AT(",",SETCOLOR(cor[l-6] + "/" + cor[(c/4)-5]))-1)
      ELSE
         @ 16,43 SAY SUBSTR(SETCOLOR(cor[l-6] + "/" + cor[(c/4)-5] + "*");
         ,1,AT(",",SETCOLOR(cor[l-6] + "/" + cor[(c/4)-5] + "*"))-1)
      ENDIF
    ELSE
      IF ((c-1)%4)=0
         @ 16,43 SAY SUBSTR(SETCOLOR(cor[l-6] + "+/" + cor[(c/4)-5]),1,AT(",",SETCOLOR(cor[l-6] + "+/" + cor[(c/4)-5]))-1)
      ELSE
         @ 16,43 SAY SUBSTR(SETCOLOR(cor[l-6] + "+/" + cor[(c/4)-5] + "*"),1,AT(",",SETCOLOR(cor[l-6] + "+/" + cor[(c/4)-5] + "*"))-1)
      ENDIF
    ENDIF
RETURN
