!cpu 6510
!to "balls.prg",cbm
;designed by keyvan mehrbakhsh 2023
;keyvanmehrbakhsh@gmail.com
;its free to alter 
 
lastkey=$21
position = $20
 
attdec   =$31
susrel   =$32
volume   =$33
hifreq   =$34
lofreq   =$35
wavefm   =$36
whiteblock =$37
appleblock =$38
positionh =$49
positionl =$46
character =$4006
character1 =$4007
character2 =$4008
character3 =$4009
fourty = $6387
bgchar =$022
bgcolor =$024
charactertemporary = $026
charactercolour = $27
wallschar = $6677
wallscolour = $89
objectschar2 = $6689
objectschar3 = $6643
objectschar4 = $6699
bulletchar =$6634
oppbulletchar =$6635
opposebulletposl = $6249
opposebulletposl2 = $6252
opposebulletposh = $6250
opposebulletposh2 = $6253
opposebulletcolor = $47
wallspositionh = $29
wallspositionl = $30
bulletpositionh = $6848
bulletpositionl = $6248
scoreones =$40ff
scoretens =$40fe
voicefreq = $31
scorehunds = $40fd
scorethous = $40fa 
bulletcolor = $2055
shuf = $6c00
increment = $6896
increment2 = $6897
currentcell = $03
scrollvalue = $37
scrolltrigger = $38
positionlbuffer = $39
positionlbuffer2 = $40
db = $3400
db2 = $3500
db3 = $3600
db4 = $3700 
reversetrigger = $42
joysttrig = $43
bullettrigger = $44
joystktr= $45
joystktl= $41
joystktd= $40
joystktu= $55
lookoutbit = $77
colorshadow = $78
movementno = $79
movementno2 = $72
movementno3 = $96
movementno4 = $97
deathlighttemp = $98
*=$0801
        !byte    $1E, $08, $0A, $00, $9E, $20, $28,$32, $30, $38, $30, $29, $3a, $8f, $20, $28, $43, $29, $20, $32, $30, $32, $31, $20, $4D, $54, $53, $56, $00, $00, $00
 
*=$820
              

lda $01    
and #251    
sta $01    
 
copyoriginalchartonewlocation
 
sei
lda $d000,x
sta $2000,x
lda $d100,x
sta $2100,x
lda $d200,x
sta $2200,x
lda $d300,x
sta $2300,x
lda $d400,x
sta $2400,x
lda $d500,x
sta $2500,x
lda $d600,x
sta $2600,x
lda $d700,x
sta $2700,x
         

 
 

 
inx
 
 
beq stopcpy
jmp copyoriginalchartonewlocation
 
stopcpy  
         lda $01
         ora #4
         sta $01

      
lda #255
sta $2260 
lda #255
sta $2261 
lda #255
sta $2262 
lda #255
sta $2263  
lda #255
sta $2264 
lda #255
sta $2265  
lda #255
sta $2266 
lda #255
sta $2267        

jsr PLAYSOUND

init 
lda #44
sta positionl
ldx #0
ldy #0
  
lda #128
sta oppbulletchar
lda #0
 
sta $d021
lda #40
sta reversetrigger
 
sta shuf
lda #$03
sta positionh
lda #39
sta movementno
lda #0
sta movementno2
lda #0
sta movementno3
lda #87
sta character
lda #79

sta character1
lda #78
sta character2
lda #80
sta character3
lda #0
sta $d020
sta increment
sta increment2
 lda #2
 sta opposebulletcolor
lda #03
sta charactercolour
lda #0
sta joysttrig
sta bullettrigger
lda #0
sta scoreones
sta scoretens 
sta scorehunds
sta scorethous
lda #$18
sta $d018
 lda #01
 sta wallspositionh
lda positionl
 sta bulletpositionl
 
  lda positionh
 sta bulletpositionh
     lda #01
 sta opposebulletposl
  lda #$01
 sta opposebulletposh
     lda #$01
 sta opposebulletposl2
  lda #$01
 sta opposebulletposh2
 
 lda #76
sta bgchar 
lda #2
sta bgcolor 
lda #123
sta wallschar
lda #82
sta objectschar2
lda #84
sta objectschar3
lda #83
sta objectschar4
lda #85
sta bulletchar 
lda #6
sta bulletcolor
lda #2
sta wallscolour
ldx #0
 
startscreen

jsr cls
ldy #0

startscreenloop


lda startuptext,y
 
iny
sta $0550,y
lda #3
sta $d950,y
cpy #$4
bne startscreenloop 
ldy #0
startscreenloop2 

lda startuptext2,y
iny
sta $0750,y
lda #3
sta $db50,y
cpy #$16
bne startscreenloop2   
lda $dc00
cmp #$6f
bne startscreen
cmp #$6f
beq copyboxcharacter 
rts

copyboxcharacter 
ldy #0
copyboxcharacterloop
lda bulletchardata,y
sta $22a8,y

 
lda bulletchardata,y
sta $22a8,y
lda oppbulletchardata,y
sta $22b0,y
lda sidebulletchardata,y
sta $22b8,y
iny
cpy #8
 
bne copyboxcharacterloop
 
ldy #0
ldx #0
showboarderslp
lda #32
sta $3400,x
sta $3500,x
sta $3600,x
sta $3700,x
inx
cpx #255
bne showboarderslp
 

mainloop
ldx #0
  ldy #0
 

 jsr display
  jsr displayoppbullet2


wastetime
;  jsr showingbits
 

jsr ballmovement


 jsr ballmovement2
 
 jsr ballmovement3
 
 jsr ballmovement4
 

 
   jsr displayoppbullet2


 
 

afterresetcolor
lda #1
sta opposebulletcolor
 jsr displaycolors
   jsr dojoy
 jsr movejoy


 inc increment
 jsr boarders

 ; jsr timer
    jsr collisionlights



ldx #0

   
   jsr boardershor
jsr outlet

jsr boardersvert
 
jsr displaycolorcolumn
jsr showboarders

 





 jsr printscore
 

 

jmp mainloop

rts


outlet

 ldx increment2
 
lda #198
sta $3450,x

sta $3770,x
 
sta $3451,x
sta $3771,x
sta $3452,x
sta $3772,x
sta $344f,x
sta $376f,x
sta $344e,x
sta $376e,x
 sta $344d,x
sta $376d,x
 
 
lda #3
sta $d850,x

sta $db70,x
 
sta $d851,x
sta $db71,x
sta $d852,x
sta $db72,x
sta $d84f,x
sta $db6f,x
 sta $d84e,x
sta $db6e,x
 
  sta $d84d,x
sta $db6d,x
 
 
rts

timer
ldy #0
ldx #0
timerloop1

 

jsr timerloop2
inx
cpx #5
bne timerloop1
rts
timerloop2
ldy #0
timerloop2loop
iny
 
 
cpy #255
bne timerloop2loop

rts
bulletchars 
 
ldx oppbulletchar

cpx #255

beq bulletcharreset
ldx opposebulletcolor
cpx #0
;beq bulletcolorreset


rts
bulletcharreset
lda #200
sta oppbulletchar
rts
bulletcolorreset
lda #3
sta opposebulletcolor
rts

  
 
 
 
 
scrolling


lda scrolltrigger
cmp #0
beq somelinedown
lda scrollvalue


adc #26

sta scrollvalue
somelinedown

lda scrollvalue
sbc positionlbuffer
sta scrollvalue
rts

cls
 
 

 

 
 rts
 

checkscoreones

 lda scoreones
 cmp #0
 beq loadwallsbrid
 
 
rts
loadwallsbrid
 
rts
storekey 
 

  
    
 
rts
 
 


reloadposition

lda positionh
sta bulletpositionh
 
rts

decrbulletpositionh


lda bulletpositionh
cmp #0
beq putbulletback

dec bulletpositionh
 

 
rts
putbulletback
lda #0
sta bullettrigger
lda positionl
sta bulletpositionl
rts 
displaybullet
lda #1
sta bullettrigger
displaybulletloop
 
ldx bulletpositionl
sec
txa
sbc #40

  tax
stx bulletpositionl
  bcc decrbulletpositionh
 stx bulletpositionl
 


 ldx bulletpositionl
   
lda bulletpositionh
cmp #$01
beq displaybulletpg1
cmp #$02
beq displaybulletpg2
cmp #$03
beq displaybulletpg3 
cmp #$04
beq displaybulletpg4

 
 
 
returntomain

 
rts

jumptonotascore
jsr notascore
rts
displaybulletpg1

lda bulletchar
sta $0400,x
; sta $0401,x
lda bulletcolor
sta $d800,x
 ;sta $d801,x
 


rts
displaybulletpg2
 
lda bulletchar
sta $0500,x
;sta $0501,x
lda bulletcolor
sta $d900,x
;sta $d901,x
 
rts
displaybulletpg3
 
 
 
lda bulletchar

sta $0600,x
; sta $0601,x
lda bulletcolor
sta $da00,x
 ;sta $da01,x
  
 rts


displaybulletpg4
 

lda bulletchar
sta $0700,x
 
; sta $0701,x
lda bulletcolor
sta $db00,x
; sta $db01,x
 
 rts
incroppbulletpositionh
 
 
clc

lda opposebulletposh
cmp #5
beq resetopposebulletposh
inc opposebulletposh
 
rts
resetopposebulletposh 
 
 
 lda #1
sta opposebulletposl
lda #1
sta opposebulletposh
rts
 
 
  
 

 
displaycolorcolumn
 
ldx #0
displaycolorcolumn2

 
 
 ldx opposebulletposl
clc
 
 txa
adc #40
 
tax
 
 stx opposebulletposl
  bcs incroppbulletpositionh
 
 stx opposebulletposl
 
 
oppbulllab


    ldx opposebulletposl
lda opposebulletposh
cmp #$01
beq displaycolorcolumnpg1
cmp #$02
beq displaycolorcolumnpg2
cmp #$03
beq displaycolorcolumnpg3
cmp #$04
beq displaycolorcolumnpg4

 
 
rts

 

displaycolorcolumnpg1

lda #86
; sta $3400,x
; sta $3425,x
lda opposebulletcolor
sta $d800,x
 sta $d825,x
 
 

rts
displaycolorcolumnpg2
 
lda #86
;sta $3500,x
; sta $3525,x
lda opposebulletcolor
sta $d900,x
 sta $d925,x
 
rts
displaycolorcolumnpg3
 
 
 
lda #86

;sta $3600,x
;sta $3625,x
lda opposebulletcolor
sta $da00,x
 sta $da25,x
  
 rts


displaycolorcolumnpg4
 

lda #86
;sta $3700,x
; sta $3725,x
 
lda opposebulletcolor
sta $db00,x
 sta $db25,x
 
 rts

 


flightscollision
clc

lda opposebulletposl2

cmp positionl
beq checkhiflight

lda opposebulletposl2
adc #1

cmp positionl
beq checkhiflight
lda opposebulletposl2

sbc #1
cmp positionl
beq checkhiflight

lda opposebulletposl2
adc #40

cmp positionl
beq checkhiflight
lda opposebulletposl2
sbc #40
cmp positionl
beq checkhiflight



rts
checkhiflight
lda opposebulletposh2
cmp positionh
beq addscorejmp

rts
addscorejmp
jsr addscore
rts
 
 
 


 

showgameover 
jsr PLAYSOUND
jsr expnoz2
showgameover2 
;jsr smiley
;jsr smiley2
;jsr drawcircle
;jsr lips
ldy #0
showgameoverloop

 
lda gameovertex,y
 


sta $056d,y
lda #3
sta $d96d,y
iny
cpy #$20
bne showgameoverloop
 
lda $dc00
cmp #$6f
bne showgameover2
lda $dc00
cmp #$6f
beq reset
 
jmp mainloop
rts
reset 

 
jsr init
rts


 
 
 
 


 


  
scorecorrection
lda scoreones
cmp #0 
beq zeroscoreone
rts
zeroscoreone
lda #0 
sta scoreones
rts
 
 
zeroscore
lda #0 
sta scoreones
lda #0
sta scoretens
rts
 
backtostart
 
rts
resetwallscol
lda #2
sta wallscolour
sta bgcolor
jsr afterresetcolor
rts
addscore		
     
        
             
             jsr changeblockcharacter
              
             ;  jsr movewalls
               
           inc oppbulletchar
           inc opposebulletcolor
       
        lda wallscolour
       cmp #9
         beq resetwallscol
       inc wallscolour
          
     
          
          inc bgcolor
              jsr bulletchars
               
                 clc
			    lda #0
			    ldx #0
			    ldy #0
				jsr lazbeep2
				inc scoreones
			 
               
			 
				lda scoreones
			 
				sec
				sbc #10
			 
				cmp #$ 
				beq addtens
			    
           
        
			 
				rts

addtens			 
              
            
          
               inc scoretens
			
				lda #00
				sta scoreones
			   
			   lda scoretens
			    sec
				sbc #10
			    cmp #$
			    beq addhunds
				 
				rts 
addhunds        inc scorehunds
                lda #00
				sta scoreones
				lda #00
				sta scoretens
				lda scorehunds
			    sec
				sbc #10
			    cmp #$
			    beq addthous
			 
				rts 

				rts
addthous        inc scorethous
                lda #00
				sta scoreones
				lda #00
				sta scoretens
			    lda #00
				sta scorehunds
			 
				rts				
printscore		 
				
			  
				clc
				lda scoreones
				adc #$30
				
				sta $07e3
				lda #1
				sta $dbe3
				lda scoretens
				adc #$30
				sta $07e2
			lda #2
				sta $dbe2
				lda scorehunds
				adc #$30
				sta $07e1
			lda #3
				sta $dbe1
				lda scorethous
				adc #$30
				sta $07e0
				lda #4
				sta $dbe0	
				rts
PLAYSOUND
               
       lda #$00
	 
	jsr $7000

 
	; disable interrupts
 	sei
	lda #$7f
	sta $dc0d
	sta $dd0d
	lda #$01
	sta $d01a
 
	; init irq
 	lda #<irq
	ldx #>irq
	sta $0314
	stx $0315

	; create rater interrupt at line 0
	

	; clear interrupts and ACK irq
	lda $dc0d
	lda $dd0d
	
	cli
	rts
irq    
lda #0
           
   rol $d019
   
   
  lda #0
  jsr $7003
        lda $dc00
         cmp #$6f                ;READ FIRE
                BEQ initagain  
                JMP $EA81

initagain
jsr init
rts
somenum
         !byte     0,0,0,0,0,0,0,0,0,0 
abitmove   !byte 0,1,2,3,2,1,0
startuptext !scr "balls"
startuptext2   !scr "keyvan mehrbakhsh 2023"
gameovertex

          !scr " you got off the board goodbye ! " 
;objecbuffer
   ;      !byte     0,0,0,0,0,0,0,0,0,0 

 
 
somenum2
!byte 15,20,35,40,55,60,75,80,95,100,115,120,135,140,155,160,175,180,195,200,215,220,235,240
 
 
 
 
charindex !byte 0,8,16,24,16,8,16,24,0 

circle1
 !byte %1111111
circle2 
 !byte %1100011
circle3 
 !byte %1010101
circle4 
 !byte %1001001
circle5 
 !byte %1001001
circle6 
 !byte %1010101
circle7 
 !byte %1100011
circle8 
 !byte %1111111


theship   !byte   %00000000
          !byte   %00111100
          !byte   %01111110
          !byte   %11111111
          !byte   %11111111
          !byte   %01111110
          !byte   %00111100
          !byte   %00000000
          
theship2              
           !byte   %11111111
           !byte   %10000001
           !byte   %10000001
           !byte   %10000001
           !byte   %10000001
           !byte   %10000001
           !byte   %10000001
           !byte   %11111111
           
theship3              
            !byte  %00000000
            !byte  %00000000
            !byte  %11100111
            !byte  %11111111
            !byte  %01111110
            !byte  %00111100
            !byte  %00011000
            !byte  %00000000

            

           



           
thebuttfly1 !byte  %11110000
          !byte   %01111110
          !byte   %00110111
          !byte   %00010111
          !byte   %00001111
          !byte   %00000011
          !byte   %00000111
          !byte   %00011111
          
thebuttfly2             
           !byte   %00001111
           !byte   %01111110
           !byte   %11101100
           !byte   %11101000
           !byte   %11110000
           !byte   %11000000
           !byte   %11100000
           !byte   %11111000
           
thebuttfly3               
           !byte   %11110000
           !byte   %11111000
           !byte   %01111000
           !byte   %00010000
           !byte   %00001000
           !byte   %00101000
           !byte   %00010000
           !byte   %00000000
thebuttfly4               
             
           !byte   %00001111
           !byte   %00011111
           !byte   %00011110
           !byte   %00001000
           !byte   %00010000
           !byte   %00010100
           !byte   %00001000
           !byte   %00000000  
            
              
thejack  !byte    %00000000
          !byte   %00000000
          !byte   %00000111
          !byte   %00011111
          !byte   %00111000
          !byte   %11100000
          !byte   %11100110
          !byte   %11100110
          
thejack1              
          !byte   %00000000
          !byte   %00000000
          !byte   %11100000
          !byte   %11111000
          !byte   %00011100
          !byte   %00000111
          !byte   %01100111
          !byte   %01100111

thejack2              
             
          !byte   %00000111
          !byte   %11100111
          !byte   %11001110
          !byte   %00011100
          !byte   %11111000
          !byte   %11100000
          !byte   %00000000
          !byte   %00000000    
thejack3              
          !byte   %11100000
          !byte   %11100111
          !byte   %01110011
          !byte   %00111000
          !byte   %00011111
          !byte   %00000111
          !byte   %00000000
          !byte   %00000000
          
          
bulletchardata              
          !byte   %00000000
          !byte   %00011000
          !byte   %00011000
          !byte   %00011000
          !byte   %00011000
          !byte   %00011000
          !byte   %00111100
          !byte   %00000000
          
oppbulletchardata              
          !byte   %00111000
          !byte   %00111000
          !byte   %00111000
          !byte   %00111000
          !byte   %00111000
          !byte   %00111000
          !byte   %00111000
          !byte   %00111000
          
sidebulletchardata              
          !byte   %00111100
          !byte   %01111110
          !byte   %11000011
          !byte   %11111111
          !byte   %11111111
          !byte   %11111111
          !byte   %01111110
          !byte   %00111100          

  !source "four.asm"    
  !source "two.asm"    
    !source "three.asm"  
 !source "sounds.asm"
*=$7000-$02
 !bin "poketoi.prg" 
