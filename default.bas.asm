 processor 6502
 include "vcs.h"
 include "macro.h"
 include "multisprite.h"
 include "superchip.h"
 include "2600basic_variable_redefs.h"
 ifconst bankswitch
  if bankswitch == 8
     ORG $1000
     RORG $D000
  endif
  if bankswitch == 16
     ORG $1000
     RORG $9000
  endif
  if bankswitch == 32
     ORG $1000
     RORG $1000
  endif
  if bankswitch == 64
     ORG $1000
     RORG $1000
  endif
 else
   ORG $F000
 endif
 repeat 256
 .byte $ff
 repend
game
.
 ; 

.L00 ;  rem Generated 22/10/2018 21:47:13 by Visual bB Version 1.0.0.568

.L01 ;  rem **********************************

.L02 ;  rem *Horizon Shift                   *

.L03 ;  rem *<description>                   *

.L04 ;  rem *<author>                        *

.L05 ;  rem *<contact info>                  *

.L06 ;  rem *<license>                       *

.L07 ;  rem ********************************** 

.L08 ;  includesfile multisprite_superchip.inc

.L09 ;  set kernel multisprite

.L010 ;  set romsize 8k

.
 ; 

.L011 ;  pfheight = 7

	LDA #7
	STA pfheight
.
 ; 

.L012 ;  playfield:

	LDA #<PF1_data0
	STA PF1pointer
	LDA #>PF1_data0
	STA PF1pointer+1
	LDA #<PF2_data0
	STA PF2pointer
	LDA #>PF2_data0
	STA PF2pointer+1
.
 ; 

.
 ; 

.L013 ;  COLUBK  =  $0

	LDA #$0
	STA COLUBK
.
 ; 

.L014 ;  _COLUP1  =  $3A

	LDA #$3A
	STA _COLUP1
.L015 ;  COLUP2  =  $A4

	LDA #$A4
	STA COLUP2
.L016 ;  COLUP3  =  $A4

	LDA #$A4
	STA COLUP3
.L017 ;  COLUP4  =  $76

	LDA #$76
	STA COLUP4
.L018 ;  COLUP5  =  $2E

	LDA #$2E
	STA COLUP5
.
 ; 

.
 ; 

.L019 ;  lifecolor  =  $aa

	LDA #$aa
	STA lifecolor
.
 ; 

.
 ; 

.
 ; 

.L020 ;  player0x = 66

	LDA #66
	STA player0x
.L021 ;  player0y = 57

	LDA #57
	STA player0y
.
 ; 

.L022 ;  player1x = 76

	LDA #76
	STA player1x
.L023 ;  player1y = 99

	LDA #99
	STA player1y
.
 ; 

.L024 ;  player2x = 86

	LDA #86
	STA player2x
.L025 ;  player2y = 100

	LDA #100
	STA player2y
.
 ; 

.L026 ;  player3x = 96

	LDA #96
	STA player3x
.L027 ;  player3y = 100

	LDA #100
	STA player3y
.
 ; 

.L028 ;  player4x = 106

	LDA #106
	STA player4x
.L029 ;  player4y = 100

	LDA #100
	STA player4y
.
 ; 

.L030 ;  player5x = 100

	LDA #100
	STA player5x
.L031 ;  player5y =  200

	LDA #200
	STA player5y
.L032 ;  missile0y = 255

	LDA #255
	STA missile0y
.
 ; 

.
 ; 

.L033 ;  missile1y = 200

	LDA #200
	STA missile1y
.L034 ;  missile1x = 50

	LDA #50
	STA missile1x
.
 ; 

.
 ; 

.
 ; 

.
 ; 

.
 ; 

.
 ; 

.
 ; 

.
 ; 

.L035 ;  dim asteroidY  =  player1y.b

.L036 ;  dim asteroid2Y  =  player2y.c

.L037 ;  dim asteroid3Y  =  player3y.d

.L038 ;  dim asteroid4Y  =  player4y.e

.
 ; 

.L039 ;  dim misx  =  missile1x.h

.L040 ;  dim misy  =  missile1y.i

.
 ; 

.L041 ;  dim _P0_Luminosity  =  a.b

.
 ; 

.L042 ;  dim _sc1  =  score

.L043 ;  dim _sc2  =  score + 1

.L044 ;  dim _sc3  =  score + 2

.
 ; 

.L045 ;  dim _Bit0_Reset_Restrainer  =  y

.L046 ;  dim _Bit6_Sequence_Switch  =  y

.
 ; 

.L047 ;  dim explosionTicker  =  f

.L048 ;  dim _resetTicker  =  x

.L049 ;  dim gameReady  =  z

.L050 ;  dim _High_Score1  =  t

.L051 ;  dim _High_Score2  =  u

.L052 ;  dim _High_Score3  =  s

.L053 ;  dim firstFrame  =  r

.L054 ;  dim switchSprite  =  p

.
 ; 

.L055 ;  dim ticker  =  l

.L056 ;  dim titlescreencolor  =  $F0

.
 ; 

.
 ; 

.
 ; 

.
 ; 

.
 ; 

.
 ; 

.L057 ;  _High_Score1  =  _sc1

	LDA _sc1
	STA _High_Score1
.L058 ;  _High_Score2  =  _sc2

	LDA _sc2
	STA _High_Score2
.L059 ;  _High_Score3  =  _sc3

	LDA _sc3
	STA _High_Score3
.L060 ;  lives  =  96

	LDA #96
	STA lives
.L061 ;  ticker  =  0

	LDA #0
	STA ticker
.L062 ;  _resetTicker  =  0

	LDA #0
	STA _resetTicker
.L063 ;  switchSprite  =  0

	LDA #0
	STA switchSprite
.L064 ;  explosionTicker  =  0

	LDA #0
	STA explosionTicker
.L065 ;  scorecolor = $1a

	LDA #$1a
	STA scorecolor
.L066 ;  firstFrame  =  0

	LDA #0
	STA firstFrame
.
 ; 

.L067 ;  NUSIZ0  =  16

	LDA #16
	STA NUSIZ0
.
 ; 

.L068 ;  lives:

	LDA #<lives__L068
	STA lifepointer
	LDA lifepointer+1
	AND #$E0
	ORA #(>lives__L068)&($1F)
	STA lifepointer+1
.
 ; 

.L069 ;  player1:

	LDX #<playerL069_1
	STX player1pointerlo
	LDA #>playerL069_1
	STA player1pointerhi
	LDA #9
	STA player1height
.
 ; 

.L070 ;  player3:

	LDX #<playerL070_3
	STX player3pointerlo
	LDA #>playerL070_3
	STA player3pointerhi
	LDA #9
	STA player3height
.
 ; 

.sprites
 ; sprites

.L071 ;  ticker  =  ticker  +  1

	INC ticker
.L072 ;  if ticker  >  10 then ticker  =  0

	LDA #10
	CMP ticker
     BCS .skipL072
.condpart0
	LDA #0
	STA ticker
.skipL072
.
 ; 

.
 ; 

.
 ; 

.
 ; 

.
 ; 

.L073 ;  if player1y  =  100  ||  player1y  =  0 then goto setPlayer1Color

	LDA player1y
	CMP #100
     BNE .skipL073
.condpart1
 jmp .condpart2
.skipL073
	LDA player1y
	CMP #0
     BNE .skip0OR
.condpart2
 jmp .setPlayer1Color

.skip0OR
.L074 ;  if player2y  =  100  ||  player2y  =  0 then goto setPlayer2Color

	LDA player2y
	CMP #100
     BNE .skipL074
.condpart3
 jmp .condpart4
.skipL074
	LDA player2y
	CMP #0
     BNE .skip1OR
.condpart4
 jmp .setPlayer2Color

.skip1OR
.L075 ;  if player3y  =  100  ||  player4y  =  0 then goto setPlayer3Color

	LDA player3y
	CMP #100
     BNE .skipL075
.condpart5
 jmp .condpart6
.skipL075
	LDA player4y
	CMP #0
     BNE .skip2OR
.condpart6
 jmp .setPlayer3Color

.skip2OR
.L076 ;  if player4y  =  100  ||  player5y  =  0 then goto setPlayer4Color

	LDA player4y
	CMP #100
     BNE .skipL076
.condpart7
 jmp .condpart8
.skipL076
	LDA player5y
	CMP #0
     BNE .skip3OR
.condpart8
 jmp .setPlayer4Color

.skip3OR
.
 ; 

.colorSetComplete
 ; colorSetComplete

.
 ; 

.L077 ;  if player5y  <  200 then explosionTicker  =  explosionTicker  +  1

	LDA player5y
	CMP #200
     BCS .skipL077
.condpart9
	INC explosionTicker
.skipL077
.L078 ;  if explosionTicker  >  1 then player5y  =  200 : explosionTicker  =  0 :  AUDV0  =  0  :  AUDC0  =  0  :  AUDF0  =  0

	LDA #1
	CMP explosionTicker
     BCS .skipL078
.condpart10
	LDA #200
	STA player5y
	LDA #0
	STA explosionTicker
	STA AUDV0
	STA AUDC0
	STA AUDF0
.skipL078
.
 ; 

.L079 ;  if player4y  =  80  &&  missile1y  >  150 then missile1y  =  player4y :  missile1x  =  player4x  -  3

	LDA player4y
	CMP #80
     BNE .skipL079
.condpart11
	LDA #150
	CMP missile1y
     BCS .skip11then
.condpart12
	LDA player4y
	STA missile1y
	LDA player4x
	SEC
	SBC #3
	STA missile1x
.skip11then
.skipL079
.L080 ;  if player4y  =  10  &&  missile1y  >  150 then missile1y  =  player4y :  missile1x  =  player4x  -  3

	LDA player4y
	CMP #10
     BNE .skipL080
.condpart13
	LDA #150
	CMP missile1y
     BCS .skip13then
.condpart14
	LDA player4y
	STA missile1y
	LDA player4x
	SEC
	SBC #3
	STA missile1x
.skip13then
.skipL080
.
 ; 

.L081 ;  if player4y  =  70  &&  missile1y  >  150 then missile1y  =  player4y :  missile1x  =  player4x  -  3

	LDA player4y
	CMP #70
     BNE .skipL081
.condpart15
	LDA #150
	CMP missile1y
     BCS .skip15then
.condpart16
	LDA player4y
	STA missile1y
	LDA player4x
	SEC
	SBC #3
	STA missile1x
.skip15then
.skipL081
.L082 ;  if player4y  =  20  &&  missile1y  >  150 then missile1y  =  player4y :  missile1x  =  player4x  -  3

	LDA player4y
	CMP #20
     BNE .skipL082
.condpart17
	LDA #150
	CMP missile1y
     BCS .skip17then
.condpart18
	LDA player4y
	STA missile1y
	LDA player4x
	SEC
	SBC #3
	STA missile1x
.skip17then
.skipL082
.
 ; 

.L083 ;  if missile0y  >  30  &&  missile0y  <  60 then AUDV1  =  2  :  AUDC1  =  12  :  AUDF1  =  7 else AUDV1  =  0  :  AUDC1  =  0 :  AUDF0  =  0

	LDA #30
	CMP missile0y
     BCS .skipL083
.condpart19
	LDA missile0y
	CMP #60
     BCS .skip19then
.condpart20
	LDA #2
	STA AUDV1
	LDA #12
	STA AUDC1
	LDA #7
	STA AUDF1
 jmp .skipelse0
.skip19then
.skipL083
	LDA #0
	STA AUDV1
	STA AUDC1
	STA AUDF0
.skipelse0
.
 ; 

.L084 ;  if collision(missile1,player0) then goto gameOver

	bit 	CXM1P
	BPL .skipL084
.condpart21
 jmp .gameOver

.skipL084
.
 ; 

.L085 ;  if missile1y  <  45 then misy  =  misy  +  0.4

	LDA missile1y
	CMP #45
     BCS .skipL085
.condpart22
	LDA i
	CLC 
	ADC #102
	STA i
	LDA misy
	ADC #0
	STA misy
.skipL085
.L086 ;  if missile1y  >  45  &&  misy  <  150  &&  _resetTicker  =  0 then misy  =  misy  - 0.4

	LDA #45
	CMP missile1y
     BCS .skipL086
.condpart23
	LDA misy
	CMP #150
     BCS .skip23then
.condpart24
	LDA _resetTicker
	CMP #0
     BNE .skip24then
.condpart25
	LDA i
	SEC 
	SBC #102
	STA i
	LDA misy
	SBC #0
	STA misy
.skip24then
.skip23then
.skipL086
.
 ; 

.
 ; 

.
 ; 

.titlepage
 ; titlepage

.L087 ;  if joy0fire  ||  switchreset then gameReady  =  1

 bit INPT4
	BMI .skipL087
.condpart26
 jmp .condpart27
.skipL087
 lda #1
 bit SWCHB
	BNE .skip11OR
.condpart27
	LDA #1
	STA gameReady
.skip11OR
.L088 ;  if gameReady  =  1 then COLUBK  =  $0  :  goto gamestart

	LDA gameReady
	CMP #1
     BNE .skipL088
.condpart28
	LDA #$0
	STA COLUBK
 jmp .gamestart

.skipL088
.L089 ;  gosub titledrawscreen bank2

 sta temp7
 lda #>(ret_point1-1)
 pha
 lda #<(ret_point1-1)
 pha
 lda #>(.titledrawscreen-1)
 pha
 lda #<(.titledrawscreen-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #2
 jmp BS_jsr
ret_point1
.L090 ;  _sc1  =  0

	LDA #0
	STA _sc1
.L091 ;  _sc2  =  0

	LDA #0
	STA _sc2
.L092 ;  _sc3  =  0

	LDA #0
	STA _sc3
.L093 ;  _sc1  =  _High_Score1

	LDA _High_Score1
	STA _sc1
.L094 ;  _sc2  =  _High_Score2

	LDA _High_Score2
	STA _sc2
.L095 ;  _sc3  =  _High_Score3

	LDA _High_Score3
	STA _sc3
.
 ; 

.L096 ;  goto titlepage

 jmp .titlepage

.
 ; 

.gamestart
 ; gamestart

.L097 ;  if firstFrame  =  0 then _sc1  =  0 :  _sc2  =  0 :  _sc3  =  0 :  firstFrame  =  1

	LDA firstFrame
	CMP #0
     BNE .skipL097
.condpart29
	LDA #0
	STA _sc1
	STA _sc2
	STA _sc3
	LDA #1
	STA firstFrame
.skipL097
.
 ; 

.
 ; 

.L098 ;  if _sc1  >  _High_Score1 then goto __New_High_Score

	LDA _High_Score1
	CMP _sc1
     BCS .skipL098
.condpart30
 jmp .__New_High_Score

.skipL098
.L099 ;  if _sc1  <  _High_Score1 then goto __Skip_High_Score

	LDA _sc1
	CMP _High_Score1
     BCS .skipL099
.condpart31
 jmp .__Skip_High_Score

.skipL099
.L0100 ;  if _sc2  >  _High_Score2 then goto __New_High_Score

	LDA _High_Score2
	CMP _sc2
     BCS .skipL0100
.condpart32
 jmp .__New_High_Score

.skipL0100
.L0101 ;  if _sc2  <  _High_Score2 then goto __Skip_High_Score

	LDA _sc2
	CMP _High_Score2
     BCS .skipL0101
.condpart33
 jmp .__Skip_High_Score

.skipL0101
.
 ; 

.L0102 ;  if _sc3  >  _High_Score3 then goto __New_High_Score

	LDA _High_Score3
	CMP _sc3
     BCS .skipL0102
.condpart34
 jmp .__New_High_Score

.skipL0102
.L0103 ;  if _sc3  <  _High_Score3 then goto __Skip_High_Score

	LDA _sc3
	CMP _High_Score3
     BCS .skipL0103
.condpart35
 jmp .__Skip_High_Score

.skipL0103
.
 ; 

.L0104 ;  goto __Skip_High_Score

 jmp .__Skip_High_Score

.
 ; 

.
 ; 

.__New_High_Score
 ; __New_High_Score

.
 ; 

.L0105 ;  _High_Score1  =  _sc1  :  _High_Score2  =  _sc2  :  _High_Score3  =  _sc3

	LDA _sc1
	STA _High_Score1
	LDA _sc2
	STA _High_Score2
	LDA _sc3
	STA _High_Score3
.__Skip_High_Score
 ; __Skip_High_Score

.
 ; 

.
 ; 

.
 ; 

.L0106 ;  if player0y  >  50 then player0:

	LDA #50
	CMP player0y
     BCS .skipL0106
.condpart36
	LDX #<player36then_0
	STX player0pointerlo
	LDA #>player36then_0
	STA player0pointerhi
	LDA #9
	STA player0height
.skipL0106
.
 ; 

.L0107 ;  if player0y  <  50 then player0:

	LDA player0y
	CMP #50
     BCS .skipL0107
.condpart37
	LDX #<player37then_0
	STX player0pointerlo
	LDA #>player37then_0
	STA player0pointerhi
	LDA #9
	STA player0height
.skipL0107
.
 ; 

.
 ; 

.L0108 ;  if ticker  <  5 then player2:

	LDA ticker
	CMP #5
     BCS .skipL0108
.condpart38
	LDX #<player38then_2
	STX player2pointerlo
	LDA #>player38then_2
	STA player2pointerhi
	LDA #9
	STA player2height
.skipL0108
.
 ; 

.L0109 ;  if ticker  >=  5 then player2:

	LDA ticker
	CMP #5
     BCC .skipL0109
.condpart39
	LDX #<player39then_2
	STX player2pointerlo
	LDA #>player39then_2
	STA player2pointerhi
	LDA #9
	STA player2height
.skipL0109
.
 ; 

.
 ; 

.L0110 ;  if switchSprite  >  0 then player2:

	LDA #0
	CMP switchSprite
     BCS .skipL0110
.condpart40
	LDX #<player40then_2
	STX player2pointerlo
	LDA #>player40then_2
	STA player2pointerhi
	LDA #9
	STA player2height
.skipL0110
.
 ; 

.
 ; 

.L0111 ;  if ticker  <  5 then player4:

	LDA ticker
	CMP #5
     BCS .skipL0111
.condpart41
	LDX #<player41then_4
	STX player4pointerlo
	LDA #>player41then_4
	STA player4pointerhi
	LDA #9
	STA player4height
.skipL0111
.
 ; 

.L0112 ;  if ticker  >=  5 then player4:

	LDA ticker
	CMP #5
     BCC .skipL0112
.condpart42
	LDX #<player42then_4
	STX player4pointerlo
	LDA #>player42then_4
	STA player4pointerhi
	LDA #9
	STA player4height
.skipL0112
.
 ; 

.L0113 ;  if explosionTicker  =  1 then player5:

	LDA explosionTicker
	CMP #1
     BNE .skipL0113
.condpart43
	LDX #<player43then_5
	STX player5pointerlo
	LDA #>player43then_5
	STA player5pointerhi
	LDA #9
	STA player5height
.skipL0113
.
 ; 

.L0114 ;  if explosionTicker  =  2 then player5:

	LDA explosionTicker
	CMP #2
     BNE .skipL0114
.condpart44
	LDX #<player44then_5
	STX player5pointerlo
	LDA #>player44then_5
	STA player5pointerhi
	LDA #9
	STA player5height
.skipL0114
.
 ; 

.L0115 ;  if explosionTicker  =  3 then player5:

	LDA explosionTicker
	CMP #3
     BNE .skipL0115
.condpart45
	LDX #<player45then_5
	STX player5pointerlo
	LDA #>player45then_5
	STA player5pointerhi
	LDA #9
	STA player5height
.skipL0115
.
 ; 

.
 ; 

.
 ; 

.
 ; 

.
 ; 

.
 ; 

.
 ; 

.L0116 ;  if player1y  >  40  &&  player1y  <  56 then goto gameOver

	LDA #40
	CMP player1y
     BCS .skipL0116
.condpart46
	LDA player1y
	CMP #56
     BCS .skip46then
.condpart47
 jmp .gameOver

.skip46then
.skipL0116
.L0117 ;  if player2y  >  40  &&  player2y  <  56 then goto gameOver

	LDA #40
	CMP player2y
     BCS .skipL0117
.condpart48
	LDA player2y
	CMP #56
     BCS .skip48then
.condpart49
 jmp .gameOver

.skip48then
.skipL0117
.L0118 ;  if player3y  >  40  &&  player3y  <  56 then goto gameOver

	LDA #40
	CMP player3y
     BCS .skipL0118
.condpart50
	LDA player3y
	CMP #56
     BCS .skip50then
.condpart51
 jmp .gameOver

.skip50then
.skipL0118
.L0119 ;  if player4y  >  40  &&  player4y  <  56 then goto gameOver

	LDA #40
	CMP player4y
     BCS .skipL0119
.condpart52
	LDA player4y
	CMP #56
     BCS .skip52then
.condpart53
 jmp .gameOver

.skip52then
.skipL0119
.
 ; 

.L0120 ;  if missile1y  >  40  &&  missile1y  <  48 then missile1y  =  200

	LDA #40
	CMP missile1y
     BCS .skipL0120
.condpart54
	LDA missile1y
	CMP #48
     BCS .skip54then
.condpart55
	LDA #200
	STA missile1y
.skip54then
.skipL0120
.
 ; 

.
 ; 

.
 ; 

.L0121 ;  if missile0y  >  100 then goto skip

	LDA #100
	CMP missile0y
     BCS .skipL0121
.condpart56
 jmp .skip

.skipL0121
.L0122 ;  if missile0y  <  0 then goto skip

	LDA missile0y
	CMP #0
     BCS .skipL0122
.condpart57
 jmp .skip

.skipL0122
.
 ; 

.
 ; 

.
 ; 

.
 ; 

.
 ; 

.L0123 ;  if missile0y  <  50 then missile0y  =  missile0y - 2 : goto draw_loop

	LDA missile0y
	CMP #50
     BCS .skipL0123
.condpart58
	LDA missile0y
	SEC
	SBC #2
	STA missile0y
 jmp .draw_loop

.skipL0123
.L0124 ;  if missile0y  >  50 then missile0y  =  missile0y + 2 : goto draw_loop

	LDA #50
	CMP missile0y
     BCS .skipL0124
.condpart59
	LDA missile0y
	CLC
	ADC #2
	STA missile0y
 jmp .draw_loop

.skipL0124
.
 ; 

.
 ; 

.skip
 ; skip

.L0125 ;  if joy0fire  &&  player5y  >  150 then missile0y  =  player0y  -  4 : missile0x  =  player0x  +  5

 bit INPT4
	BMI .skipL0125
.condpart60
	LDA #150
	CMP player5y
     BCS .skip60then
.condpart61
	LDA player0y
	SEC
	SBC #4
	STA missile0y
	LDA player0x
	CLC
	ADC #5
	STA missile0x
.skip60then
.skipL0125
.draw_loop
 ; draw_loop

.L0126 ;  if joy0right  &&  player0x  <  134 then player0x  =  player0x + 1

 bit SWCHA
	BMI .skipL0126
.condpart62
	LDA player0x
	CMP #134
     BCS .skip62then
.condpart63
	INC player0x
.skip62then
.skipL0126
.L0127 ;  if joy0left  &&  player0x  >  19 then player0x  =  player0x - 1

 bit SWCHA
	BVS .skipL0127
.condpart64
	LDA #19
	CMP player0x
     BCS .skip64then
.condpart65
	DEC player0x
.skip64then
.skipL0127
.L0128 ;  if joy0down then player0y  =  44

 lda #$20
 bit SWCHA
	BNE .skipL0128
.condpart66
	LDA #44
	STA player0y
.skipL0128
.L0129 ;  if joy0up then player0y  =  57

 lda #$10
 bit SWCHA
	BNE .skipL0129
.condpart67
	LDA #57
	STA player0y
.skipL0129
.
 ; 

.
 ; 

.L0130 ;  if collision(missile0,player1) then goto collisions

	bit 	CXM0P
	BPL .skipL0130
.condpart68
 jmp .collisions

.skipL0130
.
 ; 

.L0131 ;  if player1x  <  28  ||  player1x  >  141 then player1x  =  60

	LDA player1x
	CMP #28
     BCS .skipL0131
.condpart69
 jmp .condpart70
.skipL0131
	LDA #141
	CMP player1x
     BCS .skip20OR
.condpart70
	LDA #60
	STA player1x
.skip20OR
.L0132 ;  if player2x  <  28  ||  player2x  >  141 then player2x  =  60

	LDA player2x
	CMP #28
     BCS .skipL0132
.condpart71
 jmp .condpart72
.skipL0132
	LDA #141
	CMP player2x
     BCS .skip21OR
.condpart72
	LDA #60
	STA player2x
.skip21OR
.L0133 ;  if player3x  <  28  ||  player3x  >  141 then player3x  =  60

	LDA player3x
	CMP #28
     BCS .skipL0133
.condpart73
 jmp .condpart74
.skipL0133
	LDA #141
	CMP player3x
     BCS .skip22OR
.condpart74
	LDA #60
	STA player3x
.skip22OR
.L0134 ;  if player4x  <  28  ||  player2x  >  141 then player4x  =  60

	LDA player4x
	CMP #28
     BCS .skipL0134
.condpart75
 jmp .condpart76
.skipL0134
	LDA #141
	CMP player2x
     BCS .skip23OR
.condpart76
	LDA #60
	STA player4x
.skip23OR
.
 ; 

.
 ; 

.frameReset
 ; frameReset

.
 ; 

.
 ; 

.
 ; 

.
 ; 

.
 ; 

.
 ; 

.L0135 ;  if _sc3  <  60  &&  _sc2  <  1 then goto slow

	LDA _sc3
	CMP #60
     BCS .skipL0135
.condpart77
	LDA _sc2
	CMP #1
     BCS .skip77then
.condpart78
 jmp .slow

.skip77then
.skipL0135
.
 ; 

.L0136 ;  if _sc2  <  1 then goto fast

	LDA _sc2
	CMP #1
     BCS .skipL0136
.condpart79
 jmp .fast

.skipL0136
.
 ; 

.
 ; 

.L0137 ;  if asteroidY  <  50 then asteroidY  =  asteroidY  +  0.19

	LDA asteroidY
	CMP #50
     BCS .skipL0137
.condpart80
	LDA b
	CLC 
	ADC #48
	STA b
	LDA asteroidY
	ADC #0
	STA asteroidY
.skipL0137
.L0138 ;  if asteroidY  >  50 then asteroidY  =  asteroidY  -  0.19

	LDA #50
	CMP asteroidY
     BCS .skipL0138
.condpart81
	LDA b
	SEC 
	SBC #48
	STA b
	LDA asteroidY
	SBC #0
	STA asteroidY
.skipL0138
.
 ; 

.L0139 ;  if asteroid2Y  <  50 then asteroid2Y  =  asteroid2Y  +  0.21

	LDA asteroid2Y
	CMP #50
     BCS .skipL0139
.condpart82
	LDA c
	CLC 
	ADC #53
	STA c
	LDA asteroid2Y
	ADC #0
	STA asteroid2Y
.skipL0139
.L0140 ;  if asteroid2Y  >  50 then asteroid2Y  =  asteroid2Y  -  0.21

	LDA #50
	CMP asteroid2Y
     BCS .skipL0140
.condpart83
	LDA c
	SEC 
	SBC #53
	STA c
	LDA asteroid2Y
	SBC #0
	STA asteroid2Y
.skipL0140
.
 ; 

.L0141 ;  if asteroid3Y  <  50 then asteroid3Y  =  asteroid3Y  +  0.22

	LDA asteroid3Y
	CMP #50
     BCS .skipL0141
.condpart84
	LDA d
	CLC 
	ADC #56
	STA d
	LDA asteroid3Y
	ADC #0
	STA asteroid3Y
.skipL0141
.L0142 ;  if asteroid3Y  >  50 then asteroid3Y  =  asteroid3Y  -  0.22

	LDA #50
	CMP asteroid3Y
     BCS .skipL0142
.condpart85
	LDA d
	SEC 
	SBC #56
	STA d
	LDA asteroid3Y
	SBC #0
	STA asteroid3Y
.skipL0142
.
 ; 

.L0143 ;  if asteroid4Y  <  50 then asteroid4Y  =  asteroid4Y  +  0.16

	LDA asteroid4Y
	CMP #50
     BCS .skipL0143
.condpart86
	LDA e
	CLC 
	ADC #40
	STA e
	LDA asteroid4Y
	ADC #0
	STA asteroid4Y
.skipL0143
.L0144 ;  if asteroid4Y  >  50 then asteroid4Y  =  asteroid4Y  -  0.16

	LDA #50
	CMP asteroid4Y
     BCS .skipL0144
.condpart87
	LDA e
	SEC 
	SBC #40
	STA e
	LDA asteroid4Y
	SBC #0
	STA asteroid4Y
.skipL0144
.
 ; 

.L0145 ;  goto resetScreen

 jmp .resetScreen

.
 ; 

.fast
 ; fast

.L0146 ;  if asteroidY  <  50 then asteroidY  =  asteroidY  +  0.15

	LDA asteroidY
	CMP #50
     BCS .skipL0146
.condpart88
	LDA b
	CLC 
	ADC #38
	STA b
	LDA asteroidY
	ADC #0
	STA asteroidY
.skipL0146
.L0147 ;  if asteroidY  >  50 then asteroidY  =  asteroidY  -  0.15

	LDA #50
	CMP asteroidY
     BCS .skipL0147
.condpart89
	LDA b
	SEC 
	SBC #38
	STA b
	LDA asteroidY
	SBC #0
	STA asteroidY
.skipL0147
.
 ; 

.L0148 ;  if asteroid2Y  <  50 then asteroid2Y  =  asteroid2Y  +  0.17

	LDA asteroid2Y
	CMP #50
     BCS .skipL0148
.condpart90
	LDA c
	CLC 
	ADC #43
	STA c
	LDA asteroid2Y
	ADC #0
	STA asteroid2Y
.skipL0148
.L0149 ;  if asteroid2Y  >  50 then asteroid2Y  =  asteroid2Y  -  0.17

	LDA #50
	CMP asteroid2Y
     BCS .skipL0149
.condpart91
	LDA c
	SEC 
	SBC #43
	STA c
	LDA asteroid2Y
	SBC #0
	STA asteroid2Y
.skipL0149
.
 ; 

.L0150 ;  if asteroid3Y  <  50 then asteroid3Y  =  asteroid3Y  +  0.19

	LDA asteroid3Y
	CMP #50
     BCS .skipL0150
.condpart92
	LDA d
	CLC 
	ADC #48
	STA d
	LDA asteroid3Y
	ADC #0
	STA asteroid3Y
.skipL0150
.L0151 ;  if asteroid3Y  >  50 then asteroid3Y  =  asteroid3Y  -  0.19

	LDA #50
	CMP asteroid3Y
     BCS .skipL0151
.condpart93
	LDA d
	SEC 
	SBC #48
	STA d
	LDA asteroid3Y
	SBC #0
	STA asteroid3Y
.skipL0151
.
 ; 

.L0152 ;  if asteroid4Y  <  50 then asteroid4Y  =  asteroid4Y  +  0.13

	LDA asteroid4Y
	CMP #50
     BCS .skipL0152
.condpart94
	LDA e
	CLC 
	ADC #33
	STA e
	LDA asteroid4Y
	ADC #0
	STA asteroid4Y
.skipL0152
.L0153 ;  if asteroid4Y  >  50 then asteroid4Y  =  asteroid4Y  -  0.13

	LDA #50
	CMP asteroid4Y
     BCS .skipL0153
.condpart95
	LDA e
	SEC 
	SBC #33
	STA e
	LDA asteroid4Y
	SBC #0
	STA asteroid4Y
.skipL0153
.L0154 ;  goto resetScreen

 jmp .resetScreen

.
 ; 

.
 ; 

.slow
 ; slow

.L0155 ;  if asteroidY  <  50 then asteroidY  =  asteroidY  +  0.13

	LDA asteroidY
	CMP #50
     BCS .skipL0155
.condpart96
	LDA b
	CLC 
	ADC #33
	STA b
	LDA asteroidY
	ADC #0
	STA asteroidY
.skipL0155
.L0156 ;  if asteroidY  >  50 then asteroidY  =  asteroidY  -  0.13

	LDA #50
	CMP asteroidY
     BCS .skipL0156
.condpart97
	LDA b
	SEC 
	SBC #33
	STA b
	LDA asteroidY
	SBC #0
	STA asteroidY
.skipL0156
.
 ; 

.L0157 ;  if asteroid2Y  <  50  &&  _sc3  >  $03 then asteroid2Y  =  asteroid2Y  +  0.15

	LDA asteroid2Y
	CMP #50
     BCS .skipL0157
.condpart98
	LDA #$03
	CMP _sc3
     BCS .skip98then
.condpart99
	LDA c
	CLC 
	ADC #38
	STA c
	LDA asteroid2Y
	ADC #0
	STA asteroid2Y
.skip98then
.skipL0157
.L0158 ;  if asteroid2Y  >  50  &&  _sc3  >  $03 then asteroid2Y  =  asteroid2Y  -  0.15

	LDA #50
	CMP asteroid2Y
     BCS .skipL0158
.condpart100
	LDA #$03
	CMP _sc3
     BCS .skip100then
.condpart101
	LDA c
	SEC 
	SBC #38
	STA c
	LDA asteroid2Y
	SBC #0
	STA asteroid2Y
.skip100then
.skipL0158
.
 ; 

.L0159 ;  if asteroid3Y  <  50  &&  _sc3  >  $15 then asteroid3Y  =  asteroid3Y  +  0.17

	LDA asteroid3Y
	CMP #50
     BCS .skipL0159
.condpart102
	LDA #$15
	CMP _sc3
     BCS .skip102then
.condpart103
	LDA d
	CLC 
	ADC #43
	STA d
	LDA asteroid3Y
	ADC #0
	STA asteroid3Y
.skip102then
.skipL0159
.L0160 ;  if asteroid3Y  >  50  &&  _sc3  >  $15 then asteroid3Y  =  asteroid3Y  -  0.17

	LDA #50
	CMP asteroid3Y
     BCS .skipL0160
.condpart104
	LDA #$15
	CMP _sc3
     BCS .skip104then
.condpart105
	LDA d
	SEC 
	SBC #43
	STA d
	LDA asteroid3Y
	SBC #0
	STA asteroid3Y
.skip104then
.skipL0160
.
 ; 

.L0161 ;  if asteroid4Y  <  50  &&  _sc3  >  $20 then asteroid4Y  =  asteroid4Y  +  0.1

	LDA asteroid4Y
	CMP #50
     BCS .skipL0161
.condpart106
	LDA #$20
	CMP _sc3
     BCS .skip106then
.condpart107
	LDA e
	CLC 
	ADC #25
	STA e
	LDA asteroid4Y
	ADC #0
	STA asteroid4Y
.skip106then
.skipL0161
.L0162 ;  if asteroid4Y  >  50  &&  _sc3  >  $20 then asteroid4Y  =  asteroid4Y  -  0.1

	LDA #50
	CMP asteroid4Y
     BCS .skipL0162
.condpart108
	LDA #$20
	CMP _sc3
     BCS .skip108then
.condpart109
	LDA e
	SEC 
	SBC #25
	STA e
	LDA asteroid4Y
	SBC #0
	STA asteroid4Y
.skip108then
.skipL0162
.
 ; 

.
 ; 

.resetScreen
 ; resetScreen

.
 ; 

.L0163 ;  COLUPF  =  $40

	LDA #$40
	STA COLUPF
.L0164 ;  drawscreen

 sta temp7
 lda #>(ret_point2-1)
 pha
 lda #<(ret_point2-1)
 pha
 lda #>(drawscreen-1)
 pha
 lda #<(drawscreen-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #2
 jmp BS_jsr
ret_point2
.
 ; 

.
 ; 

.L0165 ;  goto sprites

 jmp .sprites

.
 ; 

.setPlayer1Color
 ; setPlayer1Color

.L0166 ;  if ticker  =  0 then _COLUP1  =  $22

	LDA ticker
	CMP #0
     BNE .skipL0166
.condpart110
	LDA #$22
	STA _COLUP1
.skipL0166
.L0167 ;  if ticker  =  1 then _COLUP1  =  $38

	LDA ticker
	CMP #1
     BNE .skipL0167
.condpart111
	LDA #$38
	STA _COLUP1
.skipL0167
.L0168 ;  if ticker  =  2 then _COLUP1  =  $66

	LDA ticker
	CMP #2
     BNE .skipL0168
.condpart112
	LDA #$66
	STA _COLUP1
.skipL0168
.L0169 ;  if ticker  =  3 then _COLUP1  =  $78

	LDA ticker
	CMP #3
     BNE .skipL0169
.condpart113
	LDA #$78
	STA _COLUP1
.skipL0169
.L0170 ;  if ticker  =  4 then _COLUP1  =  $CA

	LDA ticker
	CMP #4
     BNE .skipL0170
.condpart114
	LDA #$CA
	STA _COLUP1
.skipL0170
.L0171 ;  if ticker  =  5 then _COLUP1  =  $D6

	LDA ticker
	CMP #5
     BNE .skipL0171
.condpart115
	LDA #$D6
	STA _COLUP1
.skipL0171
.L0172 ;  if ticker  =  6 then _COLUP1  =  $E8

	LDA ticker
	CMP #6
     BNE .skipL0172
.condpart116
	LDA #$E8
	STA _COLUP1
.skipL0172
.
 ; 

.
 ; 

.
 ; 

.L0173 ;  goto colorSetComplete

 jmp .colorSetComplete

.
 ; 

.setPlayer2Color
 ; setPlayer2Color

.L0174 ;  if ticker  =  0 then COLUP2  =  $22

	LDA ticker
	CMP #0
     BNE .skipL0174
.condpart117
	LDA #$22
	STA COLUP2
.skipL0174
.L0175 ;  if ticker  =  1 then COLUP2  =  $38

	LDA ticker
	CMP #1
     BNE .skipL0175
.condpart118
	LDA #$38
	STA COLUP2
.skipL0175
.L0176 ;  if ticker  =  2 then COLUP2  =  $66

	LDA ticker
	CMP #2
     BNE .skipL0176
.condpart119
	LDA #$66
	STA COLUP2
.skipL0176
.L0177 ;  if ticker  =  3 then COLUP2  =  $78

	LDA ticker
	CMP #3
     BNE .skipL0177
.condpart120
	LDA #$78
	STA COLUP2
.skipL0177
.L0178 ;  if ticker  =  4 then COLUP2  =  $CA

	LDA ticker
	CMP #4
     BNE .skipL0178
.condpart121
	LDA #$CA
	STA COLUP2
.skipL0178
.L0179 ;  if ticker  =  5 then COLUP2  =  $D6

	LDA ticker
	CMP #5
     BNE .skipL0179
.condpart122
	LDA #$D6
	STA COLUP2
.skipL0179
.L0180 ;  if ticker  =  6 then COLUP2  =  $E8

	LDA ticker
	CMP #6
     BNE .skipL0180
.condpart123
	LDA #$E8
	STA COLUP2
.skipL0180
.L0181 ;  if ticker  =  7 then COLUP2  =  $3E

	LDA ticker
	CMP #7
     BNE .skipL0181
.condpart124
	LDA #$3E
	STA COLUP2
.skipL0181
.L0182 ;  if ticker  =  8 then COLUP2  =  $DC

	LDA ticker
	CMP #8
     BNE .skipL0182
.condpart125
	LDA #$DC
	STA COLUP2
.skipL0182
.L0183 ;  if ticker  =  9 then COLUP2  =  $48

	LDA ticker
	CMP #9
     BNE .skipL0183
.condpart126
	LDA #$48
	STA COLUP2
.skipL0183
.L0184 ;  if ticker  =  10 then COLUP2  =  $68

	LDA ticker
	CMP #10
     BNE .skipL0184
.condpart127
	LDA #$68
	STA COLUP2
.skipL0184
.
 ; 

.L0185 ;  if ticker  <  4 then switchSprite  =  0

	LDA ticker
	CMP #4
     BCS .skipL0185
.condpart128
	LDA #0
	STA switchSprite
.skipL0185
.L0186 ;  if ticker  >=  4 then switchSprite  =  1

	LDA ticker
	CMP #4
     BCC .skipL0186
.condpart129
	LDA #1
	STA switchSprite
.skipL0186
.
 ; 

.
 ; 

.L0187 ;  goto colorSetComplete

 jmp .colorSetComplete

.
 ; 

.setPlayer3Color
 ; setPlayer3Color

.L0188 ;  if ticker  =  0 then COLUP3  =  $22

	LDA ticker
	CMP #0
     BNE .skipL0188
.condpart130
	LDA #$22
	STA COLUP3
.skipL0188
.L0189 ;  if ticker  =  1 then COLUP3  =  $38

	LDA ticker
	CMP #1
     BNE .skipL0189
.condpart131
	LDA #$38
	STA COLUP3
.skipL0189
.L0190 ;  if ticker  =  2 then COLUP3  =  $66

	LDA ticker
	CMP #2
     BNE .skipL0190
.condpart132
	LDA #$66
	STA COLUP3
.skipL0190
.L0191 ;  if ticker  =  3 then COLUP3  =  $78

	LDA ticker
	CMP #3
     BNE .skipL0191
.condpart133
	LDA #$78
	STA COLUP3
.skipL0191
.L0192 ;  if ticker  =  4 then COLUP3  =  $CA

	LDA ticker
	CMP #4
     BNE .skipL0192
.condpart134
	LDA #$CA
	STA COLUP3
.skipL0192
.L0193 ;  if ticker  =  5 then COLUP3  =  $D6

	LDA ticker
	CMP #5
     BNE .skipL0193
.condpart135
	LDA #$D6
	STA COLUP3
.skipL0193
.L0194 ;  if ticker  =  6 then COLUP3  =  $E8

	LDA ticker
	CMP #6
     BNE .skipL0194
.condpart136
	LDA #$E8
	STA COLUP3
.skipL0194
.L0195 ;  if ticker  =  7 then COLUP3  =  $3E

	LDA ticker
	CMP #7
     BNE .skipL0195
.condpart137
	LDA #$3E
	STA COLUP3
.skipL0195
.L0196 ;  if ticker  =  8 then COLUP3  =  $DC

	LDA ticker
	CMP #8
     BNE .skipL0196
.condpart138
	LDA #$DC
	STA COLUP3
.skipL0196
.L0197 ;  if ticker  =  9 then COLUP3  =  $48

	LDA ticker
	CMP #9
     BNE .skipL0197
.condpart139
	LDA #$48
	STA COLUP3
.skipL0197
.L0198 ;  if ticker  =  10 then COLUP3  =  $68

	LDA ticker
	CMP #10
     BNE .skipL0198
.condpart140
	LDA #$68
	STA COLUP3
.skipL0198
.L0199 ;  goto colorSetComplete

 jmp .colorSetComplete

.
 ; 

.setPlayer4Color
 ; setPlayer4Color

.L0200 ;  if ticker  =  0 then COLUP4  =  $22

	LDA ticker
	CMP #0
     BNE .skipL0200
.condpart141
	LDA #$22
	STA COLUP4
.skipL0200
.L0201 ;  if ticker  =  1 then COLUP4  =  $38

	LDA ticker
	CMP #1
     BNE .skipL0201
.condpart142
	LDA #$38
	STA COLUP4
.skipL0201
.L0202 ;  if ticker  =  2 then COLUP4  =  $66

	LDA ticker
	CMP #2
     BNE .skipL0202
.condpart143
	LDA #$66
	STA COLUP4
.skipL0202
.L0203 ;  if ticker  =  3 then COLUP4  =  $78

	LDA ticker
	CMP #3
     BNE .skipL0203
.condpart144
	LDA #$78
	STA COLUP4
.skipL0203
.L0204 ;  if ticker  =  4 then COLUP4  =  $CA

	LDA ticker
	CMP #4
     BNE .skipL0204
.condpart145
	LDA #$CA
	STA COLUP4
.skipL0204
.L0205 ;  if ticker  =  5 then COLUP4  =  $D6

	LDA ticker
	CMP #5
     BNE .skipL0205
.condpart146
	LDA #$D6
	STA COLUP4
.skipL0205
.L0206 ;  if ticker  =  6 then COLUP4  =  $E8

	LDA ticker
	CMP #6
     BNE .skipL0206
.condpart147
	LDA #$E8
	STA COLUP4
.skipL0206
.L0207 ;  if ticker  =  7 then COLUP4  =  $3E

	LDA ticker
	CMP #7
     BNE .skipL0207
.condpart148
	LDA #$3E
	STA COLUP4
.skipL0207
.L0208 ;  if ticker  =  8 then COLUP4  =  $DC

	LDA ticker
	CMP #8
     BNE .skipL0208
.condpart149
	LDA #$DC
	STA COLUP4
.skipL0208
.L0209 ;  if ticker  =  9 then COLUP4  =  $48

	LDA ticker
	CMP #9
     BNE .skipL0209
.condpart150
	LDA #$48
	STA COLUP4
.skipL0209
.L0210 ;  if ticker  =  10 then COLUP4  =  $68

	LDA ticker
	CMP #10
     BNE .skipL0210
.condpart151
	LDA #$68
	STA COLUP4
.skipL0210
.
 ; 

.L0211 ;  goto colorSetComplete

 jmp .colorSetComplete

.
 ; 

.
 ; 

.
 ; 

.
 ; 

.
 ; 

.
 ; 

.
 ; 

.collisions
 ; collisions

.
 ; 

.L0212 ;  AUDV0  =  12  :  AUDC0  =  8  :  AUDF0  =  28

	LDA #12
	STA AUDV0
	LDA #8
	STA AUDC0
	LDA #28
	STA AUDF0
.L0213 ;  score  =  score  +  1

	SED
	CLC
	LDA score+2
	ADC #$01
	STA score+2
	LDA score+1
	ADC #$00
	STA score+1
	LDA score
	ADC #$00
	STA score
	CLD
.
 ; 

.
 ; 

.
 ; 

.
 ; 

.
 ; 

.L0214 ;  player5x  =  missile0x  +  4

	LDA missile0x
	CLC
	ADC #4
	STA player5x
.L0215 ;  player5y  =  missile0y  +  2

	LDA missile0y
	CLC
	ADC #2
	STA player5y
.
 ; 

.L0216 ;  missile0y  =  200

	LDA #200
	STA missile0y
.
 ; 

.L0217 ;  if missile0x  >  27  &&  missile0x  <  37 then player1x  =  76 :  player1y  =  100

	LDA #27
	CMP missile0x
     BCS .skipL0217
.condpart152
	LDA missile0x
	CMP #37
     BCS .skip152then
.condpart153
	LDA #76
	STA player1x
	LDA #100
	STA player1y
.skip152then
.skipL0217
.L0218 ;  if missile0x  >  37  &&  missile0x  <  47 then player2x  =  86 :  player2y  =  0

	LDA #37
	CMP missile0x
     BCS .skipL0218
.condpart154
	LDA missile0x
	CMP #47
     BCS .skip154then
.condpart155
	LDA #86
	STA player2x
	LDA #0
	STA player2y
.skip154then
.skipL0218
.L0219 ;  if missile0x  >  47  &&  missile0x  <  57 then player3x  =  96 :  player3y  =  100

	LDA #47
	CMP missile0x
     BCS .skipL0219
.condpart156
	LDA missile0x
	CMP #57
     BCS .skip156then
.condpart157
	LDA #96
	STA player3x
	LDA #100
	STA player3y
.skip156then
.skipL0219
.L0220 ;  if missile0x  >  57  &&  missile0x  <  67 then player4x  =  106 :  player4y  =  0

	LDA #57
	CMP missile0x
     BCS .skipL0220
.condpart158
	LDA missile0x
	CMP #67
     BCS .skip158then
.condpart159
	LDA #106
	STA player4x
	LDA #0
	STA player4y
.skip158then
.skipL0220
.
 ; 

.L0221 ;  if missile0x  >  67  &&  missile0x  <  77 then player1x  =  116 :  player1y  =  0

	LDA #67
	CMP missile0x
     BCS .skipL0221
.condpart160
	LDA missile0x
	CMP #77
     BCS .skip160then
.condpart161
	LDA #116
	STA player1x
	LDA #0
	STA player1y
.skip160then
.skipL0221
.L0222 ;  if missile0x  >  77  &&  missile0x  <  87 then player2x  =  126 :  player2y  =  100

	LDA #77
	CMP missile0x
     BCS .skipL0222
.condpart162
	LDA missile0x
	CMP #87
     BCS .skip162then
.condpart163
	LDA #126
	STA player2x
	LDA #100
	STA player2y
.skip162then
.skipL0222
.L0223 ;  if missile0x  >  87  &&  missile0x  <  97 then player3x  =  136 :  player3y  =  0

	LDA #87
	CMP missile0x
     BCS .skipL0223
.condpart164
	LDA missile0x
	CMP #97
     BCS .skip164then
.condpart165
	LDA #136
	STA player3x
	LDA #0
	STA player3y
.skip164then
.skipL0223
.L0224 ;  if missile0x  >  97  &&  missile0x  <  107 then player4x  =  66 :  player4y  =  100

	LDA #97
	CMP missile0x
     BCS .skipL0224
.condpart166
	LDA missile0x
	CMP #107
     BCS .skip166then
.condpart167
	LDA #66
	STA player4x
	LDA #100
	STA player4y
.skip166then
.skipL0224
.
 ; 

.L0225 ;  if missile0x  >  107  &&  missile0x  <  117 then player1x  =  36 :  player1y  =  100

	LDA #107
	CMP missile0x
     BCS .skipL0225
.condpart168
	LDA missile0x
	CMP #117
     BCS .skip168then
.condpart169
	LDA #36
	STA player1x
	LDA #100
	STA player1y
.skip168then
.skipL0225
.L0226 ;  if missile0x  >  117  &&  missile0x  <  127 then player2x  =  46 :  player2y  =  100

	LDA #117
	CMP missile0x
     BCS .skipL0226
.condpart170
	LDA missile0x
	CMP #127
     BCS .skip170then
.condpart171
	LDA #46
	STA player2x
	LDA #100
	STA player2y
.skip170then
.skipL0226
.L0227 ;  if missile0x  >  127  &&  missile0x  <  137 then player3x  =  56 :  player3y  =  0

	LDA #127
	CMP missile0x
     BCS .skipL0227
.condpart172
	LDA missile0x
	CMP #137
     BCS .skip172then
.condpart173
	LDA #56
	STA player3x
	LDA #0
	STA player3y
.skip172then
.skipL0227
.L0228 ;  if missile0x  >  137  &&  missile0x  <  147 then player4x  =  66 :  player4y  =  0

	LDA #137
	CMP missile0x
     BCS .skipL0228
.condpart174
	LDA missile0x
	CMP #147
     BCS .skip174then
.condpart175
	LDA #66
	STA player4x
	LDA #0
	STA player4y
.skip174then
.skipL0228
.
 ; 

.L0229 ;  goto frameReset

 jmp .frameReset

.
 ; 

.gameOver
 ; gameOver

.L0230 ;  if !_Bit6_Sequence_Switch{6} then _P0_Luminosity  =  _P0_Luminosity  +  1  :  if _P0_Luminosity  >=  $20 then _Bit6_Sequence_Switch{6}  =  1 :  _resetTicker  =  _resetTicker  +  1

	BIT _Bit6_Sequence_Switch
	BVS .skipL0230
.condpart176
	INC _P0_Luminosity
	LDA _P0_Luminosity
	CMP #$20
     BCC .skip176then
.condpart177
	LDA _Bit6_Sequence_Switch
	ORA #64
	STA _Bit6_Sequence_Switch
	INC _resetTicker
.skip176then
.skipL0230
.L0231 ;  if _Bit6_Sequence_Switch{6} then _P0_Luminosity  =  _P0_Luminosity  -  1  :  if _P0_Luminosity  <=  $12 then _P0_Luminosity  =  $10  :  _Bit6_Sequence_Switch{6}  =  0

	BIT _Bit6_Sequence_Switch
	BVC .skipL0231
.condpart178
	DEC _P0_Luminosity
	LDA #$12
	CMP _P0_Luminosity
     BCC .skip178then
.condpart179
	LDA #0
	STA b
	LDA #$10
	STA _P0_Luminosity
	LDA _Bit6_Sequence_Switch
	AND #191
	STA _Bit6_Sequence_Switch
.skip178then
.skipL0231
.L0232 ;  AUDV1  =  10  :  AUDC1  =  8  :  AUDF1  =  25

	LDA #10
	STA AUDV1
	LDA #8
	STA AUDC1
	LDA #25
	STA AUDF1
.L0233 ;  COLUBK  =  _P0_Luminosity

	LDA _P0_Luminosity
	STA COLUBK
.
 ; 

.L0234 ;  if _resetTicker  >  3 then goto resetGame

	LDA #3
	CMP _resetTicker
     BCS .skipL0234
.condpart180
 jmp .resetGame

.skipL0234
.
 ; 

.L0235 ;  goto resetScreen

 jmp .resetScreen

.
 ; 

.resetGame
 ; resetGame

.L0236 ;  player0x = 66

	LDA #66
	STA player0x
.L0237 ;  player0y = 57

	LDA #57
	STA player0y
.
 ; 

.L0238 ;  player1x = 76

	LDA #76
	STA player1x
.L0239 ;  player1y = 0

	LDA #0
	STA player1y
.
 ; 

.L0240 ;  player2x = 86

	LDA #86
	STA player2x
.L0241 ;  player2y = 110

	LDA #110
	STA player2y
.
 ; 

.L0242 ;  player3x = 96

	LDA #96
	STA player3x
.L0243 ;  player3y = 120

	LDA #120
	STA player3y
.
 ; 

.L0244 ;  player4x = 106

	LDA #106
	STA player4x
.L0245 ;  player4y =  100

	LDA #100
	STA player4y
.
 ; 

.L0246 ;  missile0y = 255

	LDA #255
	STA missile0y
.L0247 ;  missile0y = 255

	LDA #255
	STA missile0y
.
 ; 

.L0248 ;  _resetTicker  =  0

	LDA #0
	STA _resetTicker
.L0249 ;  missile1y =  200

	LDA #200
	STA missile1y
.L0250 ;  COLUBK  =  $20

	LDA #$20
	STA COLUBK
.L0251 ;  AUDV1  =  0  :  AUDC1  =  0  :  AUDF1  =  0

	LDA #0
	STA AUDV1
	STA AUDC1
	STA AUDF1
.L0252 ;  lives  =  lives  -  32

	LDA lives
	SEC
	SBC #32
	STA lives
.
 ; 

.L0253 ;  if lives  <  32 then gameReady  =  0 :  firstFrame  =  0 :  lives  =  lives  +  96

	LDA lives
	CMP #32
     BCS .skipL0253
.condpart181
	LDA #0
	STA gameReady
	STA firstFrame
	LDA lives
	CLC
	ADC #96
	STA lives
.skipL0253
.
 ; 

.
 ; 

.L0254 ;  goto resetScreen

 jmp .resetScreen

.
 ; 

.
 ; 

.L0255 ;  bank 2

 if ECHO1
 echo "    ",[(start_bank1 - *)]d , "bytes of ROM space left in bank 1")
 endif
ECHO1 = 1
 ORG $1FF4-bscode_length
 RORG $DFF4-bscode_length
start_bank1 ldx #$ff
 ifconst FASTFETCH ; using DPC+
 stx FASTFETCH
 endif 
 txs
 if bankswitch == 64
   lda #(((>(start-1)) & $0F) | $F0)
 else
   lda #>(start-1)
 endif
 pha
 lda #<(start-1)
 pha
 pha
 txa
 pha
 tsx
 if bankswitch != 64
   lda 4,x ; get high byte of return address
   rol
   rol
   rol
   rol
   and #bs_mask ;1 3 or 7 for F8/F6/F4
   tax
   inx
 else
   lda 4,x ; get high byte of return address
   tay
   ora #$10 ; change our bank nibble into a valid rom mirror
   sta 4,x
   tya
   lsr 
   lsr 
   lsr 
   lsr 
   tax
   inx
 endif
 lda bankswitch_hotspot-1,x
 pla
 tax
 pla
 rts
 if ((* & $1FFF) > ((bankswitch_hotspot & $1FFF) - 1))
   echo "WARNING: size parameter in banksw.asm too small - the program probably will not work."
   echo "Change to",[(*-begin_bscode+1)&$FF]d,"and try again."
 endif
 ORG $1FFC
 RORG $DFFC
 .word start_bank1
 .word start_bank1
 ORG $2000
 RORG $F000
FineAdjustTableBegin
	.byte %01100000		;left 6
	.byte %01010000
	.byte %01000000
	.byte %00110000
	.byte %00100000
	.byte %00010000
	.byte %00000000		;left 0
	.byte %11110000
	.byte %11100000
	.byte %11010000
	.byte %11000000
	.byte %10110000
	.byte %10100000
	.byte %10010000
	.byte %10000000		;right 8
FineAdjustTableEnd	=	FineAdjustTableBegin - 241

PFStart
 .byte 87,43,0,21,0,0,0,10
blank_pf
 .byte 0,0,0,0,0,0,0,5
; .byte 43,21,0,10,0,0,0,5
 ifconst screenheight
pfsub
 .byte 8,4,2,2,1,0,0,1,0
 endif
	;--set initial P1 positions
multisprite_setup
 lda #15
 sta pfheight

	ldx #4
; stx temp3
SetCopyHeight
;	lda #76
;	sta NewSpriteX,X
;	lda CopyColorData,X
;	sta NewCOLUP1,X
 ;lda SpriteHeightTable,X
; sta spriteheight,x
	txa
	sta SpriteGfxIndex,X
	sta spritesort,X
	dex
	bpl SetCopyHeight



; since we can't turn off pf, point PF to zeros here
 lda #>blank_pf
 sta PF2pointer+1
 sta PF1pointer+1
 lda #<blank_pf
 sta PF2pointer
 sta PF1pointer
 rts

drawscreen
 ifconst debugscore
 jsr debugcycles
 endif

WaitForOverscanEnd
	lda INTIM
	bmi WaitForOverscanEnd

	lda #2
	sta WSYNC
	sta VSYNC
	sta WSYNC
	sta WSYNC
	lsr
	sta VDELBL
	sta VDELP0
	sta WSYNC
	sta VSYNC	;turn off VSYNC
      ifconst overscan_time
        lda #overscan_time+5+128
      else
	lda #42+128
      endif
	sta TIM64T

; run possible vblank bB code
 ifconst vblank_bB_code
   jsr vblank_bB_code
 endif

 	jsr setscorepointers
	jsr SetupP1Subroutine

	;-------------





	;--position P0, M0, M1, BL

	jsr PrePositionAllObjects

	;--set up player 0 pointer

 dec player0y
	lda player0pointer ; player0: must be run every frame!
	sec
	sbc player0y
	clc
	adc player0height
	sta player0pointer

	lda player0y
	sta P0Top
	sec
	sbc player0height
	clc
	adc #$80
	sta P0Bottom
	

	;--some final setup

 ldx #4
 lda #$80
cycle74_HMCLR
 sta HMP0,X
 dex
 bpl cycle74_HMCLR
;	sta HMCLR


	lda #0
	sta PF1
	sta PF2
	sta GRP0
	sta GRP1


	jsr KernelSetupSubroutine

WaitForVblankEnd
	lda INTIM
	bmi WaitForVblankEnd
        lda #0
	sta WSYNC
	sta VBLANK	;turn off VBLANK - it was turned on by overscan
	sta CXCLR


	jmp KernelRoutine


PositionASpriteSubroutine	;call this function with A == horizontal position (0-159)
				;and X == the object to be positioned (0=P0, 1=P1, 2=M0, etc.)
				;if you do not wish to write to P1 during this function, make
				;sure Y==0 before you call it.  This function will change Y, and A
				;will be the value put into HMxx when returned.
				;Call this function with at least 11 cycles left in the scanline 
				;(jsr + sec + sta WSYNC = 11); it will return 9 cycles
				;into the second scanline
	sec
	sta WSYNC			;begin line 1
	sta.w HMCLR			;+4	 4
DivideBy15Loop
	sbc #15
	bcs DivideBy15Loop			;+4/5	8/13.../58

	tay				;+2	10/15/...60
	lda FineAdjustTableEnd,Y	;+5	15/20/...65

			;	15
	sta HMP0,X	;+4	19/24/...69
	sta RESP0,X	;+4	23/28/33/38/43/48/53/58/63/68/73
	sta WSYNC	;+3	 0	begin line 2
	sta HMOVE	;+3
	rts		;+6	 9

;-------------------------------------------------------------------------

PrePositionAllObjects

	ldx #4
	lda ballx
	jsr PositionASpriteSubroutine
	
	dex
	lda missile1x
	jsr PositionASpriteSubroutine
	
	dex
	lda missile0x
	jsr PositionASpriteSubroutine

	dex
	dex
	lda player0x
	jsr PositionASpriteSubroutine

	rts


;-------------------------------------------------------------------------








;-------------------------------------------------------------------------


KernelSetupSubroutine

	ldx #4
AdjustYValuesUpLoop
	lda NewSpriteY,X
	clc
	adc #2
	sta NewSpriteY,X
	dex
	bpl AdjustYValuesUpLoop


	ldx temp3 ; first sprite displayed

	lda SpriteGfxIndex,x
	tay
	lda NewSpriteY,y
	sta RepoLine

	lda SpriteGfxIndex-1,x
	tay
	lda NewSpriteY,y
	sta temp6

	stx SpriteIndex



	lda #255
	sta P1Bottom

	lda player0y
 ifconst screenheight
	cmp #screenheight+1
 else
	cmp #$59
 endif
	bcc nottoohigh
	lda P0Bottom
	sta P0Top		

       

nottoohigh
	rts

;-------------------------------------------------------------------------





;*************************************************************************

;-------------------------------------------------------------------------
;-------------------------Data Below--------------------------------------
;-------------------------------------------------------------------------

MaskTable
	.byte 1,3,7,15,31

 ; shove 6-digit score routine here

sixdigscore
	lda #0
;	sta COLUBK
	sta PF0
	sta PF1
	sta PF2
	sta ENABL
	sta ENAM0
	sta ENAM1
	;end of kernel here


 ; 6 digit score routine
; lda #0
; sta PF1
; sta PF2
; tax

   sta WSYNC;,x

;                STA WSYNC ;first one, need one more
 sta REFP0
 sta REFP1
                STA GRP0
                STA GRP1
 sta HMCLR

 ; restore P0pointer

	lda player0pointer
	clc
	adc player0y
	sec
	sbc player0height
	sta player0pointer
 inc player0y

 ifconst vblank_time
 ifconst screenheight
 if screenheight == 84
	lda  #vblank_time+9+128+10
 else
	lda  #vblank_time+9+128+19
 endif
 else
	lda  #vblank_time+9+128
 endif
 else
 ifconst screenheight
 if screenheight == 84
	lda  #52+128+10
 else
	lda  #52+128+19
 endif
 else
	lda  #52+128
 endif
 endif

	sta  TIM64T
 ifconst minikernel
 jsr minikernel
 endif
 ifconst noscore
 jmp skipscore
 endif

; score pointers contain:
; score1-5: lo1,lo2,lo3,lo4,lo5,lo6
; swap lo2->temp1
; swap lo4->temp3
; swap lo6->temp5

 lda scorepointers+5
 sta temp5
 lda scorepointers+1
 sta temp1
 lda scorepointers+3
 sta temp3

 lda #>scoretable
 sta scorepointers+1
 sta scorepointers+3
 sta scorepointers+5
 sta temp2
 sta temp4
 sta temp6

 rts



;-------------------------------------------------------------------------
;----------------------Kernel Routine-------------------------------------
;-------------------------------------------------------------------------


;-------------------------------------------------------------------------
; repeat $f147-*
; brk
; repend
;	org $F240

SwitchDrawP0K1				;	72
	lda P0Bottom
	sta P0Top			;+6	 2
	jmp BackFromSwitchDrawP0K1	;+3	 5

WaitDrawP0K1				;	74
	SLEEP 4				;+4	 2
	jmp BackFromSwitchDrawP0K1	;+3	 5

SkipDrawP1K1				;	11
	lda #0
	sta GRP1			;+5	16	so Ball gets drawn
	jmp BackFromSkipDrawP1		;+3	19

;-------------------------------------------------------------------------

KernelRoutine
 ifnconst screenheight
 sleep 12
 ; jsr wastetime ; waste 12 cycles
 else
 sleep 6
 endif
	tsx
	stx stack1
	ldx #ENABL
	txs			;+9	 9

 ldx #0
 lda pfheight
 bpl asdhj
 .byte $24
asdhj
 tax

; ldx pfheight
 lda PFStart,x ; get pf pixel resolution for heights 15,7,3,1,0

 ifconst screenheight
  sec
 if screenheight == 84
  sbc pfsub+1,x
 else
  sbc pfsub,x
 endif
 endif
 
 sta pfpixelheight

 ifconst screenheight
        ldy #screenheight
 else
	ldy #88
 endif
 
;	lda #$02
;	sta COLUBK		;+5	18

; sleep 25
 sleep 2
KernelLoopa			;	50
	SLEEP 7			;+4	54
KernelLoopb			;	54
	SLEEP 2		;+12	66
	cpy P0Top		;+3	69
	beq SwitchDrawP0K1	;+2	71
	bpl WaitDrawP0K1	;+2	73
	lda (player0pointer),Y	;+5	 2
	sta GRP0		;+3	 5	VDEL because of repokernel
BackFromSwitchDrawP0K1

	cpy P1Bottom		;+3	 8	unless we mean to draw immediately, this should be set
				;		to a value greater than maximum Y value initially
	bcc SkipDrawP1K1	;+2	10
	lda (P1display),Y	;+5	15
	sta.w GRP1		;+4	19
BackFromSkipDrawP1

;fuck	
 sty temp1
 ldy pfpixelheight
	lax (PF1pointer),y
	stx PF1			;+7	26
	lda (PF2pointer),y
	sta PF2			;+7	33
 ;sleep 6
	stx PF1temp2
	sta PF2temp2
	dey
 bmi pagewraphandler
	lda (PF1pointer),y
cyclebalance
	sta PF1temp1
	lda (PF2pointer),y
	sta PF2temp1
 ldy temp1

 ldx #ENABL
 txs
	cpy bally
	php			;+6	39	VDEL ball


	cpy missile1y
	php			;+6	71

	cpy missile0y
	php			;+6	 1
	

	dey			;+2	15

	cpy RepoLine		;+3	18
	beq RepoKernel		;+2	20
;	SLEEP 20		;+23	43
 sleep 6

newrepo ; since we have time here, store next repoline
 ldx SpriteIndex
 lda SpriteGfxIndex-1,x
 tax
 lda NewSpriteY,x
 sta temp6
 sleep 4 

BackFromRepoKernel
	tya			;+2	45
	and pfheight			;+2	47
	bne KernelLoopa		;+2	49
	dec pfpixelheight
	bpl KernelLoopb		;+3	54
;	bmi donewkernel		;+3	54
;	bne KernelLoopb+1		;+3	54

donewkernel
	jmp DoneWithKernel	;+3	56

pagewraphandler
 jmp cyclebalance

;-------------------------------------------------------------------------
 
 ; room here for score?

setscorepointers
 lax score+2
 jsr scorepointerset
 sty scorepointers+5
 stx scorepointers+2
 lax score+1
 jsr scorepointerset
 sty scorepointers+4
 stx scorepointers+1
 lax score
 jsr scorepointerset
 sty scorepointers+3
 stx scorepointers
wastetime
 rts

scorepointerset
 and #$0F
 asl
 asl
 asl
 adc #<scoretable
 tay
 txa
 and #$F0
 lsr
 adc #<scoretable
 tax
 rts
;	align 256

SwitchDrawP0KR				;	45
	lda P0Bottom
	sta P0Top			;+6	51
	jmp BackFromSwitchDrawP0KR	;+3	54

WaitDrawP0KR				;	47
	SLEEP 4				;+4	51
	jmp BackFromSwitchDrawP0KR	;+3	54

;-----------------------------------------------------------

noUpdateXKR
 ldx #1
 cpy.w P0Top
 JMP retXKR

skipthis
 ldx #1
 jmp goback

RepoKernel			;	22	crosses page boundary
	tya
	and pfheight			;+2	26
	bne noUpdateXKR		;+2	28
        tax
;	dex			;+2	30
	dec pfpixelheight
;	stx Temp		;+3	35
;	SLEEP 3

	cpy P0Top		;+3	42
retXKR
	beq SwitchDrawP0KR	;+2	44
	bpl WaitDrawP0KR	;+2	46
	lda (player0pointer),Y	;+5	51
	sta GRP0		;+3	54	VDEL
BackFromSwitchDrawP0KR
	sec			;+2	56
 


	lda PF2temp1,X
	ldy PF1temp1,X

	ldx SpriteIndex	;+3	 2

	sta PF2			;+7	63

	lda SpriteGfxIndex,x
	sty PF1			;+7	70	too early?
	tax
	lda #0
	sta GRP1		;+5	75	to display player 0
	lda NewSpriteX,X	;+4	 6
 
DivideBy15LoopK				;	 6	(carry set above)
	sbc #15
	bcs DivideBy15LoopK		;+4/5	10/15.../60

	tax				;+2	12/17/...62
	lda FineAdjustTableEnd,X	;+5	17/22/...67

	sta HMP1			;+3	20/25/...70
	sta RESP1			;+3	23/28/33/38/43/48/53/58/63/68/73
	sta WSYNC			;+3	 0	begin line 2
	;sta HMOVE			;+3	 3

	ldx #ENABL
	txs			;+4	25
	ldy RepoLine ; restore y
	cpy bally
	php			;+6	 9	VDEL ball

	cpy missile1y
	php			;+6	15

	cpy missile0y
	php			;+6	21
	

 


;15 cycles
	tya
	and pfheight
 ;eor #1
	and #$FE
	bne skipthis
 tax
 sleep 4
;	sleep 2
goback

	dey
	cpy P0Top			;+3	52
	beq SwitchDrawP0KV	;+2	54
	bpl WaitDrawP0KV		;+2	56
	lda (player0pointer),Y		;+5	61
	sta GRP0			;+3	64	VDEL
BackFromSwitchDrawP0KV

; sleep 3

	lda PF2temp1,X
	sta PF2			;+7	 5
	lda PF1temp1,X
	sta PF1			;+7	74 
 sta HMOVE

	lda #0
	sta GRP1			;+5	10	to display GRP0

	ldx #ENABL
	txs			;+4	 8

	ldx SpriteIndex	;+3	13	restore index into new sprite vars
	;--now, set all new variables and return to main kernel loop


;
	lda SpriteGfxIndex,X	;+4	31
	tax				;+2	33
;



	lda NewNUSIZ,X
	sta NUSIZ1			;+7	20
 sta REFP1
	lda NewCOLUP1,X
	sta COLUP1			;+7	27

;	lda SpriteGfxIndex,X	;+4	31
;	tax				;+2	33
;fuck2
	lda NewSpriteY,X		;+4	46
	sec				;+2	38
	sbc spriteheight,X	;+4	42
	sta P1Bottom		;+3	45

 sleep 6
	lda player1pointerlo,X	;+4	49
	sbc P1Bottom		;+3	52	carry should still be set
	sta P1display		;+3	55
	lda player1pointerhi,X
	sta P1display+1		;+7	62


	cpy bally
	php			;+6	68	VDELed

	cpy missile1y
	php			;+6	74

	cpy missile0y
	php			;+6	 4



; lda SpriteGfxIndex-1,x
; sleep 3
	dec SpriteIndex	;+5	13
; tax
; lda NewSpriteY,x
; sta RepoLine

; 10 cycles below...
	bpl SetNextLine
	lda #255
	jmp SetLastLine
SetNextLine
;	lda NewSpriteY-1,x
	lda.w temp6
SetLastLine
	sta RepoLine	

 tya
 and pfheight
 bne nodec
 dec pfpixelheight
	dey			;+2	30

; 10 cycles 
 

	jmp BackFromRepoKernel	;+3	43

nodec
 sleep 4
 dey
 jmp BackFromRepoKernel

;-------------------------------------------------------------------------


SwitchDrawP0KV				;	69
	lda P0Bottom
	sta P0Top			;+6	75
	jmp BackFromSwitchDrawP0KV	;+3	 2

WaitDrawP0KV				;	71
	SLEEP 4				;+4	75
	jmp BackFromSwitchDrawP0KV	;+3	 2

;-------------------------------------------------------------------------

DoneWithKernel

BottomOfKernelLoop

	sta WSYNC
 ldx stack1
 txs
 jsr sixdigscore ; set up score


 sta WSYNC
 ldx #0
 sta HMCLR
                STx GRP0
                STx GRP1 ; seems to be needed because of vdel

                LDY #7
        STy VDELP0
        STy VDELP1
        LDA #$10
        STA HMP1
               LDA scorecolor 
                STA COLUP0
                STA COLUP1
 
        LDA #$03
        STA NUSIZ0
        STA NUSIZ1

                STA RESP0
                STA RESP1

 sleep 9
 lda  (scorepointers),y
 sta  GRP0
 ifconst pfscore
 lda pfscorecolor
 sta COLUPF
 else
 sleep 6
 endif

                STA HMOVE
 lda  (scorepointers+8),y
; sta WSYNC
 ;sleep 2
 jmp beginscore


loop2
 lda  (scorepointers),y     ;+5  68  204
 sta  GRP0            ;+3  71  213      D1     --      --     --
 ifconst pfscore
 lda.w pfscore1
 sta PF1
 else
 sleep 7
 endif
 ; cycle 0
 lda  (scorepointers+$8),y  ;+5   5   15
beginscore
 sta  GRP1            ;+3   8   24      D1     D1      D2     --
 lda  (scorepointers+$6),y  ;+5  13   39
 sta  GRP0            ;+3  16   48      D3     D1      D2     D2
 lax  (scorepointers+$2),y  ;+5  29   87
 txs
 lax  (scorepointers+$4),y  ;+5  36  108
 sleep 3
 ifconst pfscore
 lda pfscore2
 sta PF1
 else
 sleep 6
 endif
 lda  (scorepointers+$A),y  ;+5  21   63
 stx  GRP1            ;+3  44  132      D3     D3      D4     D2!
 tsx
 stx  GRP0            ;+3  47  141      D5     D3!     D4     D4
 sta  GRP1            ;+3  50  150      D5     D5      D6     D4!
 sty  GRP0            ;+3  53  159      D4*    D5!     D6     D6
 dey
 bpl  loop2           ;+2  60  180
 	ldx stack1
	txs


; lda scorepointers+1
 ldy temp1
; sta temp1
 sty scorepointers+1

                LDA #0   
               STA GRP0
                STA GRP1
 sta PF1 
       STA VDELP0
        STA VDELP1;do we need these
        STA NUSIZ0
        STA NUSIZ1

; lda scorepointers+3
 ldy temp3
; sta temp3
 sty scorepointers+3

; lda scorepointers+5
 ldy temp5
; sta temp5
 sty scorepointers+5


;-------------------------------------------------------------------------
;------------------------Overscan Routine---------------------------------
;-------------------------------------------------------------------------

OverscanRoutine



skipscore
	lda #2
	sta WSYNC
	sta VBLANK	;turn on VBLANK


	


;-------------------------------------------------------------------------
;----------------------------End Main Routines----------------------------
;-------------------------------------------------------------------------


;*************************************************************************

;-------------------------------------------------------------------------
;----------------------Begin Subroutines----------------------------------
;-------------------------------------------------------------------------




KernelCleanupSubroutine

	ldx #4
AdjustYValuesDownLoop
	lda NewSpriteY,X
	sec
	sbc #2
	sta NewSpriteY,X
	dex
	bpl AdjustYValuesDownLoop


 RETURN
	;rts

SetupP1Subroutine
; flickersort algorithm
; count 4-0
; table2=table1 (?)
; detect overlap of sprites in table 2
; if overlap, do regular sort in table2, then place one sprite at top of table 1, decrement # displayed
; if no overlap, do regular sort in table 2 and table 1
fsstart
 ldx #255
copytable
 inx
 lda spritesort,x
 sta SpriteGfxIndex,x
 cpx #4
 bne copytable

 stx temp3 ; highest displayed sprite
 dex
 stx temp2
sortloop
 ldx temp2
 lda spritesort,x
 tax
 lda NewSpriteY,x
 sta temp1

 ldx temp2
 lda spritesort+1,x
 tax
 lda NewSpriteY,x
 sec
 clc
 sbc temp1
 bcc largerXislower

; larger x is higher (A>=temp1)
 cmp spriteheight,x
 bcs countdown
; overlap with x+1>x
; 
; stick x at end of gfxtable, dec counter
overlapping
 dec temp3
 ldx temp2
; inx
 jsr shiftnumbers
 jmp skipswapGfxtable

largerXislower ; (temp1>A)
 tay
 ldx temp2
 lda spritesort,x
 tax
 tya
 eor #$FF
 sbc #1
 bcc overlapping
 cmp spriteheight,x
 bcs notoverlapping

 dec temp3
 ldx temp2
; inx
 jsr shiftnumbers
 jmp skipswapGfxtable 
notoverlapping
; ldx temp2 ; swap display table
; ldy SpriteGfxIndex+1,x
; lda SpriteGfxIndex,x
; sty SpriteGfxIndex,x
; sta SpriteGfxIndex+1,x 

skipswapGfxtable
 ldx temp2 ; swap sort table
 ldy spritesort+1,x
 lda spritesort,x
 sty spritesort,x
 sta spritesort+1,x 

countdown
 dec temp2
 bpl sortloop

checktoohigh
 ldx temp3
 lda SpriteGfxIndex,x
 tax
 lda NewSpriteY,x
 ifconst screenheight
 cmp #screenheight-3
 else
 cmp #$55
 endif
 bcc nonetoohigh
 dec temp3
 bne checktoohigh

nonetoohigh
 rts


shiftnumbers
 ; stick current x at end, shift others down
 ; if x=4: don't do anything
 ; if x=3: swap 3 and 4
 ; if x=2: 2=3, 3=4, 4=2
 ; if x=1: 1=2, 2=3, 3=4, 4=1
 ; if x=0: 0=1, 1=2, 2=3, 3=4, 4=0
; ldy SpriteGfxIndex,x
swaploop
 cpx #4
 beq shiftdone 
 lda SpriteGfxIndex+1,x
 sta SpriteGfxIndex,x
 inx
 jmp swaploop
shiftdone
; sty SpriteGfxIndex,x
 rts

 ifconst debugscore
debugcycles
   ldx #14
   lda INTIM ; display # cycles left in the score

 ifconst mincycles
 lda mincycles 
 cmp INTIM
 lda mincycles
 bcc nochange
 lda INTIM
 sta mincycles
nochange
 endif

;   cmp #$2B
;   bcs no_cycles_left
   bmi cycles_left
   ldx #64
   eor #$ff ;make negative
cycles_left
   stx scorecolor
   and #$7f ; clear sign bit
   tax
   lda scorebcd,x
   sta score+2
   lda scorebcd1,x
   sta score+1
   rts
scorebcd
 .byte $00, $64, $28, $92, $56, $20, $84, $48, $12, $76, $40
 .byte $04, $68, $32, $96, $60, $24, $88, $52, $16, $80, $44
 .byte $08, $72, $36, $00, $64, $28, $92, $56, $20, $84, $48
 .byte $12, $76, $40, $04, $68, $32, $96, $60, $24, $88
scorebcd1
 .byte 0, 0, 1, 1, 2, 3, 3, 4, 5, 5, 6
 .byte 7, 7, 8, 8, 9, $10, $10, $11, $12, $12, $13
 .byte $14, $14, $15, $16, $16, $17, $17, $18, $19, $19, $20
 .byte $21, $21, $22, $23, $23, $24, $24, $25, $26, $26
 endif
start
 sei
 cld
 ldy #0
 lda $D0
 cmp #$2C               ;check RAM location #1
 bne MachineIs2600
 lda $D1
 cmp #$A9               ;check RAM location #2
 bne MachineIs2600
 dey
MachineIs2600
 ldx #0
 txa
clearmem
 inx
 txs
 pha
 bne clearmem
 sty temp1
 ifnconst multisprite
 ifconst pfrowheight
 lda #pfrowheight
 else
 ifconst pfres
 lda #(96/pfres)
 else
 lda #8
 endif
 endif
 sta playfieldpos
 endif
 ldx #5
initscore
 lda #<scoretable
 sta scorepointers,x 
 dex
 bpl initscore
 lda #1
 sta CTRLPF
 ora INTIM
 sta rand

 ifconst multisprite
   jsr multisprite_setup
 endif

 ifnconst bankswitch
   jmp game
 else
   lda #>(game-1)
   pha
   lda #<(game-1)
   pha
   pha
   pha
   ldx #1
   jmp BS_jsr
 endif
;standard routines needed for pretty much all games
; just the random number generator is left - maybe we should remove this asm file altogether?
; repositioning code and score pointer setup moved to overscan
; read switches, joysticks now compiler generated (more efficient)

randomize
	lda rand
	lsr
 ifconst rand16
	rol rand16
 endif
	bcc noeor
	eor #$B4
noeor
	sta rand
 ifconst rand16
	eor rand16
 endif
	RETURN
;bB.asm
; bB.asm file is split here
.
 ; 

.L0256 ;  asm

 include "titlescreen/asm/titlescreen.asm"

.
 ; 

.
 ; 

.L0257 ;  inline 6lives_statusbar.asm
 include 6lives_statusbar.asm
 if (<*) > (<(*+8))
	repeat ($100-<*)
	.byte 0
	repend
	endif
lives__L068
	.byte  %00000000
	.byte  %01100110
	.byte  %01111110
	.byte  %00111100
	.byte  %00111100
	.byte  %00100100
	.byte  %00000000
	.byte  %00000000
 if (<*) > (<(*+7))
	repeat ($100-<*)
	.byte 0
	repend
	endif
 if (<*) < 90
	repeat (90-<*)
	.byte 0
	repend
	endif
playerL069_1
	.byte  %00011000
	.byte  %11111000
	.byte  %11111110
	.byte  %01111110
	.byte  %01111110
	.byte  %11111111
	.byte  %11111111
	.byte  %01111000
 if (<*) > (<(*+7))
	repeat ($100-<*)
	.byte 0
	repend
	endif
 if (<*) < 90
	repeat (90-<*)
	.byte 0
	repend
	endif
playerL070_3
	.byte  %00011000
	.byte  %11111000
	.byte  %11111110
	.byte  %01111110
	.byte  %01111110
	.byte  %11111111
	.byte  %11111111
	.byte  %01111000
 if (<*) > (<(*+8))
	repeat ($100-<*)
	.byte 0
	repend
	endif
 if (<*) < 90
	repeat (90-<*)
	.byte 0
	repend
	endif
player36then_0
	.byte 0
	.byte  %00000000 
	.byte  %01100110
	.byte  %01111110
	.byte  %00111100
	.byte  %00100100
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
 if (<*) > (<(*+8))
	repeat ($100-<*)
	.byte 0
	repend
	endif
 if (<*) < 90
	repeat (90-<*)
	.byte 0
	repend
	endif
player37then_0
	.byte 0
	.byte  %00000000
	.byte  %00000000 
	.byte  %00100100
	.byte  %00111100
	.byte  %01111110
	.byte  %01100110
	.byte  %00000000
	.byte  %00000000
 if (<*) > (<(*+7))
	repeat ($100-<*)
	.byte 0
	repend
	endif
 if (<*) < 90
	repeat (90-<*)
	.byte 0
	repend
	endif
player38then_2
	.byte  %11000011
	.byte  %01011010
	.byte  %01111110
	.byte  %00100100
	.byte  %00100100
	.byte  %01111110
	.byte  %01011010
	.byte  %11000011
 if (<*) > (<(*+7))
	repeat ($100-<*)
	.byte 0
	repend
	endif
 if (<*) < 90
	repeat (90-<*)
	.byte 0
	repend
	endif
player39then_2
	.byte  %01100110
	.byte  %01011010
	.byte  %01111110
	.byte  %00100100
	.byte  %00100100
	.byte  %01111110
	.byte  %01011010
	.byte  %01100110
 if (<*) > (<(*+7))
	repeat ($100-<*)
	.byte 0
	repend
	endif
 if (<*) < 90
	repeat (90-<*)
	.byte 0
	repend
	endif
player40then_2
	.byte   %01111000
	.byte   %11111111
	.byte   %11111111
	.byte   %01111110
	.byte   %01111110
	.byte   %11111110
	.byte   %11111000
	.byte   %00011000
 if (<*) > (<(*+7))
	repeat ($100-<*)
	.byte 0
	repend
	endif
 if (<*) < 90
	repeat (90-<*)
	.byte 0
	repend
	endif
player41then_4
	.byte  %10000001
	.byte  %01000010
	.byte  %01111110
	.byte  %01011010
	.byte  %01011010
	.byte  %01111110
	.byte  %01000010
	.byte  %10000001
 if (<*) > (<(*+7))
	repeat ($100-<*)
	.byte 0
	repend
	endif
 if (<*) < 90
	repeat (90-<*)
	.byte 0
	repend
	endif
player42then_4
	.byte  %01000010
	.byte  %01000010
	.byte  %01111110
	.byte  %01011010
	.byte  %01011010
	.byte  %01111110
	.byte  %01000010
	.byte  %01000010
 if (<*) > (<(*+7))
	repeat ($100-<*)
	.byte 0
	repend
	endif
 if (<*) < 90
	repeat (90-<*)
	.byte 0
	repend
	endif
player43then_5
	.byte  %10010001
	.byte  %01011010
	.byte  %00100100
	.byte  %11011011
	.byte  %01011010
	.byte  %00100100
	.byte  %01011010
	.byte  %10001001
 if (<*) > (<(*+7))
	repeat ($100-<*)
	.byte 0
	repend
	endif
 if (<*) < 90
	repeat (90-<*)
	.byte 0
	repend
	endif
player44then_5
	.byte  %10010001
	.byte  %01011010
	.byte  %00100100
	.byte  %01000010
	.byte  %01000011
	.byte  %00100100
	.byte  %01011010
	.byte  %10001001
 if (<*) > (<(*+7))
	repeat ($100-<*)
	.byte 0
	repend
	endif
 if (<*) < 90
	repeat (90-<*)
	.byte 0
	repend
	endif
player45then_5
	.byte  %10010001
	.byte  %01011010
	.byte  %00100100
	.byte  %11011011
	.byte  %01011010
	.byte  %00100100
	.byte  %01011010
	.byte  %10001001
 if ((>(*+11)) > (>*))
 ALIGN 256
 endif
PF1_data0
 .byte %10000000
 .byte %10000000
 .byte %10000000
 .byte %10000000
 .byte %10000000
 .byte %11111111
 .byte %10000000
 .byte %10000000
 .byte %10000000
 .byte %10000000
 .byte %10000000
 if ((>(*+11)) > (>*))
 ALIGN 256
 endif
PF2_data0
 .byte %00000000
 .byte %00000000
 .byte %00000000
 .byte %00000000
 .byte %00000000
 .byte %11111111
 .byte %00000000
 .byte %00000000
 .byte %00000000
 .byte %00000000
 .byte %00000000
 if ECHOFIRST
       echo "    ",[(scoretable - *)]d , "bytes of ROM space left in bank 2")
 endif 
ECHOFIRST = 1
 
 
; feel free to modify the score graphics - just keep each digit 8 high
; and keep the conditional compilation stuff intact
 ifconst ROM2k
   ORG $F7AC-8
 else
   ifconst bankswitch
     if bankswitch == 8
       ORG $2F94-bscode_length
       RORG $FF94-bscode_length
     endif
     if bankswitch == 16
       ORG $4F94-bscode_length
       RORG $FF94-bscode_length
     endif
     if bankswitch == 32
       ORG $8F94-bscode_length
       RORG $FF94-bscode_length
     endif
     if bankswitch == 64
       ORG  $10F80-bscode_length
       RORG $1FF80-bscode_length
     endif
   else
     ORG $FF9C
   endif
 endif

; font equates
.21stcentury = 1
alarmclock = 2     
handwritten = 3    
interrupted = 4    
retroputer = 5    
whimsey = 6
tiny = 7

scoretable

 ifconst font
  if font == .21stcentury
    include "score_graphics.asm.21stcentury"
  endif
  if font == alarmclock
    include "score_graphics.asm.alarmclock"
  endif
  if font == handwritten
    include "score_graphics.asm.handwritten"
  endif
  if font == interrupted
    include "score_graphics.asm.interrupted"
  endif
  if font == retroputer
    include "score_graphics.asm.retroputer"
  endif
  if font == whimsey
    include "score_graphics.asm.whimsey"
  endif
  if font == tiny
    include "score_graphics.asm.tiny"
  endif
 else ; default font

       .byte %00111100
       .byte %01100110
       .byte %01100110
       .byte %01100110
       .byte %01100110
       .byte %01100110
       .byte %01100110
       .byte %00111100

       .byte %01111110
       .byte %00011000
       .byte %00011000
       .byte %00011000
       .byte %00011000
       .byte %00111000
       .byte %00011000
       .byte %00001000

       .byte %01111110
       .byte %01100000
       .byte %01100000
       .byte %00111100
       .byte %00000110
       .byte %00000110
       .byte %01000110
       .byte %00111100

       .byte %00111100
       .byte %01000110
       .byte %00000110
       .byte %00000110
       .byte %00011100
       .byte %00000110
       .byte %01000110
       .byte %00111100

       .byte %00001100
       .byte %00001100
       .byte %01111110
       .byte %01001100
       .byte %01001100
       .byte %00101100
       .byte %00011100
       .byte %00001100

       .byte %00111100
       .byte %01000110
       .byte %00000110
       .byte %00000110
       .byte %00111100
       .byte %01100000
       .byte %01100000
       .byte %01111110

       .byte %00111100
       .byte %01100110
       .byte %01100110
       .byte %01100110
       .byte %01111100
       .byte %01100000
       .byte %01100010
       .byte %00111100

       .byte %00110000
       .byte %00110000
       .byte %00110000
       .byte %00011000
       .byte %00001100
       .byte %00000110
       .byte %01000010
       .byte %00111110

       .byte %00111100
       .byte %01100110
       .byte %01100110
       .byte %01100110
       .byte %00111100
       .byte %01100110
       .byte %01100110
       .byte %00111100

       .byte %00111100
       .byte %01000110
       .byte %00000110
       .byte %00111110
       .byte %01100110
       .byte %01100110
       .byte %01100110
       .byte %00111100 

       ifnconst DPC_kernel_options
 
         .byte %00000000
         .byte %00000000
         .byte %00000000
         .byte %00000000
         .byte %00000000
         .byte %00000000
         .byte %00000000
         .byte %00000000 

       endif

 endif

 ifconst ROM2k
   ORG $F7FC
 else
   ifconst bankswitch
     if bankswitch == 8
       ORG $2FF4-bscode_length
       RORG $FFF4-bscode_length
     endif
     if bankswitch == 16
       ORG $4FF4-bscode_length
       RORG $FFF4-bscode_length
     endif
     if bankswitch == 32
       ORG $8FF4-bscode_length
       RORG $FFF4-bscode_length
     endif
     if bankswitch == 64
       ORG  $10FE0-bscode_length
       RORG $1FFE0-bscode_length
     endif
   else
     ORG $FFFC
   endif
 endif
; every bank has this stuff at the same place
; this code can switch to/from any bank at any entry point
; and can preserve register values
; note: lines not starting with a space are not placed in all banks
;
; line below tells the compiler how long this is - do not remove
;size=32

begin_bscode
 ldx #$ff
 ifconst FASTFETCH ; using DPC+
 stx FASTFETCH
 endif 
 txs
 if bankswitch == 64
   lda #(((>(start-1)) & $0F) | $F0)
 else
   lda #>(start-1)
 endif
 pha
 lda #<(start-1)
 pha

BS_return
 pha
 txa
 pha
 tsx

 if bankswitch != 64
   lda 4,x ; get high byte of return address

   rol
   rol
   rol
   rol
   and #bs_mask ;1 3 or 7 for F8/F6/F4
   tax
   inx
 else
   lda 4,x ; get high byte of return address
   tay
   ora #$10 ; change our bank nibble into a valid rom mirror
   sta 4,x
   tya
   lsr 
   lsr 
   lsr 
   lsr 
   tax
   inx
 endif

BS_jsr
 lda bankswitch_hotspot-1,x
 pla
 tax
 pla
 rts
 if ((* & $1FFF) > ((bankswitch_hotspot & $1FFF) - 1))
   echo "WARNING: size parameter in banksw.asm too small - the program probably will not work."
   echo "Change to",[(*-begin_bscode+1)&$FF]d,"and try again."
 endif
 ifconst bankswitch
   if bankswitch == 8
     ORG $2FFC
     RORG $FFFC
   endif
   if bankswitch == 16
     ORG $4FFC
     RORG $FFFC
   endif
   if bankswitch == 32
     ORG $8FFC
     RORG $FFFC
   endif
   if bankswitch == 64
     ORG  $10FF0
     RORG $1FFF0
     lda $ffe0 ; we use wasted space to assist stella with EF format auto-detection
     ORG  $10FF8
     RORG $1FFF8
     ifconst superchip 
       .byte "E","F","S","C"
     else
       .byte "E","F","E","F"
     endif
     ORG  $10FFC
     RORG $1FFFC
   endif
 else
   ifconst ROM2k
     ORG $F7FC
   else
     ORG $FFFC
   endif
 endif
 .word start
 .word start
