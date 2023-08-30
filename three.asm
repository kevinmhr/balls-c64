


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
clc
lda positionl
adc movementno3
   sta positionl
  bcs incresehighbytejmp
  sta positionl
rts
ballmovement4
sec 
moveleft
sec
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

jmptoup
 
jsr up
rts
 
movejoy 
                
                    jsr collisionhi
         
               
               lda lastkey
              
                cmp #$7b   
				beq left 
				cmp #$7e   
				 beq jmptoup
				cmp #$77    
				beq right
				cmp #$7d   
				beq down
				cmp #$6f
                beq jmptoup
           

        
				rts
				
 

rts
left 
  
lda joystktl
cmp #28
beq soleft
rts
soleft
 jsr noright22
     
    rts
counterrecount
jsr decreasehibyte
lda #1
sta positionl
 
rts
right 
lda joystktr
cmp #28
beq soright
rts
soright
 jsr noleft22
    rts
recount
;jsr incresehighbyte
lda #1
sta positionl
 
rts

down
lda joystktd
cmp #28
beq sodown
 
rts
decreasehibyte   
 
dec positionh
lda positionh
cmp #0
beq incresehighbyte
out
rts
sodown
 jsr noup22
 
  
    rts
up
lda joystktu
cmp #26
bne soup
rts
soup 
jsr nodown22
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

