
 include "titlescreen/asm/layoutmacros.asm"
 include "titlescreen/titlescreen_layout.asm"

.titledrawscreen
title_eat_overscan
 	;bB runs in overscan. Wait for the overscan to run out...
	clc
	lda INTIM
	bmi title_eat_overscan
	jmp title_do_vertical_sync

title_do_vertical_sync
	lda #2
	sta WSYNC ;one line with VSYNC
	sta VSYNC ;enable VSYNC
	sta WSYNC ;one line with VSYNC
	sta WSYNC ;one line with VSYNC
	lda #0
	sta WSYNC ;one line with VSYNC
	sta VSYNC ;turn off VSYNC

        ;lda #42+128
	ifnconst vblank_time
 	lda #42+128
 	else
 	lda #vblank_time+128
 	endif

	sta TIM64T

titleframe = missile0x
        inc titleframe ; increment the frame counter

	#ifconst .title_vblank
	jsr .title_vblank
	#endif

title_vblank_loop
	lda INTIM
	bmi title_vblank_loop
	lda #0
	sta WSYNC
	sta VBLANK
	sta ENAM0
	sta ENABL

title_playfield

; ======== BEGIN of the custom kernel!!!!! All of the work is done in the playfield.

        lda #230
        sta TIM64T

	lda #1
	sta CTRLPF
	clc

	lda #0
	sta WSYNC
	lda titlescreencolor
	sta COLUBK

	titlescreenlayout

	jmp PFWAIT ; kernel is done. Finish off the screen

 include "titlescreen/titlescreen_color.asm"

	#ifconst mk_48x1_on
	include "titlescreen/asm/48x1_kernel.asm"
	#endif ;mk_48x1_on

	#ifconst mk_48x1_1_on
	include "titlescreen/asm/48x1_1_kernel.asm"
	#endif ;mk_48x1_1_on

	#ifconst mk_48x1_2_on
	include "titlescreen/asm/48x1_2_kernel.asm"
	#endif ;mk_48x1_2_on

	#ifconst mk_48x1_3_on
	include "titlescreen/asm/48x1_3_kernel.asm"
	#endif ;mk_48x1_3_on

	#ifconst mk_48x2_1_on
	include "titlescreen/asm/48x2_1_kernel.asm"
	#endif ;mk_48x2_1_on

	#ifconst mk_48x2_2_on
	include "titlescreen/asm/48x2_2_kernel.asm"
	#endif ;mk_48x2_2_on

	#ifconst mk_48x2_3_on
	include "titlescreen/asm/48x2_3_kernel.asm"
	#endif ;mk_48x2_3_on

	#ifconst mk_96x2_1_on
	include "titlescreen/asm/96x2_1_kernel.asm"
	#endif ;mk_96x2_1_on

	#ifconst mk_96x2_2_on
	include "titlescreen/asm/96x2_2_kernel.asm"
	#endif ;mk_96x2_2_on

	#ifconst mk_96x2_3_on
	include "titlescreen/asm/96x2_3_kernel.asm"
	#endif ;mk_96x2_3_on

	#ifconst mk_score_on
	include "titlescreen/asm/score_kernel.asm"
	#endif ;mk_score_on

	#ifconst mk_gameselect_on
	include "titlescreen/asm/gameselect_kernel.asm"
	#endif ;mk_gameselect_on

PFWAIT
        lda INTIM 
        bne PFWAIT

OVERSCAN
	;lda #35+128 

 	ifnconst overscan_time
 	lda #35+128
 	else
 	lda #overscan_time+128-3-1
 	endif


	sta TIM64T
	lda #%11000010
	sta WSYNC
	sta VBLANK
	RETURN

 #ifconst mk_48x1_1_on
	include "titlescreen/48x1_1_image.asm"
 #endif
 #ifconst mk_48x1_2_on
	include "titlescreen/48x1_2_image.asm"
 #endif
 #ifconst mk_48x1_3_on
	include "titlescreen/48x1_3_image.asm"
 #endif

 #ifconst mk_48x2_1_on
	include "titlescreen/48x2_1_image.asm"
 #endif
 #ifconst mk_48x2_2_on
	include "titlescreen/48x2_2_image.asm"
 #endif
 #ifconst mk_48x2_3_on
	include "titlescreen/48x2_3_image.asm"
 #endif

 #ifconst mk_96x2_1_on
	include "titlescreen/96x2_1_image.asm"
 #endif
 #ifconst mk_96x2_2_on
	include "titlescreen/96x2_2_image.asm"
 #endif
 #ifconst mk_96x2_3_on
	include "titlescreen/96x2_3_image.asm"
 #endif

 #ifconst mk_score_on
	include "titlescreen/score_image.asm"
 #endif

 #ifconst mk_gameselect_on
	include "titlescreen/gameselect_image.asm"
 #endif

