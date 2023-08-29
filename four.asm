boarders
ldx #0
ldy #0
boarders2
 
ldy increment
cpy #40
beq zeroboarderthing


 
sty increment2

 

 



inx
cpx #255
bne boarders2
rts
zeroboarderthing
lda #0
sta increment
rts

boardershor
ldx #0
ldy #0
 
boardershorlp
lda #186


sta $3450,x

lda #188
sta $3770,x

 

 
inx
cpx #40
bne boardershorlp
rts
collisionlights
lda positionh
cmp #1
beq collisionlights1
cmp #4
beq collisionlights4
rts

collisionlights1
lda positionl
tay
lda $3400,y
cmp #199
beq showgameoverjump
rts
collisionlights4
lda positionl
tay
lda $3700,y
cmp #199
beq showgameoverjump
rts
showgameoverjump
jsr showgameover
rts


boardersvert
ldx #0
ldy #0
boardersvertlp

tya 
adc #40
tay
lda #187
sta $33d7,y
sta $33d8,y
lda #189
sta $33fe,y
sta $33fd,y
lda #187
sta $34c7,y
sta $34c8,y
lda #189
sta $34ee,y
sta $34ed,y
lda #187
sta $35b7,y
sta $35b8,y
lda #189
sta $35de,y
sta $35dd,y
lda #187
sta $36a7,y
sta $36a8,y
lda #189
sta $36ce,y
sta $36cd,y
inx
cpx #6
bne boardersvertlp
rts
 
showboarders

ldx #0
ldy #0

showboarderslp1


lda #186
sta $3450 
sta $3451 
sta $3477
sta $3476
lda #188
sta $3797
sta $3796
sta $3770 
sta $3771 
lda $3400
sta $0400

lda $3500
sta $0500

lda $3600
sta $0600

lda $3700
sta $0700

lda $33ff,y
sta $03ff,y
lda $3426,y
sta $0426,y
lda $34ef,y
sta $04ef,y
lda $3516,y
sta $0516,y
lda $35df,y
sta $05df,y
lda $3606,y
sta $0606,y
lda $36cf,y
sta $06cf,y
lda $36f6,y
sta $06f6,y
lda #32
sta $04ff
lda #32
sta $05ff
lda #32
sta $06ff

iny

cpy #255
bne showboarderslp1
rts


ballcollisiotowalls
lda positionh
cmp #1
beq ballcollisiotowalls1
cmp #2
beq ballcollisiotowalls2
cmp #3
beq ballcollisiotowalls3
cmp #4
beq ballcollisiotowalls4
rts
ballcollisiotowalls1



lda positionl
tax
lda $3400,x
cmp #188
beq changedirestion
rts
ballcollisiotowalls2
lda positionl
tax
lda $3500,x
cmp #188
beq changedirestion
rts
ballcollisiotowalls3
lda positionl
tax
lda $3600,x
cmp #188
beq changedirestion
rts
ballcollisiotowalls4
lda positionl
tax
lda $3700,x
cmp #188
beq changedirestion
rts
changedirestion

lda movementno
eor #39
 
sta movementno 
 
eor #39
 
sta movementno2
 

 

rts


 




