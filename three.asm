


fire	
 lda bullettrigger
 cmp #0

 ;beq fire2 
 rts
fire2
 
lda positionl
sta bulletpositionl

 lda positionh
sta bulletpositionh
 
 
  jsr lazbeep1 
 


 
notascore
 

lda #$7f
sta lastkey
 

rts
 

dojoy
lda $dc00
sta lastkey
rts
 


jmptoup
jsr soup
jsr up
rts
 
jmpdecreasehibyte
jsr dechibyteagain
rts
 
ballmovement
 
movedown
 clc
lda positionl
adc movementno
 
 sta positionl
bcs incresehighbytejmp
  sta positionl
rts
 
 
ballmovement2
 
moveup
sec
lda positionl
sbc movementno2
 
 
 sta positionl
bcc decreasehibytejmp
 
  sta positionl


rts
ballmovement3
 clc
moveright

lda positionl
adc movementno3
   sta positionl
  bcs incresehighbytejmp
  sta positionl
rts
ballmovement4
sec 
moveleft
lda positionl
sbc movementno4
  sta positionl
 bcc decreasehibytejmp
sta positionl


rts
incresehighbytejmp
jsr incresehighbyte
rts
decreasehibytejmp
jsr decreasehibyte
rts

 
movejoy 
                
                 jsr collisionhi
        
                lda lastkey
              
                cmp #$7b   
				beq soleft 
				cmp #$7e   
				 ;beq soup
				cmp #$77    
				beq soright
				cmp #$7d   
				beq sodown
				cmp #$6f
                beq soup
              
				rts
				
 

rts
left 
  
lda joystktl
cmp #28
beq soleft
rts
soleft
lda #1
sta scrollvalue
 jsr expnoz
   
    lda positionl
    sec
    sbc #01
    sta positionl
    sta positionlbuffer
  bcc counterrecount
   lda #01
 sta scrolltrigger
   
     
    rts
counterrecount
jsr decreasehibyte
lda #255
sta positionl
 
rts
right 
lda joystktr
cmp #28
beq soright
rts
soright
lda #254
sta scrollvalue
jsr expnoz
 
 lda positionl
    clc
    adc #01
    sta positionl
  sta positionlbuffer
  bcs recount
    
      lda #01
 sta scrolltrigger
   
    rts
recount
jsr incresehighbyte
lda #0
sta positionl
 
rts

down
lda joystktd
cmp #28
bne sodown
 
rts
decreasehibyte   
 
dec positionh
lda positionh
cmp #0
beq incresehighbyte
out
rts
sodown
lda #216
 
 
   jsr expnoz
   lda positionl
 
    clc
    adc #40
    sta positionl
    sta positionlbuffer
    
    bcs incresehighbyte
 
    lda #01
 sta scrolltrigger
 
 
 
  
    rts
up
lda joystktu
cmp #26
bne soup
rts
soup 

lda #40
sta scrollvalue
 jsr expnoz
 
  lda positionl
    sec
    sbc #40
    
    sta positionl
 sta positionlbuffer
   
 
 bcc decreasehibyte
 
    lda #01
 sta scrolltrigger
rts

 






incresehighbyte   
clc


 inc positionh

lda positionh
cmp #5
beq dechibyteagain

 
rts
dechibyteagain
lda positionh
cmp #0
beq dontdec
dec positionh

dontdec
 rts
 
 jsr movewalls

 
rts
increaselowbyte
 lda positionl
adc #23
 sta positionl
 


rts

inchibyteagain
 
lda #04
sta positionh
decreaselowbyte

lda positionl
sbc #24
sta positionl
 
rts
 
changeblockcharacter
ldy #0
inc increment2
ldx increment2
changeblockcharacterlp
txa
ror

 
sta $2260 ,y
iny
cpy #8
bne changeblockcharacterlp

rts

