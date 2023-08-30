smiley 
ldx #0
smileyloop
inx
      lda #170
      sta $059d,x
      sta $05a5,x
      lda #2
      sta $d99d,x
      sta $d9a5,x
     lda #126
     sta $061b
      sta $0643
      sta $066b
       lda #2
       sta $da1b
      sta $da43
     ;sta $da6b
      
    
      lda #128
       sta $061d
       sta $0619
        sta $da1d
       sta $da19
cpx #4

bne smileyloop
rts
smiley2
ldx #0
smileyloop2
inx
     lda #171
     sta $05ee,x
      sta $05f6,x
         lda #3
        sta $d9ee,x
      sta $d9f6,x
    lda #127
     sta $05c4,x
      sta $05c9,x
      sta $05cc,x
      sta $05d1,x
      lda #2
      sta $d9c4,x
      sta $d9c9,x
      sta $d9cc,x
      sta $d9d1,x

cpx #2

bne smileyloop
rts
circle !byte 0,2,40,81,122,162,178,138,99,59,19

drawcircle
ldx #0
ldy #0
drawcircleloop

ldx circle,y
iny
      lda #126
      sta $059a,x
      sta $d99a,x
    sta $054a,x
      sta $d94a,x
      cpy #11
      bne drawcircleloop
     rts

lips 
ldx #0
lipsloop
inx
lda #128
sta $06b8,x
sta $06e0,x
cpx #5
bne lipsloop
rts
face 
jsr smiley
jsr smiley2
jsr drawcircle
jsr lips
rts
display 
ldx #$0
ldy #0

displayloop
clc






lda positionh
ldy positionl
cpy #255
beq bypass4
cmp #$01
beq displaypageone
cmp #$02
beq displaypagetwo 
cmp #$03
beq displaypagethree  
cmp #$04
beq displaypagefour  
bypass4
    
rts 
displaypageone

lda character 
sta $0400,y
 
lda charactercolour
sta $d800,y

rts
displaypagetwo

lda character 
sta $0500,y
 
lda charactercolour
sta $d900,y
 
 
rts
displaypagefour
 

lda character
sta $0700,y
 
lda charactercolour
sta $db00,y
 
rts

displaypagethree
 
lda character
sta $0600,y
 
lda charactercolour
sta $da00,y
 
 
rts

incroppbulletpositionh2
 
 

lda #32
sta $04ff
sta $05ff
sta $06ff
sta $07ff
lda opposebulletposh2
cmp #4
beq resetopposebulletposh2
inc opposebulletposh2
 
rts
resetopposebulletposh2 

lda #1 
sta opposebulletposh2
rts
 


displayoppbullet2
 

displayoppbulletloop2
clc
inx
iny

 

ldx opposebulletposl2
 txa
adc #1
 eor #254

  tax
  
 
 stx opposebulletposl2
  bcs incroppbulletpositionh2
 
 stx opposebulletposl2
 
jsr flightscollision
 
 


    ldx opposebulletposl2
lda opposebulletposh2
cmp #$01
beq displayoppbullet2pg1
cmp #$02
beq displayoppbullet2pg2
cmp #$03
beq displayoppbullet2pg3 
cmp #$04
beq displayoppbullet2pg4

  
 
rts
checkpositionh
lda positionh
cmp opposebulletposh2
beq gameoverbridge
rts
gameoverbridge
jsr showgameover
rts


displayoppbullet2pg1

lda oppbulletchar
sta $0400,x
 
lda opposebulletcolor
sta $d800,x
 
 


rts
displayoppbullet2pg2
 
lda oppbulletchar
sta $0500,x
 
lda opposebulletcolor
sta $d900,x
 
 
rts
displayoppbullet2pg3
 
 
 
lda oppbulletchar

sta $0600,x
 
lda opposebulletcolor
sta $da00,x
 
  
 rts


displayoppbullet2pg4
 

lda oppbulletchar
sta $0700,x
 
 
lda opposebulletcolor
sta $db00,x
 
 
 rts
 
 

displaycolors
ldx #0
ldy #0
 
displaycolorslp

inc colorshadow
 
lda #0
sta lookoutbit
 
 ;lda db,y
 
 
;sta $0400,y
 
lda wallscolour
sta $d800,y

 
 
; lda db2,y
 
 
 
;sta $0500,y
 
lda wallscolour
sta $d900,y
 
 

 
; lda db3,y
 
 
 
 
;sta $0600,y
 
lda wallscolour
sta $da00,y
 

;lda db4,y
 
 

 
;sta $0700,y

lda wallscolour
sta $db00,y





 iny
cpy #255


bne displaycolorslp

 
 rts
 
maskingnoncollidablebits
ldx #0
maskingnoncollidablebitslp
lda #32
sta db,x
sta db2,x
sta db3,x
sta db4,x
inx
cpx #60
bne maskingnoncollidablebitslp
 

ldx #200
maskingnoncollidablebitslp2
lda #32
sta db,x
sta db2,x
sta db3,x
sta db4,x
inx
cpx #255
bne maskingnoncollidablebitslp2






rts


showingbits
ldy #0
ldx #0
showingbitslp
lda #34
sta db,x
lda #35
sta db2,x
lda #36
sta db3,x
lda #37
sta db4,x
inx
cpx #255
bne showingbitslp
rts

 
displaywallslpjmp
jsr displaycolorslp
rts
collisionhi
 lda #28
 sta joystktl
  lda #28
 sta joystktr
 
 lda #28
 sta joystktd
  lda #28
 sta joystktu
lda positionh
cmp #1
 beq collidepage1br
lda positionh
cmp #2
 beq collidepage2br
lda positionh
cmp #3
beq collidepage3br
lda positionh
cmp #4
 beq collidepage4br
rts
collidepage1br
 jmp collidepage1
rts
collidepage2br
 jmp collidepage2
rts
collidepage3br
jmp collidepage3
rts
collidepage4br
 jmp collidepage4
rts
 
collidepage2
clc
lda positionl
;sbc #39
tax
 lda colorshadow
sta $d900,x
lda db2,x
cmp #186
beq jsnoup2
recheckdown2
clc
lda positionl
;adc #40
tax
lda colorshadow
sta $d900,x
lda db2,x
 cmp #188
beq jsnodown

recheckleft2
clc
lda positionl
;sbc #0
tax
lda colorshadow
sta $d900,x
lda db2,x
cmp #187
beq jsnoleft
recheckright2
clc
lda positionl
;adc #1
adc lookoutbit
tax
lda colorshadow
sta $d900,x
lda db2,x
cmp #189
beq jsnoright


rts 

jsnoup2
jsr noup2
rts
collidepage4
clc
lda positionl
;sbc #39
tax
 lda colorshadow
sta $db00,x
lda db4,x
cmp #186
beq jsnoup
recheckdown4

clc
lda positionl
;adc #40
tax
 lda colorshadow
sta $db00,x
lda db4,x
 cmp #188
beq jsnodown
recheckleft4
clc
lda positionl
;sbc #0
tax
 lda colorshadow
sta $db00,x
lda db4,x
cmp #187
beq jsnoleft
recheckright4
clc
lda positionl

;adc #1
adc lookoutbit
tax
lda db4,x
cmp #189
beq jsnoright


rts
jsnoleft
jsr noleft2
rts
jsnoright
jsr noright2
rts
jsnoup
jsr noup2
rts
jsnodown
jsr nodown2
rts

collidepage3
clc
lda positionl
;sbc #39
tax
  lda colorshadow
sta $da00,x
lda db3,x
 

cmp #186
beq jsnoup
recheckdown3
clc
lda positionl
;adc #40
tax
   lda colorshadow
sta $da00,x
lda db3,x
 

 cmp #188
beq jsnodown
recheckleft3
clc
lda positionl
;sbc #0
tax
   lda colorshadow
sta $da00,x
lda db3,x
 

cmp #187
beq jsnoleft
recheckright3
clc
lda positionl
;adc #1
adc lookoutbit
tax
   lda colorshadow
sta $da00,x
lda db3,x
 

cmp #189
beq jsnoright


rts
collidepage1
clc
lda positionl
;sbc #39
tax
   lda colorshadow
sta $d800,x
lda db,x

cmp #186
beq jsnoup

recheckdown1
clc
lda positionl
;adc #40
tax
   lda colorshadow
sta $d800,x
lda db,x
 cmp #188
beq jsnodown
recheckleft1
clc
lda positionl
;sbc #0
tax
   lda colorshadow
sta $d800,x
lda db,x
cmp #187
beq jsnoleft2
recheckright1
clc
lda positionl
;adc #1
adc lookoutbit
tax
   lda colorshadow
sta $d800,x
lda db,x
cmp #189
beq jsnoright2
 
rts
checkleftagain1

jsnoleft2
jsr noleft2
rts
jsnoright2
jsr noright2
rts
collisioncomplexcheck6
lda joystktu
cmp #26
beq jmpdothetrick3
rts
collisioncomplexcheck5
lda joystktl
cmp #23
beq  dothetrick2 
rts
collisioncomplexcheck4
lda joystktd
cmp #5
beq jmpdothetrick
rts
checkleft3
lda joystktl
cmp #28
beq checkright3
rts
checkright3
lda joystktr
cmp #28
beq checkup3
rts
checkup3
lda joystktu
cmp #28
beq jmpdothetrick 
rts
jmpdothetrick 
jsr dothetrick
rts
collisioncomplexcheck3
lda joystktd
cmp #5
beq checkleft2
rts
 
collisioncomplexcheck2
lda joystktu
cmp #26
beq checkright

rts
checkright
lda joystktr
cmp #28
beq checkleft
 

rts
checkleft
lda joystktd
cmp #28
beq jmpdothetrick3

lda joystktl
cmp #23
beq dothetrick

rts
jmpdothetrick3
jsr dothetrick3
rts
checkleft2

lda joystktu
cmp #26
beq dothetrick2
lda joystktl
cmp #23
beq dothetrick2



rts
checkdown2
lda joystktd
cmp #28
beq dothetrick3
rts

lda joystktd
cmp #28
beq dothetrick

collisioncomplexcheck
lda joystktu
cmp #26
beq checkdown

lda joystktl
cmp #23
beq checkdown
rts
checkdown

lda joystktd
cmp #28
beq dothetrick

rts

dothetrick2
 

lda #0
sta lookoutbit
lda positionh
cmp #1
beq jmprecheckright1
lda positionh
cmp #2
beq jmprecheckright2
lda positionh
cmp #3
beq jmprecheckright3
lda positionh
cmp #4
beq jmprecheckright4
rts 
jmprecheckright1
jsr recheckright1
rts
jmprecheckright2
jsr recheckright2
rts
jmprecheckright4
jsr recheckright4
rts
jmprecheckright3
jsr recheckright3
rts

dothetrick
 

lda #0
sta lookoutbit
lda positionh
cmp #1
beq jmprecheckleft1
lda positionh
cmp #2
beq jmprecheckleft2
lda positionh
cmp #3
beq jmprecheckleft3
lda positionh
cmp #4
beq jmprecheckleft4
rts 
jmprecheckleft1
jsr recheckleft1
rts
jmprecheckleft2
jsr recheckleft2
rts
jmprecheckleft4
jsr recheckleft4
rts
jmprecheckleft3
jsr recheckleft3
rts

dothetrick3
 

lda #0
sta lookoutbit
lda positionh
cmp #1
beq jmprecheckdown1
lda positionh
cmp #2
beq jmprecheckdown2
lda positionh
cmp #3
beq jmprecheckdown3
lda positionh
cmp #4
beq jmprecheckdown4
rts 
jmprecheckdown1
jsr recheckdown1
rts
jmprecheckdown2
jsr recheckdown2
rts
jmprecheckdown4
jsr recheckdown4
rts
jmprecheckdown3
jsr recheckdown3
rts



nodown2

  jsr lazbeep1
nodown22
lda #5
sta joystktd
lda #0
sta movementno

lda #40
sta movementno2

lda movementno3
cmp #0
beq zeromovement
dec movementno3
lda movementno4
cmp #0
beq zeromovement
dec movementno4
zeromovement
rts 
 

 
noright2
jsr lazbeep1
noright22
lda #48
sta joystktr
 
lda #0
 
sta movementno3
 
 
 
lda #1


lda movementno4
cmp #2
beq holdmovement4
inc movementno4

 
rts
 
holdmovement4

lda #23
sta joystktl


lda #1
sta movementno4
rts
 
holdmovement3
lda #48
sta joystktr
lda #1
sta movementno3
rts
noleft2
jsr lazbeep1
noleft22
lda #23
sta joystktl
 
lda #0
 
 
sta movementno4

lda movementno3
cmp #2
beq holdmovement3
inc movementno3

rts

noup2
jsr lazbeep1

noup22
lda #40
sta movementno

lda #0
sta movementno2
lda #26
sta joystktu
 
lda #0

sta scrollvalue
lda movementno3
cmp #0
beq zeromovement
dec movementno3
lda movementno4
cmp #0
beq zeromovement
dec movementno4
rts 

correctwalls
ldx #0
correctwallslp
lda #32
sta db,x
sta db2,x
sta db3,x
sta db4,x
inx
cpx #40
bne correctwallslp

rts

 



