boardershor
ldx #0
ldy #0
boarderslp
lda #186
sta $3450,x
lda #188
sta $3770,x


inx
cpx #40
bne boarderslp
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
lda #189
sta $33fe,y
lda #187
sta $34c7,y
lda #189
sta $34ee,y
lda #187
sta $35b7,y
lda #189
sta $35de,y
lda #187
sta $36a7,y
lda #189
sta $36ce,y
inx
cpx #6
bne boardersvertlp
rts
showboarders

ldx #0
ldy #0

showboarderslp1




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


 

 

moveleftward

lda #1
sta movementno3
lda #0
sta movementno4
rts

moverightward
lda #0
sta movementno3
lda #4
sta movementno4

rts


