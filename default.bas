
 rem Generated 22/10/2018 21:47:13 by Visual bB Version 1.0.0.568
 rem **********************************
 rem *Horizon Shift                   *
 rem *<description>                   *
 rem *<author>                        *
 rem *<contact info>                  *
 rem *<license>                       *
 rem ********************************** 
 includesfile multisprite_superchip.inc
 set kernel multisprite
 set romsize 8k

 pfheight=7 

 playfield:
 ...............XX...............
 ...............XX...............
 ...............XX...............
 ...............XX...............
 ...............XX...............
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 ...............XX...............
 ...............XX...............
 ...............XX...............
 ...............XX...............
 ...............XX...............
end


 COLUBK = $0  
 
 _COLUP1 = $3A 
 COLUP2 = $A4 
 COLUP3 = $A4 
 COLUP4 = $76 
 COLUP5 = $2E

  
 lifecolor = $aa
;**************************
;      Sprite setups      *
;**************************
 player0x=66
 player0y=57

 player1x=76
 player1y=99 

 player2x=86
 player2y=100

 player3x=96
 player3y=100

 player4x=106
 player4y=100

 player5x=100
 player5y= 200
 missile0y=255

;enemy bullet
 missile1y=200
 missile1x=50



;**************************
;        Declarations     *
;**************************


 dim asteroidY = player1y.b 
 dim asteroid2Y = player2y.c
 dim asteroid3Y = player3y.d
 dim asteroid4Y = player4y.e

 dim misx = missile1x.h
 dim misy = missile1y.i

 dim _P0_Luminosity = a.b
 
 dim _sc1 = score
 dim _sc2 = score+1
 dim _sc3 = score+2

 dim _Bit0_Reset_Restrainer = y
 dim _Bit6_Sequence_Switch = y

 dim explosionTicker = f
 dim _resetTicker = x
 dim gameReady = z  
 dim _High_Score1 = t
 dim _High_Score2 = u 
 dim _High_Score3 = s 
 dim  firstFrame = r
 dim switchSprite = p
 
 dim ticker = l
 dim titlescreencolor = $F0


 ;**********************
 ;     Assignments     *
 ;**********************

 _High_Score1 = _sc1
 _High_Score2 = _sc2
 _High_Score3 = _sc3 
 lives = 96
 ticker = 0
 _resetTicker = 0
 switchSprite = 0
 explosionTicker = 0
 scorecolor=$1a
 firstFrame = 0

 NUSIZ0 = 16 

 lives:
 %00000000
 %01100110
 %01111110
 %00111100
 %00111100
 %00100100
 %00000000
 %00000000
end

 player1:
 %00011000
 %11111000
 %11111110
 %01111110
 %01111110
 %11111111
 %11111111
 %01111000
end

 player3:
 %00011000
 %11111000
 %11111110
 %01111110
 %01111110
 %11111111
 %11111111
 %01111000
end

sprites 
 ticker = ticker + 1
 if ticker > 10  then ticker = 0

 
 ;**************************************
 ;     Set random colours on spawn     *
 ;**************************************
 if player1y = 100 || player1y = 0 then goto setPlayer1Color
 if player2y = 100 || player2y = 0 then goto setPlayer2Color
 if player3y = 100 || player4y = 0 then goto setPlayer3Color
 if player4y = 100 || player5y = 0 then goto setPlayer4Color

colorSetComplete

 if player5y < 200 then explosionTicker = explosionTicker + 1
 if explosionTicker > 1 then player5y = 200:explosionTicker = 0: AUDV0 = 0 : AUDC0 = 0 : AUDF0 = 0

 if player4y = 80  && missile1y > 150  then missile1y = player4y: missile1x =  player4x  - 3
 if player4y = 10 && missile1y > 150  then missile1y = player4y: missile1x =  player4x - 3

 if player4y = 70  && missile1y > 150  then missile1y = player4y: missile1x =  player4x  - 3
 if player4y = 20 && missile1y > 150  then missile1y = player4y: missile1x =  player4x - 3

 if missile0y > 30 && missile0y < 60 then AUDV1 = 2 : AUDC1 = 12 : AUDF1 = 7 else AUDV1 = 0 : AUDC1 = 0: AUDF0 = 0

 if collision(missile1, player0) then goto gameOver
 
 if missile1y < 45  then misy = misy + 0.4
 if missile1y > 45 && misy < 150 && _resetTicker = 0  then misy = misy -0.4
 
 

titlepage
 if joy0fire || switchreset then gameReady = 1 
 if gameReady = 1 then  COLUBK = $0 : goto gamestart 
 gosub titledrawscreen bank2
 _sc1  = 0
 _sc2  = 0
 _sc3  = 0
 _sc1 = _High_Score1
 _sc2 = _High_Score2
 _sc3 = _High_Score3
 
 goto titlepage

gamestart
   if firstFrame = 0 then _sc1  = 0: _sc2 = 0: _sc3 = 0: firstFrame = 1


   if _sc1 > _High_Score1 then goto __New_High_Score
   if _sc1 < _High_Score1 then goto __Skip_High_Score
   if _sc2 > _High_Score2 then goto __New_High_Score
   if _sc2 < _High_Score2 then goto __Skip_High_Score

   if _sc3 > _High_Score3 then goto __New_High_Score
   if _sc3 < _High_Score3 then goto __Skip_High_Score

   goto __Skip_High_Score


__New_High_Score

   _High_Score1 = _sc1 : _High_Score2 = _sc2 : _High_Score3 = _sc3
__Skip_High_Score



 if player0y > 50 then player0:
 %00000000 
 %01100110
 %01111110
 %00111100
 %00100100
 %00000000
 %00000000
 %00000000
end

 if player0y < 50 then player0:
 %00000000
 %00000000 
 %00100100
 %00111100
 %01111110
 %01100110
 %00000000
 %00000000
end


 if ticker < 5 then player2:
 %11000011
 %01011010
 %01111110
 %00100100
 %00100100
 %01111110
 %01011010
 %11000011
end

 if  ticker >= 5 then player2:
 %01100110
 %01011010
 %01111110
 %00100100
 %00100100
 %01111110
 %01011010
 %01100110
end


 if switchSprite > 0 then player2:
  %01111000
  %11111111
  %11111111
  %01111110
  %01111110
  %11111110
  %11111000
  %00011000
end


 if ticker < 5 then  player4:
 %10000001
 %01000010
 %01111110
 %01011010
 %01011010
 %01111110
 %01000010
 %10000001
end

 if ticker >= 5 then player4:
 %01000010
 %01000010
 %01111110
 %01011010
 %01011010
 %01111110
 %01000010
 %01000010
end

 if explosionTicker = 1 then player5:
 %10010001
 %01011010
 %00100100
 %11011011
 %01011010
 %00100100
 %01011010
 %10001001
end

 if explosionTicker = 2 then player5:
 %10010001
 %01011010
 %00100100
 %01000010
 %01000011
 %00100100
 %01011010
 %10001001
end

 if explosionTicker = 3 then player5:
 %10010001
 %01011010
 %00100100
 %11011011
 %01011010
 %00100100
 %01011010
 %10001001
end




 ;*************************************
 ;* Check if game over conditions met *
 ;************************************* 
 if player1y > 40 && player1y < 56 then goto gameOver
 if player2y > 40 && player2y < 56 then goto gameOver
 if player3y > 40 && player3y < 56 then goto gameOver
 if player4y > 40 && player4y < 56 then goto gameOver

 if missile1y > 40 && missile1y < 48 then missile1y = 200


 ;Reset bullet if off screen
 if missile0y > 100 then goto skip 
 if missile0y < 0 then goto skip


 ;Move the bullet


 if missile0y < 50 then missile0y = missile0y-2:goto draw_loop 
 if missile0y > 50 then missile0y = missile0y+2:goto draw_loop   


skip
 if joy0fire && player5y > 150 then missile0y = player0y - 4:missile0x = player0x + 5 
draw_loop
 if joy0right && player0x < 134  then player0x = player0x+1
 if joy0left && player0x > 19   then player0x = player0x-1
 if joy0down then player0y = 44
 if joy0up then player0y = 57 
 

 if collision(missile0, player1) then goto collisions
 
 if player1x < 28 || player1x > 141 then player1x = 60
 if player2x < 28 || player2x > 141 then player2x = 60
 if player3x < 28 || player3x > 141 then player3x = 60
 if player4x < 28 || player2x > 141 then player4x = 60


frameReset 


;********************************************
;   Set speed levels and level progression  *
;********************************************

 if _sc3 < 60 && _sc2 < 1 then goto slow 

 if _sc2 < 1 then goto fast


 if asteroidY < 50 then asteroidY = asteroidY + 0.19 
 if asteroidY > 50 then asteroidY = asteroidY - 0.19  

 if asteroid2Y < 50 then asteroid2Y = asteroid2Y + 0.21 
 if asteroid2Y > 50 then asteroid2Y = asteroid2Y - 0.21
 
 if asteroid3Y < 50 then asteroid3Y = asteroid3Y + 0.22 
 if asteroid3Y > 50 then asteroid3Y = asteroid3Y - 0.22 
 
 if asteroid4Y < 50 then asteroid4Y = asteroid4Y + 0.16 
 if asteroid4Y > 50 then asteroid4Y = asteroid4Y - 0.16 

 goto resetScreen

fast
 if asteroidY < 50 then asteroidY = asteroidY + 0.15 
 if asteroidY > 50 then asteroidY = asteroidY - 0.15  

 if asteroid2Y < 50 then asteroid2Y = asteroid2Y + 0.17 
 if asteroid2Y > 50 then asteroid2Y = asteroid2Y - 0.17
 
 if asteroid3Y < 50 then asteroid3Y = asteroid3Y + 0.19 
 if asteroid3Y > 50 then asteroid3Y = asteroid3Y - 0.19 
 
 if asteroid4Y < 50 then asteroid4Y = asteroid4Y + 0.13 
 if asteroid4Y > 50 then asteroid4Y = asteroid4Y - 0.13 
 goto resetScreen


slow
 if asteroidY < 50 then asteroidY = asteroidY + 0.13 
 if asteroidY > 50 then asteroidY = asteroidY - 0.13 

 if asteroid2Y < 50 && _sc3  > $03 then asteroid2Y = asteroid2Y + 0.15 
 if asteroid2Y > 50 && _sc3  > $03 then asteroid2Y = asteroid2Y - 0.15
 
 if asteroid3Y < 50  && _sc3  > $15 then asteroid3Y = asteroid3Y + 0.17 
 if asteroid3Y > 50  && _sc3  > $15 then asteroid3Y = asteroid3Y - 0.17 
 
 if asteroid4Y < 50  && _sc3  > $20 then asteroid4Y = asteroid4Y + 0.1 
 if asteroid4Y > 50  && _sc3  > $20  then asteroid4Y = asteroid4Y - 0.1  


resetScreen

 COLUPF = $40
 drawscreen


 goto sprites

setPlayer1Color
 if ticker = 0 then _COLUP1 = $22
 if ticker = 1 then _COLUP1 = $38
 if ticker = 2 then _COLUP1 = $66
 if ticker = 3 then _COLUP1 = $78
 if ticker = 4 then _COLUP1 = $CA
 if ticker = 5 then _COLUP1 = $D6
 if ticker = 6 then _COLUP1 = $E8
 

 
 goto colorSetComplete

setPlayer2Color
 if ticker = 0 then COLUP2 = $22
 if ticker = 1 then COLUP2 = $38
 if ticker = 2 then COLUP2 = $66
 if ticker = 3 then COLUP2 = $78
 if ticker = 4 then COLUP2 = $CA
 if ticker = 5 then COLUP2 = $D6
 if ticker = 6 then COLUP2 = $E8
 if ticker = 7 then COLUP2 = $3E
 if ticker = 8 then COLUP2 = $DC
 if ticker = 9 then COLUP2 = $48
 if ticker = 10 then COLUP2 = $68
  
 if ticker < 4 then switchSprite = 0
 if ticker >= 4 then switchSprite = 1


 goto colorSetComplete

setPlayer3Color
 if ticker = 0 then COLUP3 = $22
 if ticker = 1 then COLUP3 = $38
 if ticker = 2 then COLUP3 = $66
 if ticker = 3 then COLUP3 = $78
 if ticker = 4 then COLUP3 = $CA
 if ticker = 5 then COLUP3 = $D6
 if ticker = 6 then COLUP3 = $E8
 if ticker = 7 then COLUP3 = $3E
 if ticker = 8 then COLUP3 = $DC
 if ticker = 9 then COLUP3 = $48
 if ticker = 10 then COLUP3 = $68
 goto colorSetComplete

setPlayer4Color
 if ticker = 0 then COLUP4 = $22
 if ticker = 1 then COLUP4 = $38
 if ticker = 2 then COLUP4 = $66
 if ticker = 3 then COLUP4 = $78
 if ticker = 4 then COLUP4 = $CA
 if ticker = 5 then COLUP4 = $D6
 if ticker = 6 then COLUP4 = $E8
 if ticker = 7 then COLUP4 = $3E
 if ticker = 8 then COLUP4 = $DC
 if ticker = 9 then COLUP4 = $48
 if ticker = 10 then COLUP4 = $68
 
 goto colorSetComplete


;*******************************
;* Collision Logic             *
;* playfield size is 28 <> 141 *
;*******************************

collisions
 
 AUDV0 = 12 : AUDC0 = 8 : AUDF0 = 28
 score = score + 1

 ;**********************
 ;* spawn explosion*
 ;**********************

 player5x = missile0x + 4
 player5y = missile0y + 2

 missile0y = 200   

 if missile0x > 27 && missile0x < 37 then player1x = 76: player1y = 100
 if missile0x > 37 && missile0x < 47 then player2x = 86: player2y = 0
 if missile0x > 47 && missile0x < 57 then player3x = 96: player3y = 100
 if missile0x > 57 && missile0x < 67 then player4x = 106: player4y = 0

 if missile0x > 67 && missile0x < 77 then  player1x = 116: player1y = 0
 if missile0x > 77 && missile0x < 87 then player2x = 126: player2y = 100
 if missile0x > 87 && missile0x < 97 then player3x = 136: player3y = 0
 if missile0x > 97 && missile0x < 107 then player4x = 66: player4y = 100

 if missile0x > 107 && missile0x < 117 then player1x = 36: player1y = 100
 if missile0x > 117 && missile0x < 127 then  player2x = 46: player2y = 100
 if missile0x > 127 && missile0x < 137 then player3x = 56: player3y = 0
 if missile0x > 137 && missile0x < 147 then player4x = 66: player4y = 0

 goto frameReset

gameOver
 if !_Bit6_Sequence_Switch{6} then _P0_Luminosity = _P0_Luminosity + 1 : if _P0_Luminosity >= $20 then _Bit6_Sequence_Switch{6} = 1: _resetTicker = _resetTicker + 1 
 if _Bit6_Sequence_Switch{6} then _P0_Luminosity = _P0_Luminosity - 1 : if _P0_Luminosity <= $12 then _P0_Luminosity = $10 : _Bit6_Sequence_Switch{6} = 0
 AUDV1 = 10 : AUDC1 = 8 : AUDF1 = 25
 COLUBK = _P0_Luminosity 

 if _resetTicker > 3 then goto resetGame

 goto resetScreen

resetGame
 player0x=66
 player0y=57

 player1x=76
 player1y=0 

 player2x=86
 player2y=110

 player3x=96
 player3y=120

 player4x=106
 player4y= 100

 missile0y=255
 missile0y=255

 _resetTicker = 0 
 missile1y= 200
 COLUBK = $20 
 AUDV1 = 0 : AUDC1 = 0 : AUDF1 = 0
 lives = lives - 32 

 if lives < 32 then gameReady = 0: firstFrame = 0: lives = lives + 96


 goto resetScreen    


 bank 2
 
 asm
 include "titlescreen/asm/titlescreen.asm"
end


 inline 6lives_statusbar.asm