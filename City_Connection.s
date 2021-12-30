;#resource "CC_Chr_0.s"
;#resource "CC_Chr_1.s"
;#resource "CC_Chr_2.s"
;#resource "CC_Chr_3.s"
;#resource "CNROM.cfg"
;#define CFGFILE CNROM.cfg
;#define LIBARGS ,

;
; iNES header
;

.segment "HEADER"

INES_MAPPER = 3 ; 3 = CNROM
INES_MIRROR = 1 ; 0 = horizontal mirroring, 1 = vertical mirroring
INES_SRAM   = 0 ; 1 = battery backed SRAM at $6000-7FFF

.byte 'N', 'E', 'S', $1A ; ID
.byte $02 ; 16k PRG chunk count
.byte $04 ; 8k CHR chunk count
.byte INES_MIRROR | (INES_SRAM << 1) | ((INES_MAPPER & $f) << 4)
.byte (INES_MAPPER & %11110000)
.byte $0, $0, $0, $0, $0, $0, $0, $0 ; padding

;*********************************************************************************************
;** Original File: D:\Projects\City Connection (U) [!].nes
;** 16K PRG-ROM pages: $02
;** 8K CHR-ROM pages: $04
;** Mirroring: vertical
;** SRAM: not available
;** Trainer: not available
;** Mapper: $03
;*********************************************************************************************

.autoimport +

;The following labels are referenced by other banks:

	;.export Lbl_8000, Lbl_838d, Lbl_842e, Lbl_d000

.segment "BANK0"

Lbl_8000:
	.byte $00,$01,$02,$03,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff

Lbl_8100:
	lda $19
	sta $1a
	lda $62
	bpl Lbl_8145
	lda $5a
	bne Lbl_811d
	ldx $5b
	lda Lbl_816b,x
	sta $5a
	inx 
	lda Lbl_816b,x
	sta $19
	inc $5b
	inc $5b

Lbl_811d:
	dec $5a

Lbl_811f:
	lda $1d
	sta $1f
	lda #$01
	sta $4016
	lda #$00
	sta $4016
	ldx #$08

Lbl_812f:
	lda $4016
	and #$03
	cmp #$01
	ror $1d
	lda $4017
	and #$03
	cmp #$01
	ror $1e
	dex 
	bne Lbl_812f
	rts 

Lbl_8145:
	jsr Lbl_811f
	lda $61
	lsr a 
	bcs Lbl_8166
	lda $1d

Lbl_814f:
	pha 
	and #$fc
	sta $19
	pla 
	pha 
	and #$01
	asl a 
	sta $10
	pla 
	and #$02
	lsr a 
	ora $10
	ora $19
	sta $19
	rts 

Lbl_8166:
	lda $1e
	jmp Lbl_814f

Lbl_816b:
	.byte $e0,$80,$68,$02,$f8,$80,$d0,$40,$20,$41,$10,$40,$40,$41,$20,$12
	.byte $a9,$00,$8d,$01,$20,$a9,$33,$85,$11,$a9,$20,$d0,$25,$a9,$00,$8d
	.byte $01,$20,$a9,$33,$85,$11,$a9,$28,$d0,$18

Lbl_8195:
	lda #$00
	sta $2001
	lda #$40
	sta $11
	lda #$20
	bne Lbl_81ad

Lbl_81a2:
	lda #$00
	sta $2001
	lda #$40
	sta $11
	lda #$24

Lbl_81ad:
	sta $2006
	lda #$00
	sta $2006
	tay 
	lda #$03
	sta $10
	lda $11

Lbl_81bc:
	sta $2007
	dey 
	bne Lbl_81bc
	dec $10
	bne Lbl_81bc

Lbl_81c6:
	sta $2007
	iny 
	cpy #$c0
	bcc Lbl_81c6
	lda #$00

Lbl_81d0:
	sta $2007
	iny 
	bne Lbl_81d0
	lda $21
	sta $2001
	rts 

Lbl_81dc:
	lda #$00
	sta $2001
	tay 
	lda $2002
	lda #$3f
	sta $2006
	lda #$00
	sta $2006

Lbl_81ef:
	lda $0220,y
	sta $2007
	iny 
	cpy #$20
	bcc Lbl_81ef
	lda #$3f
	sta $2006
	lda #$00
	sta $2006
	sta $2006
	sta $2006

Lbl_820a:
	lda $2002
	lda $24
	sta $2005
	lda $26
	sta $2005
	lda $20
	sta $2000
	rts 

Lbl_821d:
	ldy #$1f

Lbl_821f:
	lda Lbl_8229,y
	sta $0220,y
	dey 
	bpl Lbl_821f
	rts 

Lbl_8229:
	.byte $0f,$05,$0f,$3c,$0f,$27,$16,$3c,$0f,$18,$2a,$1a,$0f,$12,$06,$30
	.byte $0f,$22,$16,$30,$0f,$10,$12,$30,$0f,$35,$26,$16,$0f,$10,$00,$30

Lbl_8249:
	lda $27
	asl a 
	asl a 
	clc 
	adc $27
	clc 
	adc #$03
	sta $27
	lda $19
	bne Lbl_825b
	inc $27

Lbl_825b:
	rts 

Lbl_825c:
	asl a 
	tay 
	iny 
	pla 
	sta $10
	pla 
	sta $11
	lda ($10),y
	sta $12
	iny 
	lda ($10),y
	sta $13
	jmp ($0012)

Lbl_8271:
	lda #$20
	sta $2006
	lda #$93
	sta $2006
	ldx #$09
	lda #$40

Lbl_827f:
	sta $2007
	dex 
	bpl Lbl_827f
	jsr Lbl_820a
	lda $21
	sta $2001
	jsr Lbl_8691
	ldy #$10
	jsr Lbl_a60a
	jmp Lbl_841d

Lbl_8298:
	lda $2002
	lda #$00
	sta $2001
	lda $33
	and #$01
	bne Lbl_82a8
	dec $5c

Lbl_82a8:
	lda $5c
	bmi Lbl_8271
	lda #$20
	sta $2006
	lda #$9a
	sta $2006
	lda $5d
	pha 
	jsr Lbl_a389
	ora #$30
	sta $2007
	lda #$5c
	sta $2007
	pla 
	and #$0f
	ora #$30
	sta $2007
	jsr Lbl_820a
	lda $21
	sta $2001
	lda $5d
	and #$0f
	bne Lbl_82e1
	ldy #$08
	jsr Lbl_a60a

Lbl_82e1:
	lda $5c
	sta $10
	lda #$00
	sta $11
	jsr Lbl_a1c0
	lda $14
	sta $5d
	jsr Lbl_8691
	jmp Lbl_841d

Lbl_82f6:
	cmp #$10
	beq Lbl_8298
	jsr Lbl_9e2d
	lda #$21
	sta $2006
	lda #$58
	sta $2006
	lda $5d
	pha 
	jsr Lbl_a389
	ora #$30
	cmp #$30
	bne Lbl_8315
	lda #$40

Lbl_8315:
	sta $2007
	pla 
	and #$0f
	ora #$30
	sta $2007
	lda #$30
	sta $2007
	sta $2007
	lda $0100
	beq Lbl_8330
	jsr Lbl_871d

Lbl_8330:
	jsr Lbl_820a
	jsr Lbl_8691
	lda $5a
	cmp #$30
	bcs Lbl_835a
	lda $33
	and #$07
	bne Lbl_8357
	lda $5a
	cmp #$20
	bcc Lbl_8355
	beq Lbl_834c
	bcs Lbl_8360

Lbl_834c:
	jsr Lbl_866c
	jsr Lbl_a2af
	jmp Lbl_841d

Lbl_8355:
	inc $5a

Lbl_8357:
	jmp Lbl_841d

Lbl_835a:
	lda #$ff
	sta $5a
	bne Lbl_8357

Lbl_8360:
	cmp #$24
	beq Lbl_836a
	cmp #$28
	beq Lbl_8383
	bne Lbl_8355

Lbl_836a:
	lda $a9
	cmp #$01
	bcc Lbl_8355
	lda #$04

Lbl_8372:
	sta $0100
	lda $33
	and #$07
	bne Lbl_8380
	ldy #$08
	jsr Lbl_a60a

Lbl_8380:
	jmp Lbl_8355

Lbl_8383:
	lda $a9
	cmp #$02
	bcc Lbl_8355
	lda #$08
	bne Lbl_8372

Lbl_838d:
	pha 
	txa 
	pha 
	tya 
	pha 
	lda $2002
	lda #$00
	sta $2003
	lda #$07
	sta $4014
	nop 
	nop 
	nop 
	lda $67
	jsr Lbl_ff0c
	bit $5f
	bpl Lbl_83ae
	jmp Lbl_842f

Lbl_83ae:
	lda $5f
	and #$30
	beq Lbl_83b7
	jmp Lbl_82f6

Lbl_83b7:
	jsr Lbl_9dfe
	lda $2002
	lda #$00
	sta $2005
	sta $2005
	lda $20
	and #$fc
	sta $2000
	lda $21
	sta $2001
	ldy #$04

Lbl_83d3:
	ldx #$40

Lbl_83d5:
	nop 
	dex 
	bne Lbl_83d5
	dey 
	bne Lbl_83d3
	jsr Lbl_8691
	jsr Lbl_820a
	bit $5f
	bvs Lbl_8446
	jsr Lbl_8249
	jsr Lbl_8100
	lda $63
	and #$1e
	bne Lbl_8455
	jsr Lbl_9032
	jsr Lbl_93cc
	jsr Lbl_db34
	jsr Lbl_95db
	jsr Lbl_96eb
	jsr Lbl_9874
	jsr Lbl_994f
	jsr Lbl_9ac8
	jsr Lbl_85f5
	jsr Lbl_9c69
	lda $a2
	cmp #$07
	bcc Lbl_841a
	lda #$07
	sta $a2

Lbl_841a:
	jsr Lbl_a2af

Lbl_841d:
	jsr Lbl_a3a0
	jsr Lbl_89be
	jsr Lbl_86ae

Lbl_8426:
	jsr Lbl_85ab
	pla 
	tay 
	pla 
	tax 
	pla 

Lbl_842e:
	rti 

Lbl_842f:
	jsr Lbl_896c
	jsr Lbl_81dc
	lda #$1e
	sta $2001
	jsr Lbl_8100
	jsr Lbl_8eb8
	jsr Lbl_a3a4
	jmp Lbl_8426

Lbl_8446:
	jsr Lbl_8100
	jsr Lbl_a2af
	jsr Lbl_8a14
	jsr Lbl_8a51
	jmp Lbl_841d

Lbl_8455:
	cmp #$04
	beq Lbl_847b
	cmp #$08
	beq Lbl_8481
	cmp #$10
	beq Lbl_848c
	jsr Lbl_9832

Lbl_8464:
	ldx #$80
	jsr Lbl_dbac
	ldx #$98
	jsr Lbl_dbac
	ldx #$18
	jsr Lbl_dbac
	ldx #$60
	jsr Lbl_dbac
	jmp Lbl_841d

Lbl_847b:
	jsr Lbl_952f
	jmp Lbl_8464

Lbl_8481:
	dec $0644
	bne Lbl_841d
	lda #$80
	sta $63
	bne Lbl_841d

Lbl_848c:
	jsr Lbl_849e
	jsr Lbl_a2af
	jmp Lbl_841d

Lbl_8495:
	.byte $a5,$33,$29,$07,$d0,$02,$e6,$5c,$60

Lbl_849e:
	lda $33
	and #$3f
	bne Lbl_84a9
	ldy #$02
	jsr Lbl_a60a

Lbl_84a9:
	lda $5c
	bne Lbl_84b3
	jsr Lbl_858d
	inc $5c
	rts 

Lbl_84b3:
	cmp #$70
	bcc Lbl_84c7
	cmp #$90
	bcc Lbl_8495
	cmp #$f8
	bcc Lbl_84c7
	lda #$00
	sta $63
	jsr Lbl_a572
	rts 

Lbl_84c7:
	lda $33
	and #$03
	bne Lbl_84cf
	inc $5c

Lbl_84cf:
	lda $5c
	lsr a 
	lsr a 
	lsr a 
	lsr a 
	tay 
	lda Lbl_857d,y
	bit $2e
	bmi Lbl_84f6
	jsr Lbl_9c8a

Lbl_84e0:
	lda #$01
	bit $2e
	bpl Lbl_84e8
	lda #$ff

Lbl_84e8:
	clc 
	adc $64
	and #$7f
	sta $64
	jsr Lbl_9fab
	jsr Lbl_9efc
	rts 

Lbl_84f6:
	jsr Lbl_9ca8
	jmp Lbl_84e0

Lbl_84fc:
	lda #$00
	sta $2000
	sta $2001
	sta $20
	sta $21
	jsr Lbl_821d
	jsr Lbl_81dc
	jsr Lbl_8195
	jsr Lbl_81a2
	lda #$00
	sta $24
	sta $26
	sta $25
	jsr Lbl_86c0
	jsr Lbl_a0f4
	jsr Lbl_9e2d
	jsr Lbl_820a
	lda #$80
	sta $65
	jmp Lbl_856c

Lbl_852f:
	lda #$00
	sta $2000
	sta $2001
	sta $20
	sta $21
	lda $27
	and #$01
	clc 
	adc #$02
	clc 
	adc $a0
	cmp #$06
	bcc Lbl_854c
	sec 
	sbc #$06

Lbl_854c:
	sta $a0
	inc $a1
	lda $2e
	pha 
	jsr Lbl_9c18
	pla 
	sta $2e
	lda $a4
	beq Lbl_8568
	sta $16

Lbl_855f:
	lda #$0a
	jsr Lbl_a244
	dec $16
	bpl Lbl_855f

Lbl_8568:
	lda #$00
	sta $65

Lbl_856c:
	inc $5c
	lda #$18
	sta $21
	sta $2001
	lda #$90
	sta $20
	sta $2000
	rts 

Lbl_857d:
	.byte $04,$08,$0c,$10,$14,$18,$1c,$20,$20,$1c,$18,$14,$10,$0c,$08,$04

Lbl_858d:
	ldx #$00

Lbl_858f:
	cpx #$40
	bcc Lbl_8597
	cpx #$58
	bcc Lbl_85a4

Lbl_8597:
	lda #$f0
	sta $0700,x
	sta $0600,x
	lda #$00
	sta $0601,x

Lbl_85a4:
	inx 
	inx 
	inx 
	inx 
	bne Lbl_858f
	rts 

Lbl_85ab:
	inc $33
	bne Lbl_85b1
	inc $34

Lbl_85b1:
	rts 

Lbl_85b2:
	jsr Lbl_a2a2
	lda #$00
	sta $62
	sta $61
	sta $a3
	rts 

Lbl_85be:
	ldx #$1f

Lbl_85c0:
	lda Lbl_85cd,x
	sta $a0,x
	sta $c0,x
	sta $e0,x
	dex 
	bpl Lbl_85c0
	rts 

Lbl_85cd:
	.byte $00,$00,$02,$00,$05,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00

Lbl_85f5:
	lda $33
	and #$0f
	sta $12
	asl a 
	tay 
	lda Lbl_8644,y
	sta $10
	lda Lbl_8645,y
	sta $11
	ldy #$1f

Lbl_8609:
	lda ($10),y
	cmp #$3d
	beq Lbl_863a
	dey 
	bpl Lbl_8609
	lda $12
	cmp #$08
	and #$07
	tay 
	bcs Lbl_863b
	lda $a7
	ora Lbl_8664,y
	sta $a7

Lbl_8622:
	lda $a7
	cmp #$ff
	bne Lbl_863a
	lda $a8
	cmp #$ff
	bne Lbl_863a
	lda #$08
	sta $63
	lda #$80
	sta $0644
	jsr Lbl_a5cc

Lbl_863a:
	rts 

Lbl_863b:
	lda $a8
	ora Lbl_8664,y
	sta $a8
	bne Lbl_8622

Lbl_8644:
	.byte $00

Lbl_8645:
	.byte $03,$20,$03,$40,$03,$60,$03,$80,$03,$a0,$03,$c0,$03,$e0,$03,$00
	.byte $04,$20,$04,$40,$04,$60,$04,$80,$04,$a0,$04,$c0,$04,$e0,$04

Lbl_8664:
	.byte $01,$02,$04,$08,$10,$20,$40,$80

Lbl_866c:
	lda $5b
	beq Lbl_868e
	lda #$01
	jsr Lbl_a244
	dec $5b
	inc $5c
	lda $5c
	sta $10
	lda #$00
	sta $11
	jsr Lbl_a1c0
	lda $14
	sta $5d
	ldy #$08
	jsr Lbl_a60a
	rts 

Lbl_868e:
	inc $5a
	rts 

Lbl_8691:
	ldx #$80
	ldy $28

Lbl_8695:
	lda #$3f
	sta $10

Lbl_8699:
	lda $0700,x
	pha 
	lda $0700,y
	sta $0700,x
	pla 
	sta $0700,y
	inx 
	iny 
	dec $10
	bpl Lbl_8699
	rts 

Lbl_86ae:
	lda $28
	clc 
	adc #$40
	cmp #$c0
	bcc Lbl_86b9
	lda #$40

Lbl_86b9:
	sta $28
	tay 
	ldx #$80
	bne Lbl_8695

Lbl_86c0:
	lda $2002
	lda #$22
	sta $2006
	lda #$14
	sta $2006
	ldy #$00

Lbl_86cf:
	lda Lbl_8705,y
	sta $2007
	iny 
	cpy #$0a
	bcc Lbl_86cf
	lda #$22
	sta $2006
	lda #$54
	sta $2006

Lbl_86e4:
	lda Lbl_8705,y
	sta $2007
	iny 
	cpy #$12
	bcc Lbl_86e4
	lda #$22
	sta $2006
	lda #$79
	sta $2006

Lbl_86f9:
	lda Lbl_8705,y
	sta $2007
	iny 
	cpy #$18
	bcc Lbl_86f9
	rts 

Lbl_8705:
	.byte $57,$41,$52,$50,$40,$42,$4f,$4e,$55,$53,$4f,$49,$4c,$2e,$31,$30
	.byte $30,$30,$50,$4f,$49,$4e,$54,$53

Lbl_871d:
	clc 
	adc #$90
	tax 
	lda #$22
	sta $2006
	stx $2006
	lda #$fc
	sta $2007
	lda #$fd
	sta $2007
	txa 
	adc #$20
	tax 
	lda #$22
	sta $2006
	stx $2006
	lda #$fe
	sta $2007
	lda #$ff
	sta $2007
	lda #$00
	sta $0100
	rts 

Lbl_874f:
	jsr Lbl_8195
	jsr Lbl_81a2
	lda #$03
	sta $67
	jsr Lbl_ff0c
	lda #$90
	sta $20
	jsr Lbl_879a
	jsr Lbl_8767
	rts 

Lbl_8767:
	ldx #$00
	lda #$20
	sta $11
	lda #$00
	sta $10
	lda $2002
	lda $11
	sta $2006
	lda $10
	sta $2006
	ldy #$00
	ldx #$00
	lda #$b8
	sta $12
	lda #$8a
	sta $13

Lbl_878a:
	lda ($12),y
	sta $2007
	iny 
	bne Lbl_878a
	inc $13
	inx 
	cpx #$04
	bcc Lbl_878a
	rts 

Lbl_879a:
	ldx #$00

Lbl_879c:
	lda Lbl_87a8,x
	sta $0220,x
	inx 
	cpx #$20
	bne Lbl_879c
	rts 

Lbl_87a8:
	.byte $20,$21,$11,$16,$20,$38,$27,$0f,$20,$10,$26,$1f,$20,$10,$00,$0f
	.byte $20,$36,$17,$0f,$20,$10,$27,$0f,$20,$11,$0f,$0f,$20,$0f,$0f,$0f
	.byte $a2,$1c,$a9,$98,$9d,$00,$07,$a9,$a8,$9d,$20,$07,$a9,$cf,$9d,$40
	.byte $07,$a9,$16,$9d,$60,$07,$8a,$0a,$69,$60,$9d,$03,$07,$9d,$23,$07
	.byte $18,$69,$20,$9d,$43,$07,$ca,$ca,$ca,$ca,$10,$d6,$a2,$00,$a0,$00
	.byte $b9,$3a,$88,$9d,$01,$07,$a9,$00,$9d,$02,$07,$c8,$e8,$e8,$e8,$e8
	.byte $e0,$80,$90,$ec,$a0,$00,$a2,$00,$b9,$5a,$88,$9d,$63,$07,$c8,$e8
	.byte $e8,$e8,$e8,$e0,$20,$90,$f1,$ad,$02,$20,$a9,$23,$8d,$06,$20,$a9
	.byte $49,$8d,$06,$20,$a0,$00,$b9,$62,$88,$8d,$07,$20,$c8,$c0,$06,$90
	.byte $f5,$60,$31,$50,$4c,$41,$59,$45,$52,$40,$32,$50,$4c,$41,$59,$45
	.byte $52,$53,$4a,$41,$4c,$45,$43,$4f,$40,$40,$31,$50,$54,$4f,$50,$32
	.byte $50,$40,$28,$30,$78,$80,$88,$c8,$d0,$f8,$3d,$40,$31,$39,$38,$35

Lbl_8868:
	.byte $40,$50,$4c,$41,$59,$45,$52,$a5,$37,$85,$10,$a5,$38,$85,$11,$20
	.byte $c2,$88,$a9,$20,$8d,$06,$20,$a9,$83,$8d,$06,$20,$20,$b4,$88,$a5
	.byte $3b,$85,$10,$a5,$3c,$85,$11,$20,$c2,$88,$a9,$20,$8d,$06,$20,$a9
	.byte $8d,$8d,$06,$20,$20,$b4,$88,$a5,$39,$85,$10,$a5,$3a,$85,$11,$20
	.byte $c2,$88,$a9,$20,$8d,$06,$20,$a9,$97,$8d,$06,$20,$a2,$00,$bd,$00
	.byte $02,$8d,$07,$20,$e8,$e0,$06,$90,$f5,$60,$20,$c0,$a1,$a5,$15,$20
	.byte $f7,$88,$8e,$00,$02,$8c,$01,$02,$a5,$14,$20,$f7,$88,$8e,$02,$02
	.byte $8c,$03,$02,$a9,$30,$8d,$04,$02,$8d,$05,$02,$a2,$00,$bd,$00,$02
	.byte $c9,$30,$d0,$0a,$a9,$40,$9d,$00,$02,$e8,$e0,$04,$90,$ef,$60,$48
	.byte $20,$89,$a3,$09,$30,$aa,$68,$29,$0f,$09,$30,$a8,$60

Lbl_8905:
	lda #$10
	sta $20
	sta $2000
	lda #$00
	sta $21
	sta $2001
	sta $5f
	sta $5a
	sta $5b
	sta $27
	pla 
	pla 
	jsr Lbl_85be
	lda #$00
	sta $a2
	sta $61
	jmp Lbl_d08b

Lbl_8929:
	lda #$03
	sta $67
	lda #$80
	sta $5f
	lda #$90
	sta $20
	sta $2000

Lbl_8938:
	lda $1d
	and #$0c
	bne Lbl_8938
	lda #$00
	sta $34

Lbl_8942:
	lda $34
	cmp #$02
	bcs Lbl_8905
	lda $1d
	pha 
	and #$08
	bne Lbl_895d
	pla 
	and #$04
	beq Lbl_8942
	lda $5e
	eor #$80
	sta $5e
	jmp Lbl_8938

Lbl_895d:
	pla 
	lda #$10
	sta $2000
	lda #$00
	sta $5f
	pla 
	pla 
	jmp Lbl_d076

Lbl_896c:
	lda #$00
	sta $2001
	lda $2002
	lda $5e
	bpl Lbl_8998
	lda #$22
	sta $2006
	lda #$4a
	sta $2006
	lda #$00
	sta $2007
	lda #$22
	sta $2006
	lda #$8a
	sta $2006
	ldx #$e2
	stx $2007
	bne Lbl_89b6

Lbl_8998:
	lda #$22
	sta $2006
	lda #$4a
	sta $2006
	ldx #$e2
	stx $2007
	lda #$22
	sta $2006
	lda #$8a
	sta $2006
	lda #$00
	sta $2007

Lbl_89b6:
	lda #$1e
	sta $2001
	jmp Lbl_820a

Lbl_89be:
	lda $1d
	and #$08
	beq Lbl_8a0a
	eor $1f
	and #$08
	beq Lbl_8a0a
	lda $62
	bpl Lbl_89d4
	ldx #$ff
	txs 
	jmp Lbl_d03e

Lbl_89d4:
	bit $60
	bvs Lbl_89e7
	lda #$40
	sta $60
	sta $5f
	jsr Lbl_a38e
	ldy #$06
	jsr Lbl_a60a
	rts 

Lbl_89e7:
	lda #$00
	sta $60
	sta $5f
	jsr Lbl_8a35
	jsr Lbl_a38e
	lda $63
	and #$1e
	cmp #$02
	beq Lbl_8a0b
	cmp #$04
	beq Lbl_8a0e
	cmp #$10
	beq Lbl_8a0a
	cmp #$08
	beq Lbl_8a11
	jsr Lbl_a572

Lbl_8a0a:
	rts 

Lbl_8a0b:
	jmp Lbl_a5c1

Lbl_8a0e:
	jmp Lbl_a5c5

Lbl_8a11:
	jmp Lbl_a5cc

Lbl_8a14:
	ldx #$13

Lbl_8a16:
	lda Lbl_8a3d,x
	sta $0700,x
	dex 
	bpl Lbl_8a16
	lda $33
	lsr a 
	bcc Lbl_8a34
	ldy #$04
	ldx #$00
	lda #$f0

Lbl_8a2a:
	sta $0700,x
	inx 
	inx 
	inx 
	inx 
	dey 
	bpl Lbl_8a2a

Lbl_8a34:
	rts 

Lbl_8a35:
	lda #$f0
	ldy #$04
	ldx #$00
	beq Lbl_8a2a

Lbl_8a3d:
	.byte $20,$b7,$00,$70,$20,$b8,$00,$78,$20,$b9,$00,$80,$20,$ba,$00,$88
	.byte $20,$bb,$00,$90

Lbl_8a51:
	ldx #$c0

Lbl_8a53:
	lsr $10
	lsr $10
	dex 
	bne Lbl_8a53
	rts 

Lbl_8a5b:
	lda $61
	lsr a 
	bcs Lbl_8a73
	jsr Lbl_8a90
	jsr Lbl_8aae
	lda $a2
	bpl Lbl_8a86
	jsr Lbl_8aa4
	lda $a2
	bpl Lbl_8a8a
	sec 
	rts 

Lbl_8a73:
	jsr Lbl_8a9a
	jsr Lbl_8aa4
	lda $a2
	bpl Lbl_8a8a
	jsr Lbl_8aae
	lda $a2
	bpl Lbl_8a86
	sec 
	rts 

Lbl_8a86:
	lda #$01
	bne Lbl_8a8c

Lbl_8a8a:
	lda #$00

Lbl_8a8c:
	sta $61
	clc 
	rts 

Lbl_8a90:
	ldx #$1f

Lbl_8a92:
	lda $a0,x
	sta $c0,x
	dex 
	bpl Lbl_8a92
	rts 

Lbl_8a9a:
	ldx #$1f

Lbl_8a9c:
	lda $a0,x
	sta $e0,x
	dex 
	bpl Lbl_8a9c
	rts 

Lbl_8aa4:
	ldx #$1f

Lbl_8aa6:
	lda $c0,x
	sta $a0,x
	dex 
	bpl Lbl_8aa6
	rts 

Lbl_8aae:
	ldx #$1f

Lbl_8ab0:
	lda $e0,x
	sta $a0,x
	dex 
	bpl Lbl_8ab0
	rts 

Lbl_8ab8:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$36,$38,$3a,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$07,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$ab,$33,$34,$37,$39,$3b,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$04,$05,$06,$08,$09,$0a,$0b,$0c,$00,$00
	.byte $00,$00,$00,$00,$00,$2b,$2d,$2e,$31,$32,$35,$00,$00,$3c,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$0d,$0e,$0f,$10,$11,$12,$13,$14,$00,$00
	.byte $00,$00,$26,$27,$2a,$2c,$2f,$30,$51,$52,$00,$00,$00,$3c,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$15,$16,$17,$18,$19,$1a,$1b,$1c,$00,$00
	.byte $00,$25,$28,$29,$4d,$4e,$4f,$50,$53,$54,$00,$00,$00,$3c,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$1d,$1e,$1f,$20,$21,$22,$23,$24,$00,$00
	.byte $ac,$47,$48,$4b,$55,$56,$57,$58,$59,$5a,$5b,$00,$00,$3c,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$3d,$3e,$3f,$40,$41,$42,$43,$44,$45
	.byte $46,$49,$4a,$4c,$5c,$5d,$5e,$5f,$60,$00,$00,$00,$00,$3c,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$61,$62,$63,$64,$65,$66,$67,$68,$69,$6a
	.byte $6b,$6c,$6d,$6e,$6f,$70,$71,$00,$00,$00,$00,$00,$00,$3c,$00,$00
	.byte $00,$00,$00,$72,$73,$74,$75,$76,$77,$78,$79,$7a,$7b,$7c,$7d,$7e
	.byte $7f,$80,$81,$82,$00,$00,$00,$00,$00,$00,$00,$00,$00,$3c,$00,$00
	.byte $00,$00,$83,$84,$85,$86,$87,$88,$89,$8a,$8b,$8c,$8d,$8e,$8f,$90
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$3c,$00,$00
	.byte $00,$00,$91,$92,$00,$93,$94,$95,$96,$97,$98,$99,$9a,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$3c,$00,$00
	.byte $00,$00,$9b,$9c,$00,$9d,$9e,$9f,$a0,$a1,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$3c,$00,$00
	.byte $00,$00,$a2,$a3,$a4,$a5,$ad,$ae,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$3c,$00,$00
	.byte $00,$00,$00,$a6,$a7,$a8,$a9,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$aa,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$af,$b0,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$b1,$b2,$b3,$b4,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$e5,$00,$e7,$e8,$e9
	.byte $ea,$eb,$ec,$00,$00,$00,$00,$b5,$b6,$b7,$b8,$b9,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$ba,$bb,$bc,$bd,$be,$bf,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$e6,$00,$e7,$e8,$e9
	.byte $ea,$eb,$ec,$ed,$00,$00,$00,$c0,$c1,$00,$00,$c2,$c3,$c4,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$c5,$c6,$c7,$c8,$c9,$ca,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$cb,$cc,$cd,$cf,$d0,$d1,$d2,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$d3,$d4,$d5,$d6,$00,$00,$d9,$da,$00,$00
	.byte $00,$00,$00,$00,$f2,$f3,$f4,$f5,$f6,$f7,$f8,$f9,$f1,$00,$fa,$00
	.byte $fb,$e9,$e0,$eb,$fc,$fd,$00,$ee,$ef,$f0,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$fe,$ff,$00,$e9,$d7,$d8,$00,$fa,$00,$ee,$ef,$f0,$00
	.byte $fb,$e9,$e0,$eb,$fc,$fd,$00,$fc,$fd,$db,$e0,$fe,$d8,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$e0,$dc,$fc,$eb,$d7,$ed,$eb,$d8
	.byte $00,$dd,$ea,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$d7,$dc,$d7,$fe,$eb,$d7,$d8,$fd,$00,$fd,$de
	.byte $00,$e9,$ff,$eb,$ec,$dc,$df,$e9,$00,$dc,$d7,$fc,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$40,$55,$20,$00,$00,$00,$00,$00,$84,$a9,$22
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

Lbl_8eb8:
	lda $5e
	bpl Lbl_8ee2
	ldy #$00

Lbl_8ebe:
	lda Lbl_8f07,y
	cmp #$ff
	beq Lbl_8ee1
	sta $0704,y
	iny 
	lda Lbl_8f07,y
	sta $0704,y
	iny 
	lda Lbl_8f07,y
	sta $0704,y
	iny 
	lda Lbl_8f07,y
	sta $0704,y
	iny 
	jmp Lbl_8ebe

Lbl_8ee1:
	rts 

Lbl_8ee2:
	ldy #$00

Lbl_8ee4:
	lda Lbl_8f64,y
	cmp #$ff
	beq Lbl_8ee1
	sta $0704,y
	iny 
	lda Lbl_8f64,y
	sta $0704,y
	iny 
	lda Lbl_8f64,y
	sta $0704,y
	iny 
	lda Lbl_8f64,y
	sta $0704,y
	iny 
	jmp Lbl_8ee4

Lbl_8f07:
	.byte $8f,$04,$00,$c8,$8f,$06,$00,$d8,$97,$08,$00,$c8,$97,$0a,$00,$d8
	.byte $9f,$0c,$01,$b0,$9f,$0e,$01,$c0,$9f,$10,$00,$d0,$9f,$12,$01,$de
	.byte $a7,$14,$01,$b8,$a7,$16,$00,$c8,$af,$18,$01,$b7,$9f,$24,$00,$c0
	.byte $8f,$05,$00,$d0,$97,$07,$00,$c0,$97,$09,$00,$d0,$97,$0b,$01,$b4
	.byte $9f,$0d,$01,$b8,$9f,$0f,$00,$c8,$9f,$11,$00,$d8,$a7,$13,$01,$b0
	.byte $a7,$15,$01,$c0,$a7,$17,$00,$d0,$af,$19,$01,$bf,$ff

Lbl_8f64:
	.byte $8f,$04,$00,$c8,$8f,$06,$00,$d8,$97,$08,$00,$c8,$97,$0a,$00,$d8
	.byte $9f,$0f,$00,$c8,$9f,$11,$00,$d8,$a7,$16,$00,$c8,$9f,$1a,$01,$a8
	.byte $9f,$1c,$01,$b8,$a7,$1e,$01,$b5,$af,$20,$01,$b0,$af,$22,$01,$c0
	.byte $8f,$05,$00,$d0,$97,$07,$00,$c0,$97,$09,$00,$d0,$9f,$24,$00,$c0
	.byte $9f,$23,$00,$d0,$9f,$12,$01,$de,$a7,$17,$00,$d0,$9f,$1b,$01,$b0
	.byte $a7,$1d,$01,$ad,$a7,$1f,$01,$bd,$af,$21,$01,$b8,$ff

Lbl_8fc1:
	lda #$f9
	sta $10
	lda #$8f
	sta $11
	lda #$21
	ldy #$0a
	jsr Lbl_8fdf
	lda #$0a
	sta $10
	lda #$90
	sta $11
	lda #$21
	ldy #$4a
	jmp Lbl_8fdf

Lbl_8fdf:
	ldx $2002
	sta $2006
	sty $2006
	ldy #$00
	lda ($10),y
	sta $12

Lbl_8fee:
	iny 
	lda ($10),y
	sta $2007
	cpy $12
	bne Lbl_8fee
	rts 

Lbl_8ff9:
	.byte $10,$41,$47,$45,$4c,$4a,$00,$48,$47,$43,$45,$4b,$4a,$00,$42,$47
	.byte $49,$0c,$00,$47,$43,$44,$00,$00,$00,$3d,$31,$30,$30,$3e

Lbl_9017:
	ldx #$40
	lda #$40
	sta $0600,x
	lda #$80
	sta $0603,x
	sta $2f
	lda #$28
	sta $30
	lda #$00
	sta $31
	sta $32
	sta $66
	rts 

Lbl_9032:
	ldx #$40
	jsr Lbl_90c8
	jsr Lbl_9234
	rts 

Lbl_903b:
	.byte $20,$9f,$91,$d0,$0c,$a5,$2f,$29,$cf,$85,$2f,$a5,$32,$29,$3f,$85
	.byte $32,$24,$32,$70,$46,$a5,$33,$29,$1f,$f0,$40,$d0,$41

Lbl_9058:
	lda $31
	bmi Lbl_90b8
	and #$04
	bne Lbl_9064
	lda #$20
	bne Lbl_909e

Lbl_9064:
	lda #$22
	bne Lbl_909e

Lbl_9068:
	cmp #$10
	bne Lbl_903b
	dec $31
	lda $32
	bmi Lbl_9058
	lda $0600,x
	sec 
	sbc #$10
	jsr Lbl_91a2
	bne Lbl_908c
	lda $32
	ora #$80
	sta $32
	lda #$10
	sta $31
	ldy #$0c
	jsr Lbl_a60a

Lbl_908c:
	lda $31
	bmi Lbl_90b8
	cmp #$1c
	bcs Lbl_90b1
	bcc Lbl_90ad
	inc $0600,x
	inc $0600,x
	lda #$1e

Lbl_909e:
	pha 
	lda $2e
	bpl Lbl_90a5
	eor #$ff

Lbl_90a5:
	cmp #$10
	bcc Lbl_9113
	pla 
	jmp Lbl_918c

Lbl_90ad:
	lda #$1a
	bne Lbl_909e

Lbl_90b1:
	dec $0600,x
	lda #$18
	bne Lbl_909e

Lbl_90b8:
	lda $32
	and #$3f
	sta $32
	lda $2f
	and #$ef
	ora #$20
	sta $2f
	bne Lbl_90ad

Lbl_90c8:
	lda $2f
	and #$30
	bne Lbl_9068
	lda $2f
	and #$cd
	sta $2f
	jsr Lbl_919f
	beq Lbl_90ed
	lda $2f
	ora #$20
	sta $2f
	lda $19
	and #$20
	beq Lbl_90f0
	lda $32
	ora #$40
	sta $32
	bne Lbl_90f0

Lbl_90ed:
	jsr Lbl_95b2

Lbl_90f0:
	lda ($10),y
	cmp #$3d
	bne Lbl_90fa
	lda #$3e
	sta ($10),y

Lbl_90fa:
	lda $2e
	bpl Lbl_9100
	eor #$ff

Lbl_9100:
	cmp #$10
	bcc Lbl_9114
	jsr Lbl_9137
	lda $33
	and #$0c
	lsr a 
	bit $2f
	bmi Lbl_9112
	ora #$01

Lbl_9112:
	rts 

Lbl_9113:
	pla 

Lbl_9114:
	lda #$00
	sta $30
	lda $2f
	bpl Lbl_9127
	lda $2e
	clc 
	adc #$11
	lsr a 
	tay 
	lda Lbl_920c,y
	rts 

Lbl_9127:
	lda $2e
	clc 
	adc #$11
	lsr a 
	tay 
	lda Lbl_921c,y
	rts 

Lbl_9132:
	.byte $a5,$19,$85,$66,$60

Lbl_9137:
	lda $30
	cmp #$10
	bcc Lbl_917b
	cmp #$18
	bcc Lbl_9182
	cmp #$20
	bcc Lbl_9193
	cmp #$28
	bcc Lbl_9182
	lda $19
	and #$02
	beq Lbl_9132
	lda $66
	and #$02
	bne Lbl_9132
	lda $19
	sta $66
	lda $2f
	ora #$12
	sta $2f
	ldy #$0e
	jsr Lbl_a60a
	lda $19
	and #$10
	bne Lbl_916f

Lbl_916a:
	lda #$34
	sta $31
	rts 

Lbl_916f:
	lda $0600,x
	cmp #$50
	bcc Lbl_916a
	lda #$50
	sta $31
	rts 

Lbl_917b:
	inc $30
	lda #$00
	sta $66
	rts 

Lbl_9182:
	inc $30
	lda #$00
	sta $66
	pla 
	pla 
	lda #$08

Lbl_918c:
	bit $2f
	bmi Lbl_9192
	ora #$01

Lbl_9192:
	rts 

Lbl_9193:
	inc $30
	lda #$00
	sta $66
	pla 
	pla 
	lda #$0a
	bne Lbl_918c

Lbl_919f:
	lda $0600,x

Lbl_91a2:
	and #$fc
	cmp #$40
	beq Lbl_91be
	cmp #$70
	beq Lbl_91c2
	cmp #$a0
	beq Lbl_91c6
	cmp #$d0
	beq Lbl_91ca
	bcc Lbl_9202
	lda #$d0
	sta $0600,x
	lda #$00
	rts 

Lbl_91be:
	ldy #$00
	beq Lbl_91cc

Lbl_91c2:
	ldy #$02
	bne Lbl_91cc

Lbl_91c6:
	ldy #$04
	bne Lbl_91cc

Lbl_91ca:
	ldy #$06

Lbl_91cc:
	lda Lbl_922c,y
	sta $10
	lda Lbl_922d,y
	sta $11
	lda $0603,x
	lsr a 
	lsr a 
	lsr a 
	clc 
	adc $64
	and #$7f
	tay 
	lda ($10),y
	cmp #$3d
	beq Lbl_9201
	cmp #$3e
	beq Lbl_9201
	bit $2e
	bpl Lbl_9205
	tya 
	sec 
	sbc #$01

Lbl_91f4:
	and #$7f
	tay 
	lda ($10),y
	cmp #$3d
	beq Lbl_9201
	cmp #$3e
	beq Lbl_9201

Lbl_9201:
	rts 

Lbl_9202:
	lda #$ff
	rts 

Lbl_9205:
	tya 
	clc 
	adc #$01
	jmp Lbl_91f4

Lbl_920c:
	.byte $0d,$0d,$0d,$0f,$0f,$0f,$11,$11,$13,$13,$15,$15,$15,$17,$17,$17

Lbl_921c:
	.byte $16,$16,$16,$14,$14,$12,$12,$12,$10,$10,$0e,$0e,$0e,$0c,$0c,$0c

Lbl_922c:
	.byte $00

Lbl_922d:
	.byte $03,$80,$03,$00,$04,$80,$04

Lbl_9234:
	pha 
	jsr Lbl_928a
	pla 
	asl a 
	asl a 
	asl a 
	tay 
	lda #$05
	sta $12
	lda $0600,x
	sta $10
	lda $0603,x
	sta $11
	lda ($16),y
	sta $15
	iny 
	txa 
	pha 

Lbl_9252:
	tya 
	pha 
	lda $12
	asl a 
	tay 
	lda Lbl_92a0,y
	sta $13
	lda Lbl_92a1,y
	sta $14
	pla 
	tay 
	lda $10
	clc 
	adc $13
	sta $0700,x
	inx 
	lda ($16),y
	sta $0700,x
	iny 
	inx 
	lda $15
	sta $0700,x
	inx 
	lda $11
	clc 
	adc $14
	sta $0700,x
	inx 
	dec $12
	bpl Lbl_9252
	pla 
	tax 
	rts 

Lbl_928a:
	cmp #$20
	bcs Lbl_9297
	lda #$ac
	sta $16
	lda #$92
	sta $17
	rts 

Lbl_9297:
	lda #$ac
	sta $16
	lda #$93
	sta $17
	rts 

Lbl_92a0:
	.byte $00

Lbl_92a1:
	.byte $08,$00,$00,$00,$f8,$f8,$08,$f8,$00,$f8,$f8,$00,$60,$61,$65,$62
	.byte $63,$64,$00,$40,$65,$61,$60,$64,$63,$62,$00,$00,$66,$67,$65,$68
	.byte $63,$6a,$00,$40,$65,$67,$66,$6a,$63,$68,$00,$00,$6b,$6c,$65,$6d
	.byte $63,$6f,$00,$40,$65,$6c,$6b,$6f,$63,$6d,$00,$00,$70,$71,$65,$72
	.byte $63,$74,$00,$40,$65,$71,$70,$74,$63,$72,$00,$00,$7b,$7c,$7d,$0c
	.byte $0d,$0e,$00,$40,$7d,$7c,$7b,$0e,$0d,$0c,$00,$00,$75,$76,$77,$79
	.byte $7a,$40,$00,$40,$77,$76,$75,$40,$7a,$79,$00,$00,$7e,$7f,$80,$81
	.byte $82,$83,$00,$40,$80,$7f,$7e,$83,$82,$81,$00,$00,$84,$85,$86,$87
	.byte $88,$89,$00,$40,$86,$85,$84,$89,$88,$87,$00,$00,$8a,$8c,$8d,$8b
	.byte $8e,$8f,$00,$40,$8d,$8c,$8a,$8f,$8e,$8b,$00,$00,$9c,$9d,$9e,$9f
	.byte $a0,$a1,$00,$40,$9e,$9d,$9c,$a1,$a0,$9f,$00,$00,$96,$97,$98,$99
	.byte $9a,$9b,$00,$40,$98,$97,$96,$9b,$9a,$99,$00,$00,$90,$91,$92,$93
	.byte $94,$95,$00,$40,$92,$91,$90,$95,$94,$93,$00,$00,$a2,$a3,$a4,$a5
	.byte $a6,$a7,$00,$40,$a4,$a3,$a2,$a7,$a6,$a5,$00,$00,$a8,$a9,$ac,$aa
	.byte $ab,$ad,$00,$40,$ac,$a9,$a8,$ad,$ab,$aa,$00,$00,$b7,$b8,$b9,$ba
	.byte $bb,$bc,$00,$40,$b9,$b8,$b7,$bc,$bb,$ba,$00,$00,$bd,$be,$bf,$c0
	.byte $c1,$1f,$00,$40,$bf,$be,$bd,$1f,$c1,$c0,$00,$00,$ae,$af,$b0,$b1
	.byte $b2,$b3,$00,$40,$b0,$af,$ae,$b3,$b2,$b1,$00,$00,$40,$40,$40,$b4
	.byte $b5,$b6,$00,$40,$40,$40,$40,$b6,$b5,$b4,$00

Lbl_93cc:
	jsr Lbl_93f2
	ldx #$78
	jsr Lbl_94d3
	jsr Lbl_9510
	ldx #$7c
	jsr Lbl_94d3
	jsr Lbl_9510
	lda $a4
	bpl Lbl_93e7
	lda #$00
	sta $a4

Lbl_93e7:
	rts 

Lbl_93e8:
	.byte $a5,$2c,$d0,$50,$a9,$40,$85,$2c,$d0,$4a

Lbl_93f2:
	lda $2e
	bpl Lbl_93f8
	eor #$ff

Lbl_93f8:
	cmp #$04
	bcs Lbl_9451
	lda $0679
	ora $067d
	bmi Lbl_9451
	lda $19
	lsr a 
	bcc Lbl_946a
	lda $1a
	lsr a 
	bcs Lbl_946a
	lda $a4
	bne Lbl_941a
	lda $2d
	bne Lbl_946a
	lda #$80
	sta $2d

Lbl_941a:
	lda $a0
	cmp #$02
	beq Lbl_93e8
	cmp #$04
	bne Lbl_943c
	lda $2c
	bne Lbl_943c
	lda $25
	and #$01
	beq Lbl_943c
	lda $24
	cmp #$38
	bcc Lbl_943c
	cmp #$48
	bcs Lbl_943c
	lda #$80
	sta $2c

Lbl_943c:
	ldx #$78
	jsr Lbl_94a4
	lda #$80
	sta $0602,x
	ldx #$7c
	jsr Lbl_94a4
	lda #$40
	sta $0602,x
	rts 

Lbl_9451:
	lda $a4
	beq Lbl_946a
	ldx #$78
	lda $0601,x
	bmi Lbl_9460
	jsr Lbl_9489
	rts 

Lbl_9460:
	ldx #$7c
	lda $0601,x
	bmi Lbl_946a
	jsr Lbl_9489

Lbl_946a:
	rts 

Lbl_946b:
	.byte $29,$02,$d0,$07,$a9,$20,$9d,$02,$06,$d0,$2e,$a5,$31,$c9,$20,$90
	.byte $1d,$a9,$a0,$24,$2e,$10,$02,$a9,$60,$9d,$02,$06,$b0,$1b

Lbl_9489:
	lda $19
	lsr a 
	bcc Lbl_94cb
	lda $1a
	lsr a 
	bcs Lbl_94cb
	lda $2f
	and #$32
	bne Lbl_946b
	lda #$80
	bit $2e
	bpl Lbl_94a1
	lda #$40

Lbl_94a1:
	sta $0602,x

Lbl_94a4:
	lda #$80
	sta $0601,x
	lda $0640
	sec 
	sbc #$04
	sta $0600,x
	lda $0643
	sta $0603,x
	lda #$1d
	sta $0701,x
	lda #$02
	sta $0702,x
	dec $a4
	ldy #$04
	jsr Lbl_a60a
	inc $aa

Lbl_94cb:
	rts 

Lbl_94cc:
	.byte $fe,$00,$06,$fe,$00,$06,$60

Lbl_94d3:
	lda $0601,x
	bpl Lbl_9500
	lda $0603,x
	cmp #$f8
	bcs Lbl_9505
	lda $0600,x
	cmp #$f0
	bcs Lbl_9505
	jsr Lbl_919f
	beq Lbl_9505
	lda $0602,x
	tay 
	cmp #$20
	beq Lbl_94cc
	and #$20
	beq Lbl_94fa
	inc $0600,x

Lbl_94fa:
	tya 
	bmi Lbl_9501
	dec $0603,x

Lbl_9500:
	rts 

Lbl_9501:
	inc $0603,x
	rts 

Lbl_9505:
	lda #$00
	sta $0601,x
	lda #$f8
	sta $0600,x
	rts 

Lbl_9510:
	lda $0600,x
	sta $0700,x
	lda $0603,x
	sta $0703,x
	rts 

Lbl_951d:
	ldy #$40
	lda #$00
	sta $0604,y
	lda #$04
	sta $63
	jsr Lbl_a38e
	jsr Lbl_a62f
	rts 

Lbl_952f:
	ldx #$40
	lda $33
	lsr a 
	bcs Lbl_9539
	inc $0604,x

Lbl_9539:
	lda $0604,x
	cmp #$90
	bcs Lbl_956f
	cmp #$20
	bcc Lbl_9574
	beq Lbl_957c
	cmp #$40
	bcc Lbl_9578
	ldy #$18

Lbl_954c:
	txa 
	pha 

Lbl_954e:
	lda Lbl_958e,y
	clc 
	adc $0700,x
	sta $0700,x
	iny 
	lda Lbl_958e,y
	clc 
	adc $0703,x
	sta $0703,x
	iny 
	inx 
	inx 
	inx 
	inx 
	cpx #$58
	bcc Lbl_954e
	pla 
	tax 
	rts 

Lbl_956f:
	lda #$01
	sta $63
	rts 

Lbl_9574:
	ldy #$00
	beq Lbl_954c

Lbl_9578:
	ldy #$0c
	bne Lbl_954c

Lbl_957c:
	jsr Lbl_a5c5
	ldy #$05
	lda #$1a

Lbl_9583:
	sta $0701,x
	inx 
	inx 
	inx 
	inx 
	dey 
	bpl Lbl_9583
	rts 

Lbl_958e:
	.byte $ff,$ff,$ff,$00,$ff,$01,$00,$ff,$00,$00,$00,$01,$00,$ff,$00,$00
	.byte $00,$01,$01,$00,$00,$00,$01,$00,$01,$01,$01,$00,$01,$ff,$01,$01
	.byte $00,$00,$01,$ff

Lbl_95b2:
	lda $2e
	bpl Lbl_95b8
	eor #$ff

Lbl_95b8:
	cmp #$10
	bcc Lbl_95da
	lda $33
	and #$03
	bne Lbl_95da
	lda $a5
	clc 
	adc #$01
	sta $a5
	lda $a6
	adc #$00
	sta $a6
	lda $33
	and #$3f
	bne Lbl_95da
	lda #$01
	jsr Lbl_a244

Lbl_95da:
	rts 

Lbl_95db:
	ldx #$58
	lda $64
	and #$1f
	bne Lbl_95e6
	jsr Lbl_9612

Lbl_95e6:
	jsr Lbl_9651
	lda $0600,x
	sta $0700,x
	lda $0603,x
	sta $0703,x
	ldx #$5c
	lda $64
	and #$1f
	cmp #$10
	bne Lbl_9602
	jsr Lbl_9612

Lbl_9602:
	jsr Lbl_9651
	lda $0600,x
	sta $0700,x
	lda $0603,x
	sta $0703,x

Lbl_9611:
	rts 

Lbl_9612:
	lda $0601,x
	bmi Lbl_9611
	lda $27
	and #$03
	asl a 
	tay 
	jsr Lbl_96ba
	beq Lbl_9645
	ldy #$03

Lbl_9624:
	lda Lbl_964d,y
	sta $0600,x
	lda #$ec
	bit $2e
	bpl Lbl_9632
	lda #$04

Lbl_9632:
	sta $0603,x
	lda #$1e
	sta $0701,x
	lda #$02
	sta $0702,x
	lda #$80
	sta $0601,x
	rts 

Lbl_9645:
	lda $27
	and #$03
	tay 
	jmp Lbl_9624

Lbl_964d:
	.byte $40,$70,$a0,$d0

Lbl_9651:
	lda $0601,x
	bpl Lbl_9674
	jsr Lbl_965a
	rts 

Lbl_965a:
	lda $0603,x
	cmp #$f8
	bcs Lbl_968d
	jsr Lbl_969b
	bcc Lbl_9680

Lbl_9666:
	lda $2e
	bmi Lbl_9675
	cmp #$08
	bcc Lbl_9674
	dec $0603,x
	dec $0603,x

Lbl_9674:
	rts 

Lbl_9675:
	cmp #$f8
	bcs Lbl_9674
	inc $0603,x
	inc $0603,x
	rts 

Lbl_9680:
	ldy #$00
	jsr Lbl_a60a
	lda $a4
	cmp #$63
	bcs Lbl_968d
	inc $a4

Lbl_968d:
	lda #$f8
	sta $0700,x
	sta $0600,x
	lda #$00
	sta $0601,x
	rts 

Lbl_969b:
	ldy #$40

Lbl_969d:
	lda $0600,y
	sec 
	sbc $0600,x
	bcs Lbl_96a8
	eor #$ff

Lbl_96a8:
	cmp #$08
	bcs Lbl_96b9
	lda $0603,y
	sec 
	sbc $0603,x
	bcs Lbl_96b7
	eor #$ff

Lbl_96b7:
	cmp #$10

Lbl_96b9:
	rts 

Lbl_96ba:
	lda Lbl_922c,y
	sta $10
	lda Lbl_922d,y
	sta $11
	lda $64
	bit $2e
	bmi Lbl_96cd
	clc 
	adc #$1e

Lbl_96cd:
	and #$7f
	tay 
	lda ($10),y
	cmp #$3d
	beq Lbl_96db
	cmp #$3e
	beq Lbl_96db
	rts 

Lbl_96db:
	iny 
	tya 
	and #$7f
	tay 
	lda ($10),y
	cmp #$3d
	beq Lbl_96b9
	cmp #$3e
	beq Lbl_96b9
	rts 

Lbl_96eb:
	ldx #$b0
	jsr Lbl_970b
	jsr Lbl_9799
	jsr Lbl_97ea
	rts 

Lbl_96f7:
	.byte $a5,$34,$29,$01,$c9,$01,$d0,$29,$a5,$33,$d0,$25,$a5,$27,$29,$06
	.byte $a8,$4c,$21,$97

Lbl_970b:
	lda $0601,x
	bmi Lbl_9728
	lda $29
	cmp #$20
	bcc Lbl_96f7
	lda $33
	and #$7f
	cmp #$10
	bne Lbl_9728
	jsr Lbl_9817
	sty $16
	jsr Lbl_96ba
	beq Lbl_9729

Lbl_9728:
	rts 

Lbl_9729:
	lda $16
	lsr a 
	tay 
	jsr Lbl_9624
	ldy #$00

Lbl_9732:
	txa 
	pha 
	lda #$03
	sta $10

Lbl_9738:
	lda Lbl_9751,y
	sta $0701,x
	iny 
	lda Lbl_9751,y
	sta $0702,x
	iny 
	inx 
	inx 
	inx 
	inx 
	dec $10
	bpl Lbl_9738
	pla 
	tax 
	rts 

Lbl_9751:
	.byte $16,$02,$17,$02,$14,$02,$15,$02,$12,$02,$13,$02,$10,$02,$11,$02
	.byte $13,$42,$12,$42,$11,$42,$10,$42,$2a,$00,$2b,$00,$28,$00,$29,$00
	.byte $2a,$03,$2b,$03,$28,$03,$29,$03,$22,$02,$23,$02,$20,$02,$21,$02
	.byte $22,$02,$23,$02,$20,$02,$21,$02,$40,$00,$1a,$00,$40,$00,$40,$00
	.byte $26,$20,$27,$20,$24,$20,$25,$20

Lbl_9799:
	lda $0601,x
	bpl Lbl_9728
	jsr Lbl_969b
	bcc Lbl_97c7
	lda $0603,x
	cmp #$f0
	bcs Lbl_97c4

Lbl_97aa:
	lda $2e
	bmi Lbl_97b9
	cmp #$08
	bcc Lbl_97b8
	dec $0603,x
	dec $0603,x

Lbl_97b8:
	rts 

Lbl_97b9:
	cmp #$f8
	bcs Lbl_97b8
	inc $0603,x
	inc $0603,x
	rts 

Lbl_97c4:
	jmp Lbl_9a0d

Lbl_97c7:
	jsr Lbl_a38e
	jsr Lbl_a5c1
	lda #$fc
	sta $0683
	sta $069b
	sta $061b
	sta $0663
	lda #$02
	sta $63
	ldy #$08
	bit $2e
	bmi Lbl_97e7
	ldy #$10

Lbl_97e7:
	jmp Lbl_9732

Lbl_97ea:
	lda $0601,x
	bpl Lbl_97b8
	lda $0600,x
	sta $0700,x
	sta $0704,x
	clc 
	adc #$f8
	sta $0708,x
	sta $070c,x
	lda $0603,x
	clc 
	adc #$fc
	sta $0703,x
	sta $070b,x
	clc 
	adc #$08
	sta $0707,x
	sta $070f,x
	rts 

Lbl_9817:
	lda $0640
	cmp #$48
	bcc Lbl_9829
	cmp #$78
	bcc Lbl_982c
	cmp #$a8
	bcc Lbl_982f
	ldy #$06
	rts 

Lbl_9829:
	ldy #$00
	rts 

Lbl_982c:
	ldy #$02
	rts 

Lbl_982f:
	ldy #$04
	rts 

Lbl_9832:
	ldx #$b0
	lda $0700,x
	cmp #$f0
	bcs Lbl_986f
	lda $0703,x
	cmp #$f8
	bcs Lbl_986f
	lda $33
	lsr a 
	bcs Lbl_985e
	txa 
	pha 
	ldy #$03
	bit $2e
	bmi Lbl_985f

Lbl_984f:
	dec $0700,x
	inc $0703,x
	inx 
	inx 
	inx 
	inx 
	dey 
	bpl Lbl_984f
	pla 
	tax 

Lbl_985e:
	rts 

Lbl_985f:
	dec $0700,x
	dec $0703,x
	inx 
	inx 
	inx 
	inx 
	dey 
	bpl Lbl_985f
	pla 
	txa 
	rts 

Lbl_986f:
	lda #$01
	sta $63
	rts 

Lbl_9874:
	jsr Lbl_9a3c
	ldx #$30
	jsr Lbl_9888
	jsr Lbl_98d8
	ldx #$38
	jsr Lbl_9888
	jsr Lbl_98d8
	rts 

Lbl_9888:
	lda $0601,x
	bmi Lbl_98c7
	lda $29
	cmp #$40
	bcc Lbl_98c7
	jsr Lbl_9817
	sty $16
	jsr Lbl_96ba
	beq Lbl_989e
	rts 

Lbl_989e:
	cpx #$30
	bne Lbl_98c8
	lda $33
	and #$7f
	cmp #$70
	bcc Lbl_98c7
	bit $2e
	bpl Lbl_98c7
	lda #$04

Lbl_98b0:
	sta $0603,x
	lda $16
	lsr a 
	tay 
	lda Lbl_964d,y
	sta $0600,x
	lda #$80
	sta $0601,x
	lda #$20
	sta $0604,x

Lbl_98c7:
	rts 

Lbl_98c8:
	lda $33
	and #$7f
	cmp #$10
	bcs Lbl_98c7
	bit $2e
	bmi Lbl_98c7
	lda #$ec
	bne Lbl_98b0

Lbl_98d8:
	lda $0601,x
	bpl Lbl_98c7
	lda $0603,x
	cmp #$f0
	bcs Lbl_994c
	and #$f0
	cmp #$80
	bne Lbl_98f8
	lda $2f
	and #$02
	beq Lbl_98f8
	lda #$00
	sta $29
	lda #$80
	sta $ab

Lbl_98f8:
	jsr Lbl_969b
	bcs Lbl_990e
	jsr Lbl_951d
	lda #$fc
	sta $0683
	sta $069b
	sta $061b
	sta $0663

Lbl_990e:
	jsr Lbl_97aa
	lda $0600,x
	sta $0700,x
	sec 
	sbc #$08
	sta $0704,x
	lda $0603,x
	sta $0703,x
	sta $0707,x
	lda #$03
	sta $0702,x
	sta $0706,x
	lda $0604,x
	beq Lbl_9941
	dec $0604,x
	lda #$1b
	sta $0701,x
	lda #$40
	sta $0705,x
	rts 

Lbl_9941:
	lda #$1c
	sta $0701,x
	lda #$1b
	sta $0705,x
	rts 

Lbl_994c:
	jmp Lbl_9a15

Lbl_994f:
	ldx #$c0
	jsr Lbl_9967
	jsr Lbl_99ae
	jsr Lbl_97ea
	rts 

Lbl_995b:
	.byte $24,$2d,$10,$13,$a0,$38,$20,$32,$97,$4c,$83,$99

Lbl_9967:
	lda $0601,x
	bmi Lbl_99a5
	lda $a0
	cmp #$02
	beq Lbl_995b
	lda $34
	and #$07
	cmp #$07
	bne Lbl_99a5
	lda $33
	bne Lbl_99a5

Lbl_997e:
	ldy #$18
	jsr Lbl_9732
	lda $27
	and #$03
	tay 
	lda Lbl_9a38,y
	sta $0600,x
	lda #$80
	sta $0601,x
	bit $27
	bvc Lbl_99a6
	lda #$ef
	pha 
	lda #$40
	pha 

Lbl_999d:
	pla 
	sta $0602,x
	pla 
	sta $0603,x

Lbl_99a5:
	rts 

Lbl_99a6:
	lda #$01
	pha 
	lda #$80
	pha 
	bne Lbl_999d

Lbl_99ae:
	lda $0601,x
	bpl Lbl_99a5
	lda $0603,x
	cmp #$f0
	bcs Lbl_9a0d
	jsr Lbl_969b
	bcc Lbl_99d5
	jsr Lbl_9a26
	lda $33
	and #$07
	bne Lbl_99a5
	lda $0602,x
	bmi Lbl_99d1
	dec $0603,x
	rts 

Lbl_99d1:
	inc $0603,x
	rts 

Lbl_99d5:
	inc $a9
	ldy #$12
	jsr Lbl_a60a
	lda #$0a
	jsr Lbl_a244
	lda $a9
	cmp #$03
	bcc Lbl_99fa
	lda #$10
	sta $63
	lda #$00
	sta $5c
	lda #$00
	sta $a9
	jsr Lbl_a38e
	jsr Lbl_9a0d
	rts 

Lbl_99fa:
	jsr Lbl_9a0d
	lda $a0
	cmp #$01
	bne Lbl_99a5
	lda $a4
	cmp #$0b
	bne Lbl_9a0c
	jmp Lbl_997e

Lbl_9a0c:
	rts 

Lbl_9a0d:
	lda #$f8
	sta $0708,x
	sta $070c,x

Lbl_9a15:
	lda #$f8
	sta $0600,x
	sta $0700,x
	sta $0704,x
	lda #$00
	sta $0601,x
	rts 

Lbl_9a26:
	lda $33
	and #$01
	bne Lbl_9a33
	lda $2e
	bmi Lbl_9a34
	dec $0603,x

Lbl_9a33:
	rts 

Lbl_9a34:
	inc $0603,x
	rts 

Lbl_9a38:
	.byte $30,$60,$90,$c0

Lbl_9a3c:
	lda $2f
	and #$02
	bne Lbl_9a5d
	lda $2a
	sta $2b
	jsr Lbl_9817
	sty $2a
	cpy $2b
	bne Lbl_9a5e
	lda $29
	cmp #$80
	bcs Lbl_9a5d
	lda $33
	and #$0f
	bne Lbl_9a5d
	inc $29

Lbl_9a5d:
	rts 

Lbl_9a5e:
	lda #$00
	sta $29
	rts 

Lbl_9a63:
	lda $a7
	and #$0f
	cmp #$0f
	bne Lbl_9a92
	lda $a4
	cmp #$12
	bne Lbl_9a92
	bit $2c
	bvc Lbl_9a92
	lda $0601,x
	bmi Lbl_9a92
	lda #$00
	sta $2c
	lda #$40
	sta $0600,x
	lda #$ec
	sta $0603,x
	lda #$80
	sta $0601,x
	ldy #$40
	jsr Lbl_9732

Lbl_9a92:
	rts 

Lbl_9a93:
	lda $0601,x
	bpl Lbl_9a92
	cmp #$ff
	beq Lbl_9a92
	lda $0603,x
	cmp #$f0
	bcs Lbl_9ab6
	dec $0603,x
	lda $33
	and #$03
	bne Lbl_9aaf
	inc $0600,x

Lbl_9aaf:
	jsr Lbl_9be8
	jsr Lbl_97ea
	rts 

Lbl_9ab6:
	jsr Lbl_9a0d
	lda #$ff
	sta $0601,x
	rts 

Lbl_9abf:
	ldx #$d0
	jsr Lbl_9a63
	jsr Lbl_9a93
	rts 

Lbl_9ac8:
	lda $a0
	beq Lbl_9ad8
	cmp #$02
	beq Lbl_9abf
	cmp #$05
	bne Lbl_9ad7
	jmp Lbl_9b3a

Lbl_9ad7:
	rts 

Lbl_9ad8:
	ldx #$d0
	jsr Lbl_9ae4
	jsr Lbl_9b16
	jsr Lbl_97ea

Lbl_9ae3:
	rts 

Lbl_9ae4:
	lda $0601,x
	bmi Lbl_9ae3
	lda $aa
	cmp #$0a
	bcc Lbl_9ae3
	bne Lbl_9b11
	lda $25
	and #$01
	beq Lbl_9b11
	lda $24
	cmp #$e0
	bcc Lbl_9b11
	lda #$28
	sta $0600,x
	lda #$04
	sta $0603,x
	lda #$80
	sta $0601,x
	ldy #$28
	jsr Lbl_9732

Lbl_9b11:
	lda #$0b
	sta $aa
	rts 

Lbl_9b16:
	lda $0601,x
	bpl Lbl_9ae3
	lda $0603,x
	cmp #$f0
	bcs Lbl_9b37
	jsr Lbl_969b
	bcc Lbl_9b30
	lda $33
	lsr a 
	bcs Lbl_9b2f
	inc $0603,x

Lbl_9b2f:
	rts 

Lbl_9b30:
	inc $a2
	ldy #$02
	jsr Lbl_a60a

Lbl_9b37:
	jmp Lbl_9a0d

Lbl_9b3a:
	ldx #$d0
	jsr Lbl_9b46
	jsr Lbl_9b6e
	jsr Lbl_97ea
	rts 

Lbl_9b46:
	lda $0601,x
	bmi Lbl_9b6d
	lda $ab
	bpl Lbl_9b6d
	lda #$20
	sta $0600,x
	lda #$ec
	sta $0603,x
	lda #$80
	sta $0601,x
	lda #$00
	sta $ab
	sta $0604,x
	sta $0605,x
	ldy #$30
	jsr Lbl_9732

Lbl_9b6d:
	rts 

Lbl_9b6e:
	lda $0601,x
	bpl Lbl_9b6d
	lda $0603,x
	cmp #$f0
	bcs Lbl_9ba8
	lda $0600,x
	cmp #$f0
	bcs Lbl_9ba8
	jsr Lbl_969b
	bcs Lbl_9b89
	jmp Lbl_99d5

Lbl_9b89:
	dec $0603,x
	lda $0605,x
	bne Lbl_9b9b
	jsr Lbl_9bab
	lda Lbl_9bd5,y
	sta $0605,x
	rts 

Lbl_9b9b:
	dec $0605,x
	beq Lbl_9ba4
	jsr Lbl_9bab
	rts 

Lbl_9ba4:
	inc $0604,x
	rts 

Lbl_9ba8:
	jmp Lbl_9a0d

Lbl_9bab:
	lda $0604,x
	asl a 
	tay 
	lda Lbl_9bd4,y
	and #$0f
	cmp #$01
	beq Lbl_9bc9
	cmp #$02
	beq Lbl_9bc6
	cmp #$0f
	beq Lbl_9bd0
	cmp #$0e
	beq Lbl_9bcd
	rts 

Lbl_9bc6:
	inc $0600,x

Lbl_9bc9:
	inc $0600,x
	rts 

Lbl_9bcd:
	dec $0600,x

Lbl_9bd0:
	dec $0600,x
	rts 

Lbl_9bd4:
	.byte $81

Lbl_9bd5:
	.byte $4c,$82,$30,$80,$04,$8e,$10,$8f,$20,$80,$04,$81,$20,$82,$10,$80
	.byte $04,$8e,$ff

Lbl_9be8:
	lda $2e
	bmi Lbl_9c02
	cmp #$08
	bcs Lbl_9bfa
	lda $33
	and #$07
	bne Lbl_9bf9

Lbl_9bf6:
	dec $0603,x

Lbl_9bf9:
	rts 

Lbl_9bfa:
	lda $33
	and #$01
	bne Lbl_9bf9
	beq Lbl_9bf6

Lbl_9c02:
	cmp #$f8
	bcc Lbl_9c10
	lda $33
	and #$07
	bne Lbl_9bf9

Lbl_9c0c:
	inc $0603,x
	rts 

Lbl_9c10:
	lda $33
	and #$01
	bne Lbl_9bf9
	beq Lbl_9c0c

Lbl_9c18:
	lda #$00
	sta $24
	sta $25
	sta $26
	jsr Lbl_821d
	lda $a0
	cmp #$02
	bne Lbl_9c2e
	lda #$37
	sta $0235

Lbl_9c2e:
	jsr Lbl_81dc
	jsr Lbl_8195
	jsr Lbl_81a2
	lda #$00
	sta $2001
	sta $2000
	jsr Lbl_a160
	jsr Lbl_9d3c
	jsr Lbl_81dc
	jsr Lbl_a06e
	jsr Lbl_9f51
	lda #$10
	sta $2e
	lda #$00
	sta $64
	sta $a7
	sta $a8
	sta $29
	sta $ab
	sta $2c
	sta $2d
	jsr Lbl_9fab
	jsr Lbl_9efc
	rts 

Lbl_9c69:
	jsr Lbl_9cc8
	jsr Lbl_9c79
	jsr Lbl_9d0a
	jsr Lbl_9fab
	jsr Lbl_9efc
	rts 

Lbl_9c79:
	jsr Lbl_9cb8
	sta $10
	lda $33
	and $10
	bne Lbl_9ca5
	lda $2e
	bmi Lbl_9ca6
	lda #$01

Lbl_9c8a:
	sta $10
	lda $24
	clc 
	adc $10
	sta $24
	lda $25
	adc #$00

Lbl_9c97:
	sta $25
	and #$01
	sta $10
	lda $20
	and #$fe
	ora $10
	sta $20

Lbl_9ca5:
	rts 

Lbl_9ca6:
	lda #$01

Lbl_9ca8:
	sta $10
	lda $24
	sec 
	sbc $10
	sta $24
	lda $25
	sbc #$00
	jmp Lbl_9c97

Lbl_9cb8:
	lda $2e
	bpl Lbl_9cbe
	eor #$ff

Lbl_9cbe:
	cmp #$08
	bcs Lbl_9cc5
	lda #$07
	rts 

Lbl_9cc5:
	lda #$01
	rts 

Lbl_9cc8:
	lda $2f
	and #$10
	beq Lbl_9cd6
	lda $31
	bmi Lbl_9cd6
	cmp #$48
	bcc Lbl_9cde

Lbl_9cd6:
	lda $19
	asl a 
	bcs Lbl_9ce2
	asl a 
	bcs Lbl_9cf6

Lbl_9cde:
	lda $2f
	bpl Lbl_9cf6

Lbl_9ce2:
	lda $2e
	bmi Lbl_9ceb
	cmp #$10
	bcc Lbl_9ceb
	rts 

Lbl_9ceb:
	inc $2e
	lda $2f
	and #$3f
	ora #$80
	sta $2f
	rts 

Lbl_9cf6:
	lda $2e
	bpl Lbl_9cff
	cmp #$f0
	bcs Lbl_9cff
	rts 

Lbl_9cff:
	dec $2e
	lda $2f
	and #$3f
	ora #$40
	sta $2f
	rts 

Lbl_9d0a:
	lda $2e
	bpl Lbl_9d10
	eor #$ff

Lbl_9d10:
	cmp #$08
	bcs Lbl_9d15
	rts 

Lbl_9d15:
	lda #$03
	bit $2e
	bmi Lbl_9d1d
	lda #$00

Lbl_9d1d:
	sta $10
	lda $24
	and #$03
	cmp $10
	bne Lbl_9d2d
	lda $2e
	bpl Lbl_9d2e
	bmi Lbl_9d37

Lbl_9d2d:
	rts 

Lbl_9d2e:
	inc $64

Lbl_9d30:
	lda $64
	and #$7f
	sta $64
	rts 

Lbl_9d37:
	dec $64
	jmp Lbl_9d30

Lbl_9d3c:
	lda $a0
	asl a 
	asl a 
	asl a 
	asl a 
	tay 
	lda Lbl_9d62,y
	sta $0230
	sta $0234
	sta $0238
	sta $023c
	iny 
	ldx #$00

Lbl_9d55:
	lda Lbl_9d62,y
	sta $0221,x
	iny 
	inx 
	cpx #$0f
	bcc Lbl_9d55
	rts 

Lbl_9d62:
	.byte $01,$14,$0f,$20,$0f,$0f,$03,$20,$0f,$2c,$3c,$20,$0f,$10,$16,$31
	.byte $21,$28,$18,$20,$0f,$02,$10,$20,$0f,$20,$10,$20,$0f,$2a,$1a,$20
	.byte $01,$0a,$2a,$20,$0f,$28,$38,$20,$0f,$0a,$1c,$20,$0f,$0f,$0f,$0f
	.byte $32,$09,$2c,$20,$0f,$10,$05,$20,$0f,$19,$09,$20,$0f,$19,$12,$20
	.byte $21,$3c,$1c,$20,$0f,$0a,$3b,$20,$0f,$2a,$11,$20,$0f,$0a,$2a,$20
	.byte $21,$0f,$10,$20,$0f,$1b,$0a,$20,$0f,$1b,$02,$20,$0f,$1b,$10,$20

Lbl_9dc2:
	lda $10
	clc 
	adc #$01
	sta $10
	lda $11
	adc #$00
	sta $11
	rts 

Lbl_9dd0:
	.byte $a5,$13,$18,$69,$01,$85,$13,$a5,$14,$69,$00,$85,$14,$60

Lbl_9dde:
	lda #$07
	sta $0230
	sta $0234
	sta $0238
	sta $023c
	jsr Lbl_81dc
	jsr Lbl_9e2d
	lda #$01
	sta $2c
	ldy #$40

Lbl_9df8:
	nop 
	nop 
	dey 
	bne Lbl_9df8

Lbl_9dfd:
	rts 

Lbl_9dfe:
	lda #$00
	sta $2000
	sta $2001
	lda $2002
	lda $65
	bmi Lbl_9dfd
	lda $2c
	bmi Lbl_9dde
	lda $33
	lsr a 
	bcs Lbl_9e23
	ldx #$00
	jsr Lbl_9e95
	ldx #$04
	jsr Lbl_9e95
	jmp Lbl_9e2d

Lbl_9e23:
	ldx #$08
	jsr Lbl_9e95
	ldx #$0c
	jsr Lbl_9e95

Lbl_9e2d:
	lda #$20
	sta $2006
	lda #$65
	sta $2006
	lda $41
	sta $2007
	lda $40
	sta $2007
	lda $3f
	sta $2007
	lda $3e
	sta $2007
	lda #$20
	sta $2006
	lda #$6c
	sta $2006
	lda $45
	sta $2007
	lda $44
	sta $2007
	lda $43
	sta $2007
	lda $42
	sta $2007
	lda #$20
	sta $2006
	lda #$76
	sta $2006
	lda $48
	sta $2007
	lda $47
	sta $2007
	lda $46
	sta $2007
	lda #$20
	sta $2006
	lda #$7d
	sta $2006
	lda $a2
	clc 
	adc #$30
	sta $2007
	rts 

Lbl_9e95:
	lda $4c,x
	sta $12
	lda $4d,x
	sta $13
	lda $4b,x
	sta $2006
	sta $11
	lda $4a,x
	sta $2006
	sta $10
	and #$1f
	sta $15
	eor #$ff
	and #$1f
	pha 
	lda $4a,x
	and #$e0
	sta $14
	ldy $64
	pla 
	tax 

Lbl_9ebe:
	lda ($12),y
	sta $2007
	iny 
	bpl Lbl_9ec8
	ldy #$00

Lbl_9ec8:
	dex 
	bpl Lbl_9ebe
	bmi Lbl_9ee8

Lbl_9ecd:
	sta $2006
	lda $14
	sta $2006
	ldx $15
	dex 
	bmi Lbl_9ee7

Lbl_9eda:
	lda ($12),y
	sta $2007
	iny 
	bpl Lbl_9ee4
	ldy #$00

Lbl_9ee4:
	dex 
	bpl Lbl_9eda

Lbl_9ee7:
	rts 

Lbl_9ee8:
	lda $11
	cmp #$24
	bcc Lbl_9ef5
	sec 
	sbc #$04
	sta $11
	bne Lbl_9ecd

Lbl_9ef5:
	clc 
	adc #$04
	sta $11
	bne Lbl_9ecd

Lbl_9efc:
	ldx #$00
	jsr Lbl_9f11
	ldx #$04
	jsr Lbl_9f11
	ldx #$08
	jsr Lbl_9f11
	ldx #$0c
	jsr Lbl_9f11
	rts 

Lbl_9f11:
	ldy #$00

Lbl_9f13:
	lda Lbl_9f41,x
	sta $4a,x
	inx 
	iny 
	cpy #$04
	bcc Lbl_9f13
	dex 
	dex 
	dex 
	dex 
	lda $24
	lsr a 
	lsr a 
	lsr a 
	bcc Lbl_9f2c
	clc 
	adc #$01

Lbl_9f2c:
	and #$1f
	clc 
	adc $4a,x
	sta $4a,x
	lda $25
	and #$01
	beq Lbl_9f40
	lda $4b,x
	clc 
	adc #$04
	sta $4b,x

Lbl_9f40:
	rts 

Lbl_9f41:
	.byte $20,$21,$00,$03,$e0,$21,$80,$03,$a0,$22,$00,$04,$60,$23,$80,$04

Lbl_9f51:
	lda #$00
	sta $12

Lbl_9f55:
	lda $12
	asl a 
	asl a 
	tax 
	lda Lbl_9f8d,x
	sta $10
	lda Lbl_9f8e,x
	sta $11
	ldy #$00
	lda $2002
	lda Lbl_9f8c,x
	sta $2006
	lda Lbl_9f8b,x
	sta $2006
	lda $2007

Lbl_9f78:
	lda $2007
	sta ($10),y
	iny 
	cpy #$20
	bcc Lbl_9f78
	inc $12
	lda $12
	cmp #$08
	bcc Lbl_9f55
	rts 

Lbl_9f8b:
	.byte $20

Lbl_9f8c:
	.byte $21

Lbl_9f8d:
	.byte $00

Lbl_9f8e:
	.byte $05,$20,$25,$20,$05,$e0,$21,$40,$05,$e0,$25,$60,$05,$a0,$22,$80
	.byte $05,$a0,$26,$a0,$05,$60,$23,$c0,$05,$60,$27,$e0,$05

Lbl_9fab:
	ldx #$00
	jsr Lbl_9fbc
	ldx #$04
	jsr Lbl_9fbc
	ldx #$08
	jsr Lbl_9fbc
	ldx #$0c

Lbl_9fbc:
	lda Lbl_a01c,x
	sta $10
	lda Lbl_a01d,x
	sta $11
	lda Lbl_a01e,x
	sta $12
	lda Lbl_a01f,x
	sta $13
	lda $24
	lsr a 
	lsr a 
	lsr a 
	bcc Lbl_9fda
	clc 
	adc #$01

Lbl_9fda:
	and #$1f
	sta $14
	lda $25
	and #$01
	beq Lbl_9fea
	lda $14
	ora #$20
	sta $14

Lbl_9fea:
	lda $64
	and #$7f
	sta $15
	ldx #$20

Lbl_9ff2:
	ldy $15
	lda ($12),y
	cmp #$3d
	beq Lbl_a006
	cmp #$3e
	beq Lbl_a006
	ldy $14
	lda ($10),y
	ldy $15
	sta ($12),y

Lbl_a006:
	lda $15
	clc 
	adc #$01
	and #$7f
	sta $15
	lda $14
	clc 
	adc #$01
	and #$3f
	sta $14
	dex 
	bpl Lbl_9ff2
	rts 

Lbl_a01c:
	.byte $00

Lbl_a01d:
	.byte $05

Lbl_a01e:
	.byte $00

Lbl_a01f:
	.byte $03,$40,$05,$80,$03,$80,$05,$00,$04,$c0,$05,$80,$04

Lbl_a02c:
	lda $12
	clc 
	adc #$01
	sta $12
	lda $13
	adc #$00
	sta $13
	rts 

Lbl_a03a:
	.byte $3f,$3a,$72,$3b,$98,$91,$9b,$06,$99,$ed,$ff,$55,$00,$af,$b0,$c5

Lbl_a04a:
	.byte $00,$00,$ff,$00,$ff,$ff

Lbl_a050:
	.byte $55,$50,$40,$40,$40,$40,$40,$30,$30,$40,$40,$40,$40,$40,$4d,$49
	.byte $40,$4f,$49,$4c,$40,$40,$40,$40,$40,$5f,$40,$40,$40,$40

Lbl_a06e:
	ldx $a0
	lda Lbl_a04a,x
	beq Lbl_a077
	lda #$01

Lbl_a077:
	sta $67
	jsr Lbl_ff00
	jsr Lbl_a0f4
	lda #$00
	tax 
	tay 
	lda $2002
	lda #$20
	sta $2006
	lda #$c0
	sta $2006
	lda $a0
	asl a 
	asl a 
	tax 
	lda Lbl_a148,x
	sta $10
	lda Lbl_a149,x
	sta $11
	jsr Lbl_a0bf
	lda #$00
	tax 
	tay 
	lda #$24
	sta $2006
	lda #$c0
	sta $2006
	lda $a0
	asl a 
	asl a 
	tax 
	lda Lbl_a14a,x
	sta $10
	lda Lbl_a14b,x
	sta $11

Lbl_a0bf:
	lda ($10),y
	cmp #$30
	beq Lbl_a0f3
	pha 
	and #$f0
	cmp #$40
	beq Lbl_a0d6
	pla 
	sta $2007
	jsr Lbl_9dc2
	jmp Lbl_a0bf

Lbl_a0d6:
	pla 
	and #$0f
	tax 
	lda Lbl_a03a,x
	sta $14
	jsr Lbl_9dc2
	lda ($10),y
	tax 
	lda $14

Lbl_a0e7:
	sta $2007
	dex 
	bne Lbl_a0e7
	jsr Lbl_9dc2
	jmp Lbl_a0bf

Lbl_a0f3:
	rts 

Lbl_a0f4:
	lda #$20
	sta $2006
	lda #$61
	sta $2006
	ldx #$31
	lda $61
	lsr a 
	bcc Lbl_a107
	ldx #$32

Lbl_a107:
	stx $2007
	ldx #$00
	lda $67
	cmp #$02
	beq Lbl_a11e

Lbl_a112:
	lda Lbl_a050,x
	sta $2007
	inx 
	cpx #$1d
	bcc Lbl_a112
	rts 

Lbl_a11e:
	lda Lbl_a12a,x
	sta $2007
	inx 
	cpx #$1d
	bcc Lbl_a11e
	rts 

Lbl_a12a:
	.byte $4c,$48,$00,$00,$00,$00,$00,$30,$30,$00,$00,$00,$00,$00,$46,$43
	.byte $00,$47,$43,$44,$00,$00,$00,$00,$00,$4d,$00,$00,$00,$00

Lbl_a148:
	.byte $00

Lbl_a149:
	.byte $b0

Lbl_a14a:
	.byte $43

Lbl_a14b:
	.byte $b1,$70,$b2,$7d,$b3,$79,$b4,$c3,$b5,$f7,$bc,$49,$be,$f8,$b6,$94
	.byte $b8,$4c,$ba,$97,$bb

Lbl_a160:
	lda $a1
	cmp #$10
	bcc Lbl_a16a
	and #$0f
	ora #$08

Lbl_a16a:
	asl a 
	tax 
	lda Lbl_d984,x
	sta $10
	lda Lbl_d985,x
	sta $11
	lda #$00
	sta $12
	lda #$03
	sta $13
	lda #$00
	tax 
	tay 
	lda ($10),y
	sta $14
	jsr Lbl_9dc2
	lda ($10),y
	sta $15
	jsr Lbl_9dc2

Lbl_a190:
	lda ($10),y
	cmp #$ff
	beq Lbl_a1bf
	tax 

Lbl_a197:
	lda $14
	sta ($12),y
	jsr Lbl_a02c
	dex 
	cpx #$00
	bne Lbl_a197
	jsr Lbl_9dc2
	lda ($10),y
	cmp #$ff
	beq Lbl_a1bf
	tax 

Lbl_a1ad:
	lda $15
	sta ($12),y
	jsr Lbl_a02c
	dex 
	cpx #$00
	bne Lbl_a1ad
	jsr Lbl_9dc2
	jmp Lbl_a190

Lbl_a1bf:
	rts 

Lbl_a1c0:
	lda #$00
	sta $14
	sta $15

Lbl_a1c6:
	lda $10
	sec 
	sbc #$10
	sta $12
	lda $11
	sbc #$27
	sta $13
	bcc Lbl_a1e0
	lda $12
	sta $10
	lda $13
	sta $11
	jmp Lbl_a1c6

Lbl_a1e0:
	lda $10
	sec 
	sbc #$e8
	sta $12
	lda $11
	sbc #$03
	sta $13
	bcc Lbl_a1ff
	lda $12
	sta $10
	lda $13
	sta $11
	lda $15
	adc #$0f
	sta $15
	bne Lbl_a1e0

Lbl_a1ff:
	lda $10
	sec 
	sbc #$64
	sta $12
	lda $11
	sbc #$00
	sta $13
	bcc Lbl_a21e
	lda $12
	sta $10
	lda $13
	sta $11
	lda $15
	adc #$00
	sta $15
	bne Lbl_a1ff

Lbl_a21e:
	lda $10
	sec 
	sbc #$0a
	sta $12
	lda $11
	sbc #$00
	sta $13
	bcc Lbl_a23d
	lda $12
	sta $10
	lda $13
	sta $11
	lda $14
	adc #$0f
	sta $14
	bne Lbl_a21e

Lbl_a23d:
	lda $10
	ora $14
	sta $14

Lbl_a243:
	rts 

Lbl_a244:
	sta $3d
	lda $62
	bmi Lbl_a243
	lda $61
	lsr a 
	bcs Lbl_a25f
	lda $37
	clc 
	adc $3d
	sta $37
	lda $38
	adc #$00
	sta $38
	jmp Lbl_a26c

Lbl_a25f:
	lda $39
	clc 
	adc $3d
	sta $39
	lda $3a
	adc #$00
	sta $3a

Lbl_a26c:
	jsr Lbl_a333
	lda $37
	sec 
	sbc $39
	lda $38
	sbc $3a
	bcc Lbl_a28e
	lda $3b
	sec 
	sbc $37
	lda $3c
	sbc $38
	bcs Lbl_a28d
	lda $37
	sta $3b
	lda $38
	sta $3c

Lbl_a28d:
	rts 

Lbl_a28e:
	lda $39
	sec 
	sbc $3b
	lda $3a
	sbc $3c
	bcc Lbl_a28d
	lda $39
	sta $3b
	lda $3a
	sta $3c
	rts 

Lbl_a2a2:
	lda #$00
	sta $37
	sta $38
	sta $39
	sta $3a
	sta $3d
	rts 

Lbl_a2af:
	lda $61
	lsr a 
	bcs Lbl_a2bf
	lda $37
	sta $10
	lda $38
	sta $11
	jmp Lbl_a2c7

Lbl_a2bf:
	lda $39
	sta $10
	lda $3a
	sta $11

Lbl_a2c7:
	jsr Lbl_a1c0
	ldx #$00
	jsr Lbl_a2ff
	ldx #$03
	jsr Lbl_a322
	lda $a5
	sta $10
	lda $a6
	sta $11
	jsr Lbl_a1c0
	ldx #$04
	jsr Lbl_a2ff
	ldx #$07
	jsr Lbl_a322
	lda $a4
	sta $10
	lda #$00
	sta $11
	jsr Lbl_a1c0
	ldx #$08
	jsr Lbl_a2ff
	ldx #$0b
	jsr Lbl_a322
	rts 

Lbl_a2ff:
	lda $15
	pha 
	jsr Lbl_a389
	ora #$30
	sta $41,x
	pla 
	and #$0f
	ora #$30
	sta $40,x
	lda $14
	pha 
	jsr Lbl_a389
	ora #$30
	sta $3f,x
	pla 
	and #$0f
	ora #$30
	sta $3e,x
	rts 

Lbl_a322:
	ldy #$02

Lbl_a324:
	lda $3e,x
	cmp #$30
	bne Lbl_a332
	lda #$40
	sta $3e,x
	dex 
	dey 
	bpl Lbl_a324

Lbl_a332:
	rts 

Lbl_a333:
	bit $a3
	bmi Lbl_a355
	lda $61
	lsr a 
	bcs Lbl_a36f
	lda #$2b
	sec 
	sbc $37
	lda #$01
	sbc $38
	bcs Lbl_a354

Lbl_a347:
	lda $a3
	ora #$80
	sta $a3

Lbl_a34d:
	inc $a2
	ldy #$14
	jsr Lbl_a60a

Lbl_a354:
	rts 

Lbl_a355:
	bvs Lbl_a354
	lda $61
	lsr a 
	bcs Lbl_a37c
	lda #$e8
	sec 
	sbc $37
	lda #$03
	sbc $38
	bcs Lbl_a354

Lbl_a367:
	lda $a3
	ora #$40
	sta $a3
	bne Lbl_a34d

Lbl_a36f:
	lda #$2b
	sec 
	sbc $39
	lda #$01
	sbc $3a
	bcs Lbl_a354
	bcc Lbl_a347

Lbl_a37c:
	lda #$e8
	sec 
	sbc $39
	lda #$03
	sbc $3a
	bcs Lbl_a354
	bcc Lbl_a367

Lbl_a389:
	lsr a 
	lsr a 
	lsr a 
	lsr a 
	rts 

Lbl_a38e:
	lda #$00
	sta $4015
	sta $8d
	lda #$ff
	sta $78
	sta $79
	sta $7a
	sta $7b

Lbl_a39f:
	rts 

Lbl_a3a0:
	lda $62
	bne Lbl_a39f

Lbl_a3a4:
	ldx #$00
	jsr Lbl_a3b5
	ldx #$01
	jsr Lbl_a3b5
	ldx #$02
	jsr Lbl_a3b5
	ldx #$03

Lbl_a3b5:
	txa 
	asl a 
	asl a 
	sta $8c
	lda $78,x
	beq Lbl_a3e1
	cmp #$ff
	beq Lbl_a3d9
	dec $70,x
	bne Lbl_a3d9

Lbl_a3c6:
	jsr Lbl_a41a
	ldy #$00
	lda ($14),y
	jsr Lbl_a512
	cmp #$ff
	beq Lbl_a3da
	jsr Lbl_a448
	inc $78,x

Lbl_a3d9:
	rts 

Lbl_a3da:
	lda #$ff
	sta $78,x
	jmp Lbl_a502

Lbl_a3e1:
	jsr Lbl_a4f7
	lda $7c,x
	sta $14
	lda $80,x
	sta $15
	ldy #$00
	lda ($14),y
	sta $74,x
	and #$30
	sta $6c,x
	iny 
	lda ($14),y
	jsr Lbl_a434
	iny 
	sty $78,x
	lda ($14),y
	ora $13
	ldy $8c
	sta $4000,y
	sta $88,x
	ldy #$03
	lda ($14),y
	ldy $8c
	sta $4001,y
	lda #$ff
	sta $84,x
	jmp Lbl_a3c6

Lbl_a41a:
	lda #$00
	sta $15
	lda $78,x
	sta $14
	asl $14
	rol $15
	lda $7c,x
	clc 
	adc $14
	sta $14
	lda $80,x
	adc $15
	sta $15
	rts 

Lbl_a434:
	pha 
	lda $6c,x
	cmp #$20
	beq Lbl_a444
	pla 
	ror a 
	ror a 
	ror a 
	and #$c0
	sta $13
	rts 

Lbl_a444:
	pla 
	sta $13
	rts 

Lbl_a448:
	pha 
	lda $6c,x
	cmp #$30
	beq Lbl_a49e
	pla 
	pha 
	and #$0f
	cmp #$0c
	bcs Lbl_a497
	asl a 
	tay 
	lda Lbl_a4ac,y
	sta $10
	lda Lbl_a4ab,y
	sta $11
	pla 
	and #$f0
	cmp #$a0
	bcs Lbl_a496
	jsr Lbl_a389
	tay 

Lbl_a46e:
	lsr $11
	ror $10
	dey 
	bpl Lbl_a46e

Lbl_a475:
	jsr Lbl_a4c3
	jsr Lbl_a4f7
	lda $88,x
	ldy $8c
	sta $4000,y
	lda $11
	and #$07
	ora #$08
	sta $11
	lda $10
	ldy $8c
	sta $4002,y
	lda $11
	sta $4003,y

Lbl_a496:
	rts 

Lbl_a497:
	pla 

Lbl_a498:
	jsr Lbl_a502
	jmp Lbl_a4c3

Lbl_a49e:
	pla 
	cmp #$10
	bcs Lbl_a498
	sta $10
	lda #$00
	sta $11
	beq Lbl_a475

Lbl_a4ab:
	.byte $0d

Lbl_a4ac:
	.byte $5c,$0c,$9c,$0b,$e8,$0b,$3c,$0a,$9a,$0a,$02,$09,$72,$08,$ea,$08
	.byte $6a,$07,$f2,$07,$80,$07,$14

Lbl_a4c3:
	ldy #$01
	lda ($14),y
	cmp #$f0
	bcc Lbl_a4e2
	sec 
	sbc #$f0
	tay 
	lda Lbl_a4e7,y

Lbl_a4d2:
	sta $70,x
	lda $74,x
	and #$01
	beq Lbl_a4e1
	lda $70,x
	clc 
	adc $70,x
	sta $70,x

Lbl_a4e1:
	rts 

Lbl_a4e2:
	and #$0f
	jmp Lbl_a4d2

Lbl_a4e7:
	.byte $06,$0c,$18,$30,$60,$12,$24,$48,$08,$1e,$3c,$10,$4e,$42,$54,$b0

Lbl_a4f7:
	lda $8d
	ora Lbl_a50a,x

Lbl_a4fc:
	sta $4015
	sta $8d
	rts 

Lbl_a502:
	lda $8d
	and Lbl_a50e,x
	jmp Lbl_a4fc

Lbl_a50a:
	.byte $01,$02,$04,$08

Lbl_a50e:
	.byte $0e,$0d,$0b,$07

Lbl_a512:
	cmp #$c0
	bcs Lbl_a51e
	cmp #$b0
	bcs Lbl_a544
	cmp #$a0
	bcs Lbl_a51f

Lbl_a51e:
	rts 

Lbl_a51f:
	iny 
	lda $6c,x
	cmp #$20
	beq Lbl_a53d
	lda $88,x
	and #$e0

Lbl_a52a:
	ora ($14),y
	sta $88,x
	ldy $8c
	sta $4000,y

Lbl_a533:
	inc $78,x

Lbl_a535:
	jsr Lbl_a41a
	ldy #$00
	lda ($14),y
	rts 

Lbl_a53d:
	lda $88,x
	and #$80
	jmp Lbl_a52a

Lbl_a544:
	and #$0f
	cmp #$0f
	bne Lbl_a550
	lda #$02
	sta $78,x
	bne Lbl_a535

Lbl_a550:
	lda $84,x
	beq Lbl_a56d
	cmp #$0f
	bcs Lbl_a562
	dec $84,x

Lbl_a55a:
	iny 
	lda ($14),y
	sta $78,x
	jmp Lbl_a535

Lbl_a562:
	lda ($14),y
	and #$0f
	sta $84,x
	dec $84,x
	jmp Lbl_a55a

Lbl_a56d:
	dec $84,x
	jmp Lbl_a533

Lbl_a572:
	lda #$ff
	sta $78
	sta $7a
	sta $7b
	lda $a0
	lsr a 
	bcs Lbl_a5a0
	lda #$7c
	sta $7c
	lda #$a6
	sta $80
	lda #$49
	sta $7e
	lda #$a7
	sta $82
	lda #$3c
	sta $7f
	lda #$a8
	sta $83
	lda #$00
	sta $78
	sta $7a
	sta $7b
	rts 

Lbl_a5a0:
	lda #$6f
	sta $7c
	lda #$aa
	sta $80
	lda #$f8
	sta $7e
	lda #$aa
	sta $82
	lda #$e7
	sta $7f
	lda #$ab
	sta $83
	lda #$00
	sta $78
	sta $7a
	sta $7b
	rts 

Lbl_a5c1:
	ldy #$00
	beq Lbl_a5d1

Lbl_a5c5:
	jsr Lbl_a38e
	ldy #$0c
	bne Lbl_a5d1

Lbl_a5cc:
	jsr Lbl_a38e
	ldy #$06

Lbl_a5d1:
	lda Lbl_a5f8,y
	sta $7c
	lda Lbl_a5f9,y
	sta $80
	lda Lbl_a5fa,y
	sta $7d
	lda Lbl_a5fb,y
	sta $81
	lda Lbl_a5fc,y
	sta $7e
	lda Lbl_a5fd,y
	sta $82
	lda #$00
	sta $78
	sta $79
	sta $7a
	rts 

Lbl_a5f8:
	.byte $bf

Lbl_a5f9:
	.byte $a8

Lbl_a5fa:
	.byte $0a

Lbl_a5fb:
	.byte $a9

Lbl_a5fc:
	.byte $45

Lbl_a5fd:
	.byte $a9,$4a,$a9,$81,$a9,$9c,$a9,$a9,$a9,$e6,$a9,$09,$aa

Lbl_a60a:
	lda Lbl_a619,y
	sta $7d
	lda Lbl_a61a,y
	sta $81
	lda #$00
	sta $79
	rts 

Lbl_a619:
	.byte $43

Lbl_a61a:
	.byte $a6,$5a,$a6,$75,$a6,$32,$aa,$3f,$aa,$46,$aa,$5d,$aa,$68,$aa,$fa
	.byte $ab,$01,$ac,$18,$ac

Lbl_a62f:
	lda #$3c
	sta $7f
	lda #$a6
	sta $83
	lda #$00
	sta $7b
	rts 

Lbl_a63c:
	.byte $30,$00,$0f,$00,$0c,$f7,$ff,$10,$03,$1f,$00,$40,$e8,$a0,$1a,$40
	.byte $e8,$a0,$18,$40,$e8,$a0,$16,$40,$e8,$a0,$13,$40,$e8,$ff,$11,$03
	.byte $1f,$9b,$37,$e8,$a0,$1b,$37,$e8,$a0,$19,$37,$e8,$a0,$17,$37,$e8
	.byte $a0,$15,$37,$e8,$a0,$13,$37,$e8,$ff,$10,$02,$1f,$8d,$44,$f0,$ff
	.byte $00,$00,$0f,$00,$1f,$f1,$24,$f1,$27,$f1,$29,$f1,$30,$f1,$b4,$06
	.byte $29,$f1,$27,$f1,$29,$f1,$30,$f1,$b4,$0b,$29,$f1,$27,$f1,$29,$f1
	.byte $30,$f1,$29,$f1,$27,$f1,$29,$f1,$b1,$10,$1f,$f1,$32,$f1,$b2,$16
	.byte $32,$f2,$31,$f2,$30,$fa,$34,$f2,$32,$f1,$35,$fa,$34,$f1,$2b,$f1
	.byte $30,$f1,$29,$f3,$32,$f2,$34,$f2,$29,$fa,$32,$f1,$2b,$f1,$29,$f1
	.byte $27,$fa,$32,$f2,$34,$f1,$37,$fa,$32,$f1,$32,$f1,$34,$f1,$37,$fa
	.byte $34,$f1,$39,$f1,$37,$f1,$32,$fa,$37,$f1,$34,$f1,$32,$f1,$30,$fa
	.byte $34,$f2,$32,$f1,$35,$fa,$34,$f1,$2b,$f1,$30,$f1,$29,$f3,$32,$f2
	.byte $34,$f2,$37,$fa,$35,$f1,$34,$f1,$35,$f1,$34,$f1,$2b,$f1,$34,$f0
	.byte $32,$f0,$31,$f1,$32,$f1,$29,$f1,$32,$f1,$2b,$f1,$30,$f1,$24,$f1
	.byte $29,$f1,$2b,$f1,$27,$f1,$29,$f1,$2b,$f1,$30,$f1,$32,$f1,$34,$f1
	.byte $29,$f6,$2b,$f2,$30,$f3,$1f,$f7,$37,$f1,$37,$f1,$37,$f1,$37,$f1
	.byte $35,$f1,$34,$f1,$32,$f1,$30,$f2,$1f,$f2,$bf,$02,$ff,$20,$00,$1a
	.byte $00,$1f,$f3,$20,$f4,$25,$f4,$20,$f3,$20,$f3,$1f,$f1,$27,$f1,$27
	.byte $f1,$27,$f1,$27,$f3,$20,$f1,$20,$f1,$24,$f1,$24,$f1,$27,$f1,$27
	.byte $f1,$29,$f1,$27,$f1,$25,$f1,$25,$f1,$29,$f1,$29,$f1,$30,$f1,$30
	.byte $f1,$32,$f1,$30,$f1,$22,$f1,$22,$f1,$25,$f1,$25,$f1,$29,$f1,$29
	.byte $f1,$30,$f1,$30,$f1,$32,$f1,$32,$f1,$30,$f1,$30,$f1,$2b,$f1,$2b
	.byte $f1,$29,$f1,$29,$f1,$27,$f1,$27,$f1,$2b,$f1,$2b,$f1,$27,$f1,$27
	.byte $f1,$17,$f1,$22,$f1,$27,$f1,$27,$f1,$25,$f1,$25,$f1,$24,$f1,$24
	.byte $f1,$22,$f1,$22,$f1,$20,$f1,$20,$f1,$24,$f1,$24,$f1,$27,$f1,$27
	.byte $f1,$29,$f1,$27,$f1,$1f,$f1,$27,$f1,$27,$f1,$27,$f1,$27,$f3,$20
	.byte $f1,$20,$f1,$24,$f1,$24,$f1,$27,$f1,$27,$f1,$29,$f1,$27,$f1,$25
	.byte $f1,$25,$f1,$29,$f1,$29,$f1,$30,$f1,$30,$f1,$32,$f1,$30,$f1,$22
	.byte $f1,$22,$f1,$25,$f1,$25,$f1,$29,$f1,$29,$f1,$30,$f1,$2b,$f1,$27
	.byte $f1,$27,$f1,$2b,$f1,$2b,$f1,$32,$f1,$32,$f1,$34,$f1,$30,$f1,$24
	.byte $f1,$24,$f6,$22,$f1,$22,$f6,$25,$f1,$25,$f6,$20,$f1,$20,$f6,$27
	.byte $f2,$25,$f6,$27,$f2,$20,$fe,$1f,$f2,$1f,$f4,$20,$f3,$bf,$02,$ff
	.byte $30,$00,$03,$00,$1f,$f3,$08,$f1,$1f,$fe,$08,$f1,$1f,$fe,$08,$f1
	.byte $1f,$f6,$08,$f1,$1f,$f3,$08,$f1,$b6,$0b,$1f,$f2,$08,$f1,$1f,$f6
	.byte $08,$f1,$1f,$f6,$08,$f1,$1f,$f6,$08,$f1,$1f,$f6,$08,$f1,$1f,$f6
	.byte $08,$f1,$1f,$f6,$08,$f1,$1f,$f2,$08,$f1,$08,$f1,$08,$f1,$b1,$0d
	.byte $1f,$f2,$08,$f1,$1f,$f6,$08,$f1,$1f,$f6,$08,$f1,$1f,$f6,$08,$f1
	.byte $1f,$f6,$08,$f1,$1f,$f6,$08,$f1,$1f,$f6,$08,$f1,$1f,$f1,$08,$f0
	.byte $08,$f0,$08,$f1,$08,$f1,$08,$f0,$08,$f0,$b1,$20,$1f,$fa,$08,$f1
	.byte $08,$f1,$08,$f1,$08,$f0,$08,$f0,$08,$f1,$08,$f1,$08,$f0,$08,$f0
	.byte $bf,$02,$ff,$00,$01,$0a,$00,$33,$f0,$31,$f0,$26,$f1,$36,$f0,$1f
	.byte $f0,$36,$f1,$b1,$02,$33,$f0,$31,$f0,$26,$f1,$36,$f1,$23,$f1,$36
	.byte $f1,$21,$f1,$35,$f0,$1f,$f0,$35,$f1,$33,$f0,$31,$f0,$21,$f1,$35
	.byte $f0,$1f,$f0,$35,$f1,$b1,$13,$33,$f0,$31,$f0,$21,$f0,$35,$f1,$23
	.byte $f1,$35,$f1,$25,$f1,$36,$f0,$1f,$f0,$36,$f1,$bf,$02,$ff,$10,$00
	.byte $1a,$00,$1f,$f2,$2a,$f0,$1f,$f0,$2a,$f1,$b1,$02,$1f,$f2,$2a,$f1
	.byte $1f,$f1,$2a,$f1,$1f,$f1,$2b,$f0,$1f,$f0,$2b,$f1,$1f,$f2,$2b,$f0
	.byte $1f,$f0,$2b,$f1,$b1,$0f,$1f,$f2,$2b,$f1,$1f,$f1,$2b,$f1,$1f,$f1
	.byte $2a,$f0,$1f,$f0,$2a,$f1,$bf,$02,$ff,$00,$00,$0f,$00,$ff,$00,$00
	.byte $0f,$00,$30,$f5,$27,$f0,$2a,$f5,$30,$f3,$1f,$f2,$27,$f0,$2a,$f5
	.byte $30,$f0,$33,$f5,$30,$f0,$2a,$f5,$27,$f0,$30,$f5,$27,$f0,$2a,$f5
	.byte $30,$f3,$1f,$f2,$27,$f0,$2a,$f5,$30,$f0,$35,$f5,$33,$f0,$30,$f5
	.byte $2a,$f0,$30,$f4,$ff,$10,$00,$0f,$00,$27,$f2,$27,$f2,$29,$f2,$29
	.byte $f2,$2a,$f2,$2a,$f2,$29,$f5,$2a,$f0,$2a,$f2,$b1,$02,$24,$f3,$ff
	.byte $20,$00,$40,$00,$20,$f2,$be,$02,$20,$f2,$20,$f2,$ff,$00,$00,$0f
	.byte $00,$1f,$f6,$1f,$f0,$37,$f0,$34,$f0,$30,$f0,$b1,$04,$37,$f0,$1f
	.byte $f0,$39,$f0,$35,$f0,$30,$f0,$39,$f1,$30,$f0,$32,$f0,$34,$f1,$37
	.byte $f0,$39,$f0,$37,$f0,$34,$f0,$30,$f0,$32,$f0,$34,$e4,$35,$e4,$34
	.byte $e4,$32,$e4,$34,$e4,$32,$e4,$30,$f1,$ff,$10,$00,$0f,$00,$1f,$f6
	.byte $1f,$f1,$27,$f1,$1f,$f1,$27,$f1,$1f,$f1,$29,$f1,$29,$f1,$1f,$f2
	.byte $27,$f1,$1f,$f1,$27,$f1,$24,$f1,$22,$f1,$20,$f1,$ff,$20,$00,$40
	.byte $00,$32,$f1,$2b,$f1,$27,$f1,$20,$f1,$24,$f1,$27,$f1,$30,$f1,$22
	.byte $f1,$25,$f1,$29,$f1,$32,$f1,$30,$f1,$2b,$f1,$29,$f1,$2b,$f1,$30
	.byte $f1,$27,$f1,$20,$f1,$ff,$10,$00,$05,$00,$34,$e4,$30,$e4,$b1,$02
	.byte $34,$f1,$ff,$10,$03,$08,$00,$39,$f1,$ff,$10,$02,$1f,$83,$30,$f0
	.byte $a0,$1a,$30,$f0,$a0,$17,$30,$f0,$a0,$15,$30,$f0,$a0,$13,$30,$f0
	.byte $ff,$10,$00,$0f,$00,$30,$e1,$50,$e1,$ba,$02,$ff,$10,$00,$0f,$8c
	.byte $30,$f5,$ff,$00,$00,$1f,$00,$1f,$f4,$40,$f3,$44,$f2,$42,$f2,$45
	.byte $f2,$44,$f2,$3b,$f2,$40,$f2,$39,$f3,$42,$f2,$44,$f2,$39,$f7,$1f
	.byte $f2,$37,$f3,$42,$f2,$44,$f2,$47,$f7,$1f,$f2,$44,$f3,$49,$f2,$47
	.byte $f2,$42,$f7,$1f,$f2,$40,$f3,$44,$f2,$42,$f2,$45,$f2,$44,$f2,$3b
	.byte $f2,$40,$f2,$1f,$f2,$39,$f2,$42,$f2,$44,$f2,$47,$f3,$1f,$f1,$45
	.byte $f1,$44,$f1,$45,$f1,$44,$f1,$3b,$f1,$44,$f1,$41,$f1,$42,$f1,$39
	.byte $f1,$42,$f1,$3b,$f1,$40,$f1,$34,$f1,$39,$f1,$3b,$f1,$37,$f1,$39
	.byte $f1,$3b,$f1,$40,$f1,$42,$f1,$44,$f1,$42,$f1,$44,$f1,$39,$f4,$3b
	.byte $f1,$3b,$f1,$3b,$f2,$40,$f7,$1f,$f2,$bf,$02,$ff,$20,$00,$20,$00
	.byte $27,$f1,$27,$f1,$25,$f1,$25,$f1,$24,$f1,$24,$f1,$22,$f1,$22,$f1
	.byte $30,$f1,$30,$f0,$34,$f0,$37,$f1,$40,$f1,$44,$f1,$40,$f1,$37,$f1
	.byte $40,$f1,$35,$f1,$35,$f0,$39,$f0,$40,$f1,$45,$f1,$49,$f1,$45,$f1
	.byte $40,$f1,$45,$f1,$32,$f1,$32,$f0,$35,$f0,$39,$f1,$42,$f1,$45,$f1
	.byte $42,$f1,$49,$f1,$42,$f1,$b1,$1c,$27,$f1,$27,$f0,$2b,$f0,$32,$f1
	.byte $37,$f1,$3b,$f1,$37,$f1,$32,$f1,$37,$f1,$b1,$26,$30,$f1,$30,$f0
	.byte $34,$f0,$37,$f1,$40,$f1,$44,$f1,$40,$f1,$37,$f1,$40,$f1,$27,$f1
	.byte $27,$f0,$2b,$f0,$32,$f1,$37,$f1,$3b,$f1,$37,$f1,$32,$f1,$37,$f1
	.byte $30,$f1,$30,$f0,$34,$f0,$37,$f1,$40,$f1,$44,$f1,$40,$f1,$37,$f1
	.byte $40,$f1,$35,$f1,$35,$f0,$39,$f0,$40,$f1,$45,$f1,$49,$f1,$45,$f1
	.byte $40,$f1,$45,$f1,$32,$f1,$32,$f0,$35,$f0,$39,$f1,$42,$f1,$45,$f1
	.byte $42,$f1,$39,$f1,$42,$f1,$27,$f1,$27,$f0,$2b,$f0,$32,$f1,$37,$f1
	.byte $3b,$f1,$37,$f1,$32,$f1,$37,$f1,$34,$f3,$32,$f3,$35,$f3,$34,$f3
	.byte $32,$f4,$1f,$f7,$32,$f2,$30,$f1,$30,$f0,$34,$f0,$37,$f1,$40,$f1
	.byte $44,$f1,$40,$f1,$37,$f1,$40,$f1,$bf,$02,$ff,$30,$00,$02,$00,$1f
	.byte $f2,$0a,$f1,$0a,$f1,$1f,$f2,$0a,$f1,$1f,$f1,$bf,$02,$ff,$10,$03
	.byte $0a,$00,$42,$f2,$ff,$10,$02,$1f,$83,$40,$f0,$a0,$1d,$40,$f0,$a0
	.byte $1a,$40,$f0,$a0,$18,$40,$f0,$a0,$16,$40,$f0,$ff,$10,$00,$1f,$00
	.byte $40,$f0,$1f,$e3,$b7,$02,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$40,$15,$7b,$40,$1f,$7b,$40,$1e,$7d,$7e,$75,$40
	.byte $1d,$7d,$7d,$78,$3f,$82,$82,$74,$40,$19,$7d,$7d,$78,$3f,$7e,$7d
	.byte $81,$40,$19,$7e,$7d,$79,$3f,$7e,$7d,$81,$40,$19,$7e,$7e,$79,$3f
	.byte $7d,$7d,$81,$40,$19,$7d,$7e,$78,$3f,$85,$85,$84,$40,$12,$60,$40
	.byte $06,$7d,$7d,$78,$3f,$7e,$7d,$84,$40,$12,$62,$63,$40,$03,$7b,$3f
	.byte $7d,$7d,$78,$3f,$7e,$82,$84,$40,$07,$80,$75,$3f,$78,$40,$07,$64
	.byte $65,$40,$03,$7a,$3f,$7d,$7d,$78,$3f,$82,$82,$84,$40,$03,$73,$3f
	.byte $74,$3f,$80,$7f,$7f,$78,$7d,$7e,$74,$40,$04,$66,$67,$68,$40,$02
	.byte $7f,$3f,$7e,$7e,$7f,$75,$7e,$7e,$81,$3f,$77,$76,$73,$79,$84,$7c
	.byte $80,$7f,$7f,$78,$85,$85,$81,$40,$04,$69,$6a,$6b,$40,$02,$85,$76
	.byte $7d,$7e,$7f,$78,$85,$85,$80,$76,$7f,$7f,$73,$73,$84,$7c,$83,$83
	.byte $81,$80,$80,$7e,$85,$85,$85,$78,$3f,$6c,$6d,$70,$77,$76,$85,$84
	.byte $7e,$7e,$7f,$83,$7d,$7e,$80,$84,$7f,$82,$82,$81,$84,$7c,$83,$83
	.byte $81,$80,$80,$7e,$85,$85,$85,$78,$3f,$6e,$6f,$70,$7f,$7f,$85,$84
	.byte $7e,$7e,$7f,$83,$7d,$7e,$80,$84,$7f,$82,$82,$81,$81,$7c,$83,$83
	.byte $81,$80,$80,$85,$85,$85,$82,$82,$3f,$71,$6d,$70,$7f,$7f,$85,$84
	.byte $7d,$7e,$7f,$83,$7e,$7d,$80,$84,$7f,$82,$82,$81,$42,$0c,$43,$04
	.byte $42,$10,$3a,$73,$41,$08,$43,$08,$41,$06,$73,$73,$73,$41,$07,$73
	.byte $41,$03,$43,$10,$41,$04,$73,$73,$41,$32,$73,$41,$0a,$73,$73,$41
	.byte $0b,$73,$41,$59,$4c,$1b,$a0,$4c,$07,$aa,$4c,$04,$50,$50,$50,$5a
	.byte $50,$50,$50,$50,$4b,$10,$30,$40,$89,$7b,$40,$1f,$7a,$40,$1f,$81
	.byte $40,$16,$6a,$6a,$79,$40,$06,$84,$40,$0a,$7d,$7e,$7d,$75,$40,$08
	.byte $73,$81,$78,$40,$06,$73,$40,$02,$73,$78,$40,$06,$85,$7d,$85,$78
	.byte $40,$08,$73,$81,$78,$40,$03,$7f,$78,$7f,$7f,$74,$3f,$73,$78,$40
	.byte $03,$85,$85,$3f,$85,$7d,$85,$78,$3f,$73,$78,$40,$05,$80,$80,$79
	.byte $80,$80,$76,$7f,$78,$7f,$7f,$84,$3f,$73,$78,$77,$76,$3f,$85,$85
	.byte $3f,$85,$85,$85,$79,$3f,$81,$78,$40,$04,$85,$81,$84,$7c,$80,$80
	.byte $84,$7f,$78,$7f,$7f,$84,$85,$85,$7c,$7c,$7c,$3f,$85,$85,$3f,$7e
	.byte $7d,$7e,$79,$77,$73,$78,$7d,$7d,$74,$3f,$85,$81,$82,$82,$82,$81
	.byte $84,$7f,$7c,$7f,$7f,$81,$85,$85,$7c,$7c,$7c,$78,$85,$85,$7f,$85
	.byte $85,$7d,$82,$82,$82,$81,$7d,$7e,$84,$77,$85,$7d,$7d,$7d,$82,$84
	.byte $84,$7f,$7c,$7f,$7f,$84,$85,$85,$83,$83,$83,$7c,$85,$81,$81,$81
	.byte $84,$85,$82,$82,$82,$84,$7e,$7d,$73,$7f,$85,$7d,$7d,$7d,$82,$84
	.byte $84,$7f,$7c,$7f,$7f,$84,$85,$85,$83,$83,$83,$7c,$85,$81,$81,$81
	.byte $84,$85,$82,$82,$82,$84,$7e,$7d,$73,$7f,$85,$7e,$7d,$7e,$82,$84
	.byte $84,$7f,$7c,$7f,$7f,$84,$85,$85,$83,$83,$83,$7c,$85,$81,$81,$84
	.byte $81,$85,$82,$82,$82,$81,$7e,$7e,$81,$7f,$85,$42,$20,$41,$02,$73
	.byte $41,$0b,$73,$41,$05,$73,$41,$11,$73,$41,$07,$73,$41,$0d,$73,$41
	.byte $31,$73,$41,$29,$73,$41,$47,$4c,$28,$50,$50,$50,$50,$50,$50,$50
	.byte $50,$4b,$10,$30,$40,$06,$86,$3f,$7b,$3f,$86,$40,$1b,$87,$3f,$7a
	.byte $3f,$87,$40,$05,$be,$bf,$c0,$40,$13,$87,$a0,$7f,$a1,$87,$40,$1b
	.byte $87,$88,$88,$88,$87,$40,$1b,$8c,$89,$89,$89,$8e,$40,$1b,$8c,$8a
	.byte $8a,$8a,$8e,$40,$1b,$8c,$8b,$8b,$8b,$8e,$40,$11,$7b,$40,$09,$8c
	.byte $8b,$8b,$8b,$8e,$40,$0c,$7b,$40,$04,$7a,$40,$09,$8c,$89,$89,$89
	.byte $8e,$40,$0c,$7a,$40,$04,$7c,$40,$09,$8c,$8a,$8a,$8a,$8e,$40,$0c
	.byte $7c,$40,$04,$7c,$40,$09,$8c,$8b,$8b,$8b,$8e,$40,$0c,$7c,$40,$04
	.byte $7c,$40,$08,$9a,$8f,$8b,$8b,$8b,$8d,$9c,$40,$06,$9a,$9c,$40,$03
	.byte $7c,$40,$02,$9a,$9c,$7c,$3f,$9a,$9c,$a0,$a1,$40,$03,$9b,$9d,$48
	.byte $03,$9b,$9d,$97,$97,$97,$97,$97,$97,$9b,$9d,$97,$97,$97,$99,$97
	.byte $97,$9b,$9d,$99,$97,$9b,$9d,$93,$94,$40,$03,$9e,$9f,$44,$03,$9e
	.byte $9f,$44,$06,$9e,$9f,$44,$06,$9e,$9f,$44,$02,$9e,$9f,$90,$92,$40
	.byte $03,$9e,$9f,$44,$03,$9e,$9f,$44,$06,$9e,$9f,$44,$06,$9e,$9f,$44
	.byte $02,$9e,$9f,$90,$92,$c2,$c3,$3f,$9e,$9f,$44,$03,$9e,$9f,$44,$06
	.byte $9e,$9f,$44,$06,$9e,$9f,$44,$02,$9e,$9f,$41,$20,$43,$10,$c7,$43
	.byte $15,$c7,$43,$16,$c7,$43,$2e,$c7,$43,$0a,$c7,$43,$12,$c7,$43,$55
	.byte $4c,$20,$20,$4c,$07,$5e,$50,$50,$50,$50,$50,$50,$50,$4b,$10,$30
	.byte $ff,$40,$02,$7b,$40,$1f,$7a,$40,$1f,$a4,$40,$07,$be,$bf,$c0,$40
	.byte $14,$a0,$7f,$a1,$40,$1d,$a2,$a4,$a2,$40,$1c,$a6,$a8,$a9,$aa,$a7
	.byte $40,$1b,$a6,$ab,$ac,$ad,$a7,$40,$17,$be,$c0,$40,$02,$a6,$ae,$af
	.byte $61,$a7,$40,$1c,$a4,$a2,$a4,$40,$0e,$a0,$a1,$40,$04,$a0,$a1,$40
	.byte $07,$a3,$a5,$a3,$40,$0e,$93,$94,$40,$04,$93,$94,$40,$07,$a4,$a2
	.byte $a4,$40,$0e,$95,$96,$40,$04,$95,$96,$40,$07,$a3,$a5,$a3,$40,$0e
	.byte $90,$92,$45,$04,$90,$92,$40,$06,$97,$48,$03,$97,$40,$05,$a0,$a1
	.byte $40,$05,$b2,$90,$92,$40,$04,$90,$92,$b0,$40,$05,$46,$05,$40,$05
	.byte $93,$94,$40,$05,$b3,$90,$92,$40,$04,$90,$92,$b1,$40,$05,$46,$05
	.byte $40,$02,$c1,$c3,$3f,$90,$92,$b6,$40,$03,$bc,$b8,$90,$92,$40,$04
	.byte $90,$92,$b4,$b6,$40,$03,$bc,$46,$05,$3f,$c1,$41,$02,$c3,$90,$92
	.byte $b7,$b9,$ba,$bb,$bd,$b5,$90,$92,$40,$04,$90,$92,$b5,$b7,$b9,$ba
	.byte $bb,$bd,$41,$0c,$45,$06,$41,$02,$45,$04,$41,$02,$45,$06,$43,$15
	.byte $c7,$43,$10,$c7,$43,$16,$c7,$43,$3c,$c7,$43,$0e,$c7,$43,$11,$c7
	.byte $43,$44,$4c,$1a,$80,$a0,$a0,$a0,$a0,$a0,$4c,$02,$88,$aa,$aa,$aa
	.byte $aa,$aa,$50,$5c,$5b,$5a,$5a,$5a,$5a,$5a,$4b,$10,$30,$40,$05,$7d
	.byte $40,$0f,$e6,$e7,$40,$04,$7d,$40,$19,$e8,$e9,$40,$1e,$be,$bf,$40
	.byte $0c,$7d,$40,$07,$7d,$40,$09,$be,$bf,$40,$1e,$c0,$c1,$40,$1e,$c0
	.byte $c1,$40,$08,$7d,$40,$15,$c2,$c3,$40,$17,$7d,$40,$06,$c2,$c3,$40
	.byte $04,$7d,$40,$19,$c4,$c5,$40,$1d,$c6,$c7,$ce,$cf,$40,$1c,$c8,$c9
	.byte $d0,$d1,$40,$0d,$7d,$40,$0e,$ca,$cb,$d2,$d3,$40,$0b,$fd,$fc,$40
	.byte $03,$7d,$40,$02,$7d,$40,$08,$cc,$cd,$d2,$d4,$40,$02,$7d,$40,$02
	.byte $fc,$7d,$40,$02,$fd,$fc,$3f,$74,$75,$71,$75,$71,$72,$fd,$3f,$fc
	.byte $40,$02,$fc,$7d,$3f,$7d,$d5,$d6,$d7,$d7,$d7,$d8,$7d,$3f,$fd,$40
	.byte $02,$fd,$fd,$71,$74,$73,$6f,$43,$06,$71,$73,$74,$75,$71,$73,$fc
	.byte $fd,$3f,$da,$db,$de,$df,$e2,$e3,$3f,$7d,$fc,$3f,$fc,$3f,$fc,$43
	.byte $0a,$85,$83,$84,$f7,$43,$02,$71,$72,$d9,$dc,$dd,$e0,$e1,$7d,$e4
	.byte $e5,$74,$75,$71,$71,$72,$6f,$43,$04,$85,$fa,$f7,$83,$84,$f7,$43
	.byte $02,$85,$43,$02,$85,$43,$02,$6d,$6e,$6e,$6d,$6a,$3a,$64,$65,$43
	.byte $07,$fa,$f7,$85,$fa,$f7,$43,$04,$85,$43,$02,$f7,$81,$82,$83,$43
	.byte $06,$6a,$41,$02,$64,$65,$43,$02,$81,$82,$85,$43,$0e,$85,$f7,$83
	.byte $81,$82,$83,$f7,$43,$02,$6a,$3a,$fe,$3a,$64,$65,$43,$0b,$fa,$f7
	.byte $85,$43,$03,$f8,$f9,$43,$03,$85,$83,$84,$43,$02,$6a,$3a,$fe,$41
	.byte $02,$64,$65,$43,$05,$85,$43,$09,$fa,$43,$0a,$6a,$41,$05,$43,$3c
	.byte $6a,$41,$03,$43,$1d,$6a,$41,$02,$4c,$0d,$50,$4c,$07,$55,$4c,$07
	.byte $55,$4c,$06,$50,$55,$10,$4c,$05,$04,$85,$a1,$4c,$07,$8a,$aa,$4c
	.byte $07,$aa,$30,$30,$30,$30,$30,$40,$1b,$7d,$40,$09,$7d,$40,$2d,$7d
	.byte $40,$6f,$7d,$40,$1a,$7d,$40,$0b,$7d,$40,$76,$7d,$40,$06,$7d,$40
	.byte $0a,$7d,$40,$02,$ea,$eb,$eb,$eb,$eb,$eb,$ee,$40,$03,$fd,$3f,$74
	.byte $75,$71,$73,$73,$72,$40,$09,$7d,$40,$04,$ec,$49,$05,$ef,$3f,$7d
	.byte $40,$02,$6f,$43,$06,$71,$75,$71,$72,$73,$74,$75,$71,$73,$3f,$fd
	.byte $40,$03,$f0,$f1,$f2,$3f,$f6,$f1,$f5,$40,$02,$7d,$6f,$43,$04,$f7
	.byte $81,$82,$85,$43,$08,$70,$3f,$fd,$3f,$fd,$ea,$f3,$ee,$3f,$ea,$f3
	.byte $ee,$3f,$fd,$75,$43,$02,$f7,$7a,$85,$3b,$85,$85,$43,$06,$85,$81
	.byte $82,$f7,$71,$72,$fc,$fd,$f0,$f4,$f5,$7d,$f0,$f4,$f5,$3f,$6f,$3b
	.byte $f7,$81,$82,$85,$43,$03,$83,$84,$85,$43,$04,$85,$f7,$3b,$85,$83
	.byte $84,$71,$75,$6e,$60,$3a,$fe,$3a,$61,$6d,$6e,$f8,$f9,$43,$02,$85
	.byte $43,$05,$f7,$f8,$f9,$f7,$43,$07,$85,$43,$03,$62,$3a,$fe,$3a,$63
	.byte $3b,$85,$43,$02,$85,$fa,$f7,$43,$04,$85,$43,$02,$85,$43,$05,$85
	.byte $fa,$f7,$83,$84,$f7,$60,$41,$02,$fe,$41,$02,$61,$43,$08,$f7,$81
	.byte $82,$85,$43,$04,$85,$81,$82,$f7,$85,$43,$04,$62,$41,$05,$63,$43
	.byte $03,$64,$65,$43,$09,$85,$81,$82,$f7,$43,$06,$60,$41,$03,$fe,$41
	.byte $03,$61,$f8,$f9,$43,$20,$41,$04,$64,$65,$43,$0b,$85,$85,$3b,$60
	.byte $41,$04,$fe,$41,$04,$61,$3b,$41,$06,$64,$65,$43,$0c,$62,$41,$09
	.byte $63,$3b,$4c,$25,$54,$55,$11,$4c,$05,$84,$a5,$01,$a0,$4c,$04,$a8
	.byte $aa,$22,$aa,$aa,$4c,$03,$aa,$aa,$aa,$30,$30,$30,$40,$23,$b8,$40
	.byte $1f,$b7,$40,$07,$b8,$40,$17,$ad,$40,$07,$b7,$40,$17,$ad,$40,$07
	.byte $ad,$40,$13,$b8,$40,$03,$ad,$40,$07,$ad,$40,$13,$b7,$40,$03,$b7
	.byte $40,$07,$b7,$40,$0c,$b8,$40,$06,$ad,$40,$03,$ad,$40,$07,$ad,$40
	.byte $0c,$b7,$40,$06,$ad,$40,$03,$ad,$40,$07,$ad,$40,$07,$89,$40,$04
	.byte $ad,$40,$06,$ad,$40,$03,$ad,$40,$07,$ad,$40,$05,$8e,$b4,$3b,$b5
	.byte $93,$40,$02,$ad,$40,$06,$b7,$40,$03,$ad,$40,$07,$ad,$40,$05,$90
	.byte $43,$03,$94,$40,$02,$b7,$40,$06,$ad,$40,$03,$b7,$40,$07,$ad,$73
	.byte $72,$40,$03,$95,$49,$03,$96,$40,$02,$ad,$40,$06,$ad,$40,$03,$ad
	.byte $40,$06,$75,$6d,$43,$02,$70,$40,$02,$b1,$b2,$b2,$b2,$b3,$40,$02
	.byte $ad,$40,$06,$ad,$40,$03,$ad,$40,$03,$73,$74,$6f,$43,$05,$71,$3f
	.byte $87,$b6,$b6,$b6,$86,$74,$72,$ad,$40,$06,$b7,$4d,$03,$ad,$3f,$74
	.byte $75,$3b,$83,$f7,$3b,$85,$43,$02,$f7,$3b,$71,$6d,$6e,$6c,$6e,$6d
	.byte $43,$02,$6d,$71,$6f,$71,$72,$40,$02,$ad,$4e,$03,$ad,$6f,$43,$03
	.byte $f7,$80,$f7,$85,$85,$f7,$85,$3b,$f7,$85,$3b,$85,$43,$09,$70,$3f
	.byte $ad,$ba,$ba,$bc,$6e,$43,$02,$f7,$85,$43,$02,$f7,$85,$80,$81,$f7
	.byte $85,$43,$02,$85,$f7,$7a,$7b,$f7,$85,$3b,$f7,$3b,$85,$43,$02,$71
	.byte $6e,$bb,$bc,$43,$04,$f8,$f9,$85,$43,$02,$f7,$85,$3b,$f7,$81,$82
	.byte $78,$79,$7e,$7f,$80,$84,$7a,$f7,$3b,$f7,$7a,$85,$43,$03,$6c,$43
	.byte $03,$85,$3b,$f7,$43,$05,$f7,$7a,$f8,$f9,$85,$7a,$f7,$3b,$85,$3b
	.byte $f7,$43,$03,$85,$78,$7f,$f7,$43,$02,$65,$43,$06,$85,$fa,$43,$0b
	.byte $f7,$43,$03,$f7,$81,$82,$43,$02,$83,$84,$3b,$3a,$64,$65,$43,$02
	.byte $f7,$7a,$f7,$85,$3b,$85,$f9,$85,$3b,$85,$43,$03,$f7,$85,$3b,$f7
	.byte $3b,$f7,$85,$43,$07,$43,$20,$41,$05,$64,$65,$43,$19,$41,$07,$64
	.byte $65,$43,$17,$4c,$21,$c0,$70,$f3,$00,$c0,$4c,$02,$50,$4a,$03,$f5
	.byte $fd,$fd,$73,$4a,$10,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30
	.byte $30,$30,$30,$30,$30,$30,$30,$30,$40,$2b,$b8,$40,$1f,$b7,$40,$1f
	.byte $ad,$40,$0b,$89,$40,$13,$ad,$40,$09,$8c,$8a,$3b,$8b,$8d,$40,$0b
	.byte $b8,$40,$05,$ad,$40,$08,$8e,$8f,$43,$03,$92,$93,$40,$0a,$b7,$40
	.byte $05,$b7,$40,$08,$90,$91,$43,$04,$94,$40,$0a,$ad,$40,$05,$ad,$40
	.byte $05,$aa,$a6,$a7,$95,$49,$05,$96,$a6,$a7,$aa,$40,$07,$ad,$40,$05
	.byte $ad,$40,$03,$aa,$3f,$ab,$a8,$a9,$97,$48,$05,$98,$a8,$a9,$ab,$3f
	.byte $aa,$40,$05,$ad,$40,$05,$ad,$40,$03,$97,$9c,$ac,$9c,$9c,$9b,$9d
	.byte $9c,$9c,$9c,$fb,$9a,$9c,$9c,$ac,$99,$98,$40,$05,$b7,$40,$05,$ad
	.byte $40,$03,$9b,$a4,$ad,$9e,$a0,$9b,$9a,$9e,$9f,$a0,$9b,$9a,$9e,$a0
	.byte $ad,$a4,$9a,$40,$05,$ad,$40,$05,$b7,$40,$03,$9b,$ae,$ad,$a2,$a1
	.byte $9b,$9a,$a2,$eb,$a1,$9b,$9a,$a2,$a1,$ad,$ae,$9a,$40,$05,$ad,$40
	.byte $05,$ad,$40,$03,$9b,$3a,$ad,$9e,$a0,$9b,$9a,$a3,$a4,$a3,$9b,$9a
	.byte $9e,$a0,$ad,$3a,$9a,$40,$05,$ad,$40,$05,$ad,$40,$03,$9b,$a4,$ad
	.byte $a2,$a1,$9b,$9a,$a3,$a5,$a3,$9b,$9a,$a2,$a1,$ad,$a4,$9a,$40,$05
	.byte $ad,$40,$05,$ad,$4d,$14,$73,$74,$72,$40,$02,$ad,$74,$75,$71,$72
	.byte $3f,$ad,$4e,$14,$3b,$f9,$7a,$71,$75,$6d,$83,$84,$43,$02,$71,$6e
	.byte $88,$ba,$ba,$ba,$ba,$ba,$ba,$ba,$ba,$ba,$ba,$b9,$ba,$ba,$ba,$ba
	.byte $ba,$ba,$ba,$ba,$85,$f8,$f9,$43,$04,$80,$84,$f7,$43,$03,$88,$bb
	.byte $bb,$bb,$bb,$bb,$bb,$bb,$bb,$bb,$b9,$bb,$bb,$bb,$bb,$bb,$bb,$bb
	.byte $bb,$f7,$f9,$43,$06,$f7,$85,$43,$04,$68,$69,$41,$02,$6b,$69,$3b
	.byte $60,$3a,$bd,$3a,$61,$6b,$69,$41,$03,$6b,$43,$0a,$f7,$43,$03,$76
	.byte $77,$41,$02,$64,$77,$3b,$62,$3a,$bd,$3a,$63,$64,$77,$41,$03,$64
	.byte $43,$02,$f7,$43,$02,$83,$84,$f7,$43,$04,$76,$77,$41,$02,$6b,$69
	.byte $41,$02,$60,$41,$02,$bd,$41,$02,$61,$3b,$6b,$69,$41,$02,$43,$28
	.byte $76,$77,$41,$04,$6b,$69,$41,$02,$3b,$60,$41,$03,$bd,$41,$03,$61
	.byte $41,$02,$6b,$69,$43,$06,$76,$77,$41,$06,$64,$77,$41,$02,$3b,$62
	.byte $41,$03,$bd,$41,$03,$63,$41,$02,$64,$77,$4c,$28,$ff,$dc,$73,$50
	.byte $50,$50,$50,$50,$4a,$05,$aa,$ae,$4a,$05,$fb,$aa,$aa,$ff,$30,$30
	.byte $40,$15,$00,$01,$40,$1e,$00,$01,$40,$1e,$02,$03,$40,$1e,$02,$03
	.byte $40,$1e,$02,$03,$40,$1e,$02,$03,$40,$1e,$04,$05,$40,$1b,$07,$08
	.byte $09,$47,$02,$0a,$0b,$0c,$40,$16,$0d,$09,$47,$08,$0a,$0e,$40,$15
	.byte $11,$11,$11,$0f,$10,$0f,$10,$11,$11,$11,$40,$07,$20,$21,$22,$40
	.byte $0e,$12,$0f,$13,$14,$10,$15,$40,$07,$23,$24,$25,$41,$02,$26,$27
	.byte $40,$0a,$07,$08,$09,$47,$04,$0a,$0b,$0c,$40,$05,$6d,$6e,$68,$69
	.byte $6b,$6c,$6e,$6d,$71,$72,$73,$40,$04,$0d,$09,$47,$0a,$0a,$0e,$40
	.byte $03,$43,$08,$85,$3b,$85,$70,$40,$04,$11,$11,$11,$0f,$10,$0f,$10
	.byte $0f,$10,$11,$11,$11,$40,$04,$3b,$85,$43,$02,$85,$3b,$f7,$85,$3b
	.byte $85,$43,$02,$71,$72,$73,$74,$73,$75,$6d,$6e,$6e,$6d,$6e,$6d,$6d
	.byte $71,$72,$73,$74,$75,$71,$73,$79,$7b,$7c,$3b,$f7,$7a,$7b,$7c,$f7
	.byte $f7,$85,$85,$7a,$7b,$7f,$85,$3b,$85,$43,$03,$85,$43,$03,$85,$3b
	.byte $f7,$85,$f7,$43,$02,$f7,$f9,$80,$7e,$79,$7e,$7f,$80,$79,$79,$7e
	.byte $79,$7e,$7f,$f7,$3b,$f7,$f8,$85,$43,$04,$82,$f7,$85,$f8,$f9,$85
	.byte $83,$84,$f7,$43,$02,$f7,$85,$3b,$f7,$85,$f7,$43,$04,$85,$43,$03
	.byte $f8,$3b,$81,$82,$3b,$f7,$81,$82,$f7,$43,$06,$83,$f7,$43,$02,$85
	.byte $f8,$f9,$83,$84,$43,$02,$85,$43,$02,$85,$f8,$f9,$43,$04,$83,$84
	.byte $f7,$85,$43,$2d,$85,$3b,$f7,$81,$82,$f7,$3b,$85,$43,$0e,$85,$fa
	.byte $83,$f7,$43,$61,$4c,$20,$aa,$aa,$50,$4c,$05,$4b,$04,$5d,$5f,$57
	.byte $4b,$11,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30
	.byte $30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$40,$48,$00,$01,$40
	.byte $1e,$00,$01,$40,$1e,$16,$17,$40,$1c,$1f,$18,$19,$1a,$1b,$1c,$40
	.byte $1b,$12,$1d,$1e,$15,$40,$05,$00,$01,$40,$14,$1f,$18,$19,$1a,$1b
	.byte $1c,$40,$04,$16,$17,$40,$15,$12,$1d,$1e,$15,$40,$03,$1f,$18,$19
	.byte $1a,$1b,$1c,$40,$12,$1f,$18,$19,$1a,$1b,$1c,$40,$03,$12,$1d,$1e
	.byte $15,$40,$14,$12,$1d,$1e,$15,$40,$03,$1f,$18,$19,$1a,$1b,$1c,$40
	.byte $12,$1f,$18,$19,$1a,$1b,$1c,$40,$03,$12,$1d,$1e,$15,$40,$13,$74
	.byte $75,$6d,$6e,$71,$72,$73,$75,$71,$75,$6e,$6d,$71,$72,$74,$75,$71
	.byte $72,$73,$73,$6f,$70,$74,$73,$74,$75,$40,$02,$73,$75,$71,$75,$43
	.byte $07,$85,$43,$04,$f7,$85,$43,$03,$85,$43,$05,$85,$43,$02,$74,$75
	.byte $43,$04,$f7,$43,$03,$85,$43,$06,$f7,$85,$43,$02,$f7,$43,$04,$85
	.byte $43,$04,$f7,$83,$84,$43,$0b,$f7,$43,$07,$85,$43,$02,$85,$43,$03
	.byte $f7,$3b,$f7,$78,$43,$02,$6a,$41,$02,$fe,$41,$03,$fe,$41,$02,$fe
	.byte $41,$02,$fe,$41,$03,$fe,$41,$03,$fe,$41,$05,$6b,$6c,$43,$02,$85
	.byte $3b,$6a,$41,$07,$fe,$41,$05,$fe,$41,$02,$fe,$41,$04,$fe,$41,$02
	.byte $67,$43,$03,$f7,$43,$03,$6a,$41,$02,$fe,$41,$05,$fe,$41,$09,$fe
	.byte $41,$03,$67,$43,$02,$85,$f7,$43,$02,$85,$43,$02,$68,$69,$41,$0b
	.byte $fe,$41,$07,$67,$43,$02,$85,$81,$82,$f8,$f9,$83,$f7,$43,$03,$6a
	.byte $41,$10,$6b,$6c,$3b,$f7,$3b,$f7,$43,$2e,$6a,$41,$09,$67,$43,$16
	.byte $68,$69,$41,$06,$67,$43,$0a,$4c,$20,$50,$50,$70,$50,$70,$50,$50
	.byte $50,$95,$a5,$a5,$a5,$a5,$a5,$a5,$a5,$55,$9a,$aa,$aa,$aa,$aa,$6a
	.byte $4b,$04,$aa,$aa,$aa,$4b,$02,$30,$30,$30,$30,$30,$30,$30,$30,$30
	.byte $30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$40,$d4,$e3,$e4,$e1
	.byte $40,$0d,$e3,$e4,$e1,$40,$0b,$e3,$e4,$41,$02,$eb,$e1,$40,$0a,$e3
	.byte $e4,$41,$02,$eb,$e5,$e6,$e3,$e6,$40,$05,$e3,$e2,$41,$04,$e7,$e8
	.byte $e1,$40,$07,$e3,$e2,$41,$05,$e9,$ea,$3a,$e7,$e5,$e6,$3f,$e3,$e4
	.byte $41,$08,$e7,$e5,$e6,$40,$05,$41,$0c,$e9,$ea,$41,$0b,$e7,$e8,$e5
	.byte $e6,$40,$02,$f0,$4f,$03,$fd,$fd,$fb,$4f,$04,$fd,$fb,$c5,$fd,$fb
	.byte $4f,$05,$fd,$fb,$fd,$fb,$4f,$02,$fd,$fe,$fa,$fe,$c2,$f4,$f6,$f6
	.byte $f6,$f6,$f7,$f6,$f7,$f7,$f7,$f7,$f7,$f6,$f6,$f7,$f6,$f7,$f7,$f6
	.byte $f6,$f6,$f6,$f7,$f6,$f7,$f6,$f6,$f7,$f7,$f7,$f6,$f4,$f5,$fa,$f8
	.byte $f8,$f9,$f9,$f9,$f9,$f8,$f9,$f9,$f8,$f8,$f8,$f8,$f8,$f9,$f9,$f8
	.byte $f9,$f9,$f9,$f9,$f9,$f8,$f8,$f8,$f9,$f8,$f9,$f8,$f5,$3a,$3b,$cf
	.byte $fa,$fb,$c9,$c9,$c9,$c9,$c9,$ca,$c6,$c6,$c6,$c6,$c6,$c8,$c9,$c9
	.byte $c9,$c9,$c9,$ca,$c6,$c6,$c6,$c6,$c8,$c8,$fd,$fa,$fa,$fe,$43,$04
	.byte $c4,$3a,$73,$41,$13,$fd,$fe,$cc,$cc,$cd,$cd,$ce,$43,$02,$cf,$3b
	.byte $c4,$41,$10,$73,$c5,$fd,$fe,$fa,$fb,$41,$04,$3b,$cb,$43,$04,$fa
	.byte $fb,$3a,$73,$41,$0b,$c5,$fc,$43,$04,$cb,$fa,$fb,$c5,$fc,$43,$07
	.byte $cf,$c4,$41,$06,$73,$fc,$fa,$fb,$fd,$fe,$3b,$cb,$43,$04,$cf,$43
	.byte $03,$ce,$43,$09,$fa,$fb,$41,$04,$fc,$43,$07,$cf,$43,$02,$cb,$43
	.byte $06,$ce,$43,$03,$cf,$3b,$cb,$3b,$cf,$3b,$fa,$fb,$fc,$fe,$43,$03
	.byte $cf,$cb,$43,$07,$ce,$43,$64,$4c,$20,$a0,$a0,$a0,$a0,$a0,$a0,$a0
	.byte $a8,$ae,$4a,$05,$bf,$aa,$aa,$aa,$ef,$bf,$af,$ab,$aa,$aa,$aa,$aa
	.byte $aa,$aa,$aa,$aa,$aa,$aa,$30,$30,$30,$30,$30,$30,$30,$40,$0e,$7b
	.byte $40,$1f,$7a,$40,$1f,$1f,$40,$1f,$26,$40,$1f,$26,$40,$19,$7b,$3f
	.byte $a0,$d6,$3f,$13,$14,$15,$40,$18,$7a,$3f,$77,$d8,$d9,$13,$14,$15
	.byte $40,$18,$1f,$a0,$da,$db,$dc,$16,$17,$18,$40,$18,$26,$77,$d8,$dd
	.byte $de,$19,$26,$1a,$40,$05,$ec,$ed,$40,$11,$26,$d7,$d7,$d7,$d7,$19
	.byte $26,$1a,$40,$05,$ee,$ef,$40,$09,$f0,$40,$06,$23,$24,$d7,$d7,$d7
	.byte $d7,$1b,$1b,$1b,$f1,$ed,$3f,$ec,$f1,$3a,$f3,$ed,$40,$06,$e3,$e4
	.byte $f3,$ed,$f0,$40,$04,$25,$27,$d7,$d7,$d7,$d7,$1c,$1c,$1c,$f3,$ef
	.byte $f0,$ee,$41,$03,$ef,$f0,$40,$02,$f0,$e3,$e4,$4f,$02,$3a,$ef,$f2
	.byte $f0,$40,$03,$d0,$d1,$d7,$d7,$d7,$d7,$1d,$1d,$1d,$41,$04,$f3,$41
	.byte $03,$f2,$f1,$f1,$fc,$fa,$fe,$f6,$f7,$4f,$03,$f2,$ec,$ed,$3f,$d0
	.byte $d1,$d7,$d7,$d7,$d7,$1c,$1c,$1c,$fe,$fa,$fb,$c5,$fc,$fa,$fb,$41
	.byte $02,$f3,$fc,$43,$03,$c4,$fa,$43,$03,$c4,$ee,$ef,$21,$d0,$d1,$d7
	.byte $00,$01,$d5,$1c,$1c,$22,$43,$04,$cf,$43,$02,$c4,$c5,$fc,$43,$03
	.byte $cf,$43,$02,$cc,$cc,$cc,$cc,$c4,$c5,$26,$d2,$d3,$02,$03,$04,$05
	.byte $1d,$1d,$26,$f7,$cd,$cd,$f7,$cc,$cc,$cc,$f7,$fc,$43,$07,$41,$04
	.byte $cd,$cc,$26,$1e,$1e,$06,$07,$07,$08,$1e,$1e,$26,$f3,$3a,$f3,$41
	.byte $03,$c5,$fc,$ce,$cb,$43,$06,$c4,$41,$05,$26,$20,$20,$09,$0a,$0b
	.byte $0c,$20,$20,$26,$f3,$41,$03,$fd,$fe,$ce,$43,$05,$cb,$43,$04,$fa
	.byte $fb,$41,$03,$26,$20,$20,$0d,$0e,$0f,$10,$20,$20,$26,$f3,$41,$02
	.byte $fc,$3b,$cb,$3b,$cb,$3b,$cb,$43,$07,$cf,$ce,$c4,$3a,$3a,$26,$3a
	.byte $3a,$0d,$11,$12,$10,$3a,$3a,$26,$3a,$3a,$fc,$43,$07,$ce,$43,$09
	.byte $fa,$fb,$d4,$3b,$c5,$fd,$fb,$41,$03,$3b,$d4,$fd,$fe,$ce,$3b,$cb
	.byte $3b,$3b,$cf,$43,$06,$cf,$43,$61,$4b,$1d,$a5,$4b,$02,$aa,$66,$55
	.byte $55,$aa,$aa,$aa,$a0,$aa,$66,$55,$55,$aa,$aa,$aa,$aa,$aa,$26,$a5
	.byte $25,$aa,$aa,$aa,$aa,$aa,$aa,$aa,$aa,$aa,$aa,$aa,$aa,$30,$30,$30
	.byte $30,$30,$30,$30,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$60,$c6,$72,$c6,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$a9,$58,$8d,$33,$d1,$a9,$ea,$8d,$9f,$83,$8d,$a0
	.byte $83,$8d,$a1,$83,$d0,$17,$a9,$58,$8d,$33,$d1,$a9,$9b,$8d,$a0,$83
	.byte $a9,$c6,$8d,$a1,$83,$a9,$20,$8d,$9f,$83,$4c,$00,$d0,$a9,$20,$8d
	.byte $ae,$83,$a9,$fe,$8d,$af,$83,$a9,$9d,$8d,$b0,$83,$4c,$00,$d0,$a5
	.byte $33,$29,$03,$f0,$2e,$c9,$01,$f0,$1e,$c9,$02,$f0,$0c,$a0,$c0,$b9
	.byte $00,$07,$8d,$04,$20,$c8,$30,$f7,$60,$a0,$80,$b9,$00,$07,$8d,$04
	.byte $20,$c8,$c0,$c0,$90,$f5,$60,$a0,$40,$b9,$00,$07,$8d,$04,$20,$c8
	.byte $10,$f7,$60,$a0,$00,$b9,$00,$07,$8d,$04,$20,$c8,$c0,$40,$90,$f5
	.byte $60,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff
;This appears to be the startup code - Evenball
Lbl_d000:
	sei 
	lda #$00
	sta $2000
	cld 

Lbl_d007:
	lda $2002
	bpl Lbl_d007
	lda #$00
	sta $2000
	nop 

Lbl_d012:
	lda $2002
	bpl Lbl_d012
	ldx #$ff
	txs 
	lda #$00
	sta $4010
	lda #$40
	sta $4017
	lda #$00
	ldy #$10

Lbl_d028:
	sta a:$0000,y
	iny 
	bne Lbl_d028
	sta $5e
	sta $60
	sta $3c
	sta $0100
	lda #$64
	sta $3b
	jsr Lbl_a2a2

Lbl_d03e:
	jsr Lbl_a38e
	lda #$00
	sta $20
	sta $2000
	sta $21
	sta $2001
	sta $26
	sta $24
	lda #$ff
	sta $62
	jsr Lbl_d2e1
	lda #$00
	sta $67
	jsr Lbl_ff0c
	sta $33
	sta $34
	jsr Lbl_874f
	jsr Lbl_a5cc
	lda #$00
	sta $67
	jsr Lbl_ff0c
	jsr Lbl_8929
	jmp Lbl_d03e

Lbl_d076:
	lda #$00
	sta $2000
	sta $2001
	jsr Lbl_d369
	jsr Lbl_85b2
	jsr Lbl_85be
	lda $5e
	bmi Lbl_d092

Lbl_d08b:
	lda #$ff
	sta $e2
	jsr Lbl_d369

Lbl_d092:
	lda #$00
	sta $2000
	sta $20
	sta $2001
	sta $21
	jsr Lbl_a38e
	jsr Lbl_821d
	jsr Lbl_81dc
	jsr Lbl_8195
	jsr Lbl_81a2
	lda #$00
	sta $2001
	lda #$00
	sta $67
	jsr Lbl_ff0c
	lda $61
	clc 
	adc #$31
	tax 
	lda #$21
	sta $2006
	lda #$8b
	sta $2006
	stx $2007
	ldx #$00

Lbl_d0ce:
	lda Lbl_8868,x
	sta $2007
	inx 
	cpx #$07
	bcc Lbl_d0ce
	lda #$10
	sta $2000
	jsr Lbl_d1e9

Lbl_d0e1:
	lda #$00
	sta $33
	sta $34
	sta $27
	jsr Lbl_d2e1
	lda #$00
	sta $63
	sta $19
	sta $1a
	sta $33
	sta $34
	sta $65
	jsr Lbl_9c18
	jsr Lbl_d2bc
	jsr Lbl_d333
	jsr Lbl_9017
	jsr Lbl_db1d
	lda #$00
	sta $1d
	sta $1f
	lda #$80
	sta $28
	jsr Lbl_a2af
	jsr Lbl_9dfe
	inc $33
	jsr Lbl_9dfe
	jsr Lbl_9032
	lda #$10
	sta $5f
	lda #$18
	sta $2001
	sta $21
	lda #$90
	sta $20
	sta $2000
	nop 

Lbl_d134:
	lda $5c
	bpl Lbl_d134
	lda #$00
	sta $2000
	lda #$00
	sta $5f
	jsr Lbl_a572
	lda $20
	sta $2000

Lbl_d149:
	lda $63
	and #$1e
	cmp #$10
	bne Lbl_d164
	lda $5c
	cmp #$70
	bne Lbl_d15d
	jsr Lbl_84fc
	jmp Lbl_d164

Lbl_d15d:
	cmp #$90
	bne Lbl_d164
	jsr Lbl_852f

Lbl_d164:
	lda $63
	bpl Lbl_d16b
	jmp Lbl_d216

Lbl_d16b:
	and #$01
	beq Lbl_d149
	lda $20
	and #$7f
	sta $2000
	sta $20
	jsr Lbl_d2fc
	jsr Lbl_a38e
	dec $a2
	jsr Lbl_d18e
	jsr Lbl_8a5b
	bcs Lbl_d18b
	jmp Lbl_d092

Lbl_d18b:
	jmp Lbl_d03e

Lbl_d18e:
	bmi Lbl_d191
	rts 

Lbl_d191:
	lda #$10
	sta $20
	sta $2000
	lda #$00
	sta $21
	sta $2001
	jsr Lbl_8195
	jsr Lbl_821d
	jsr Lbl_81dc
	lda #$21
	sta $2006
	lda #$cb
	sta $2006
	ldx #$00

Lbl_d1b4:
	lda Lbl_d20c,x
	sta $2007
	inx 
	cpx #$09
	bcc Lbl_d1b4
	lda #$21
	sta $2006
	lda #$6b
	sta $2006
	ldx #$00

Lbl_d1cb:
	lda Lbl_8868,x
	sta $2007
	inx 
	cpx #$07
	bcc Lbl_d1cb
	lda $61
	clc 
	adc #$31
	tax 
	lda #$21
	sta $2006
	lda #$73
	sta $2006
	stx $2007

Lbl_d1e9:
	lda $2002
	lda #$00
	sta $2005
	sta $2005
	lda #$0a
	sta $2001
	lda #$08
	sta $17
	ldx #$00
	ldy #$00

Lbl_d201:
	dey 
	bne Lbl_d201
	dex 
	bne Lbl_d201
	dec $17
	bne Lbl_d201
	rts 

Lbl_d20c:
	.byte $47,$41,$4d,$45,$40,$4f,$56,$45,$52,$40

Lbl_d216:
	inc $a0
	lda $a0
	cmp #$06
	bcc Lbl_d222
	lda #$00
	sta $a0

Lbl_d222:
	inc $a1
	lda #$00
	sta $2000
	sta $20
	sta $2001
	sta $21
	sta $24
	sta $26
	jsr Lbl_d374
	jsr Lbl_8195
	jsr Lbl_81a2
	ldy #$0f
	jsr Lbl_d2e1
	lda #$02
	sta $67
	jsr Lbl_ff0c
	jsr Lbl_a0f4
	jsr Lbl_9e2d
	ldx #$76
	lda $2002
	lda #$21
	sta $11
	lda #$0a
	sta $10
	jsr Lbl_8fc1
	lda #$21
	sta $2006
	lda #$4f
	sta $2006
	lda $47
	sta $2007
	lda $46
	sta $2007
	jsr Lbl_820a
	jsr Lbl_d389
	lda $a4
	sta $5b
	lda #$00
	sta $5a
	sta $5c
	lda #$20
	sta $5f
	lda #$80
	sta $28
	lda #$90
	sta $20
	sta $2000
	lda #$18
	sta $21
	sta $2001

Lbl_d299:
	lda $5a
	cmp #$ff
	bne Lbl_d299
	lda #$00
	sta $5f
	sta $2000
	sta $20
	sta $2001
	sta $21
	ldx #$0b

Lbl_d2af:
	lda Lbl_85cd,x
	sta $a0,x
	inx 
	cpx #$20
	bcc Lbl_d2af
	jmp Lbl_d0e1

Lbl_d2bc:
	lda #$1d
	sta $5c
	lda #$20
	sta $2006
	lda #$93
	sta $2006
	ldx #$00

Lbl_d2cc:
	lda Lbl_d2db,x
	sta $2007
	inx 
	cpx #$06
	bcc Lbl_d2cc
	jsr Lbl_820a
	rts 

Lbl_d2db:
	.byte $52,$45,$41,$44,$59,$40

Lbl_d2e1:
	lda $67
	cmp #$03
	beq Lbl_d2fb
	ldx #$00
	txa 

Lbl_d2ea:
	sta $0600,x
	inx 
	bne Lbl_d2ea
	lda #$f0

Lbl_d2f2:
	sta $0700,x
	dex 
	dex 
	dex 
	dex 
	bne Lbl_d2f2

Lbl_d2fb:
	rts 

Lbl_d2fc:
	ldx #$40
	lda $61
	lsr a 
	bcs Lbl_d305
	ldx #$00

Lbl_d305:
	lda #$00
	sta $10
	lda #$03
	sta $11

Lbl_d30d:
	lda #$00
	sta $0240,x
	ldy #$07

Lbl_d314:
	lda ($10),y
	cmp #$3e
	bne Lbl_d32a
	sec 
	ror $0240,x
	dey 
	bpl Lbl_d314

Lbl_d321:
	inx 
	jsr Lbl_d35b
	cmp #$05
	bcc Lbl_d30d
	rts 

Lbl_d32a:
	clc 
	ror $0240,x
	dey 
	bpl Lbl_d314
	bmi Lbl_d321

Lbl_d333:
	ldx #$40
	lda $61
	lsr a 
	bcs Lbl_d33c
	ldx #$00

Lbl_d33c:
	lda #$00
	sta $10
	lda #$03
	sta $11

Lbl_d344:
	ldy #$07

Lbl_d346:
	lsr $0240,x
	bcc Lbl_d34f
	lda #$3e
	sta ($10),y

Lbl_d34f:
	dey 
	bpl Lbl_d346
	inx 
	jsr Lbl_d35b
	cmp #$05
	bcc Lbl_d344
	rts 

Lbl_d35b:
	lda $10
	clc 
	adc #$08
	sta $10
	lda $11
	adc #$00
	sta $11
	rts 

Lbl_d369:
	ldy #$7f
	lda #$00

Lbl_d36d:
	sta $0240,y
	dey 
	bpl Lbl_d36d
	rts 

Lbl_d374:
	ldx #$40
	ldy #$3f
	lda $61
	lsr a 
	bcs Lbl_d37f
	ldx #$00

Lbl_d37f:
	lda #$00

Lbl_d381:
	sta $0240,x
	inx 
	dey 
	bpl Lbl_d381
	rts 

Lbl_d389:
	lda $a0
	jsr Lbl_825c

Lbl_d38e:
	.byte $42

Lbl_d38f:
	.byte $d4,$9a,$d3,$9a,$d3,$ee,$d3,$ee,$d3,$a0,$d4,$a9,$04,$85,$10,$a9
	.byte $d9,$85,$11,$20,$fc,$d4,$a9,$54,$85,$10,$a9,$d6,$85,$11,$20,$09
	.byte $d5,$a9,$04,$85,$10,$a9,$d8,$85,$11,$20,$2a,$d5,$ad,$02,$20,$a9
	.byte $22,$8d,$06,$20,$a9,$04,$85,$10,$8d,$06,$20,$a2,$00,$a0,$00,$bd
	.byte $44,$d5,$8d,$07,$20,$c8,$e8,$c0,$08,$d0,$f4,$a5,$10,$18,$69,$20
	.byte $b0,$0c,$85,$10,$a0,$22,$8c,$06,$20,$8d,$06,$20,$d0,$df,$60,$a9
	.byte $24,$85,$10,$a9,$d9,$85,$11,$20,$fc,$d4,$a9,$bd,$85,$10,$a9,$d6
	.byte $85,$11,$20,$09,$d5,$a9,$44,$85,$10,$a9,$d8,$85,$11,$20,$2a,$d5
	.byte $ad,$02,$20,$a9,$22,$8d,$06,$20,$a9,$04,$85,$10,$8d,$06,$20,$a2
	.byte $00,$a0,$00,$bd,$84,$d5,$8d,$07,$20,$c8,$e8,$c0,$08,$d0,$f4,$a5
	.byte $10,$18,$69,$20,$b0,$0c,$85,$10,$a0,$22,$8c,$06,$20,$8d,$06,$20
	.byte $d0,$df,$60,$a9,$44,$85,$10,$a9,$d9,$85,$11,$20,$fc,$d4,$a9,$2e
	.byte $85,$10,$a9,$d7,$85,$11,$20,$09,$d5,$a9,$84,$85,$10,$a9,$d8,$85
	.byte $11,$20,$2a,$d5,$ad,$02,$20,$a9,$22,$85,$11,$8d,$06,$20,$a9,$04
	.byte $85,$10,$8d,$06,$20,$a2,$00,$a0,$00,$bd,$c4,$d5,$8d,$07,$20,$c8
	.byte $e8,$c0,$08,$d0,$f4,$a5,$10,$18,$69,$20,$85,$10,$a5,$11,$69,$00
	.byte $85,$11,$8d,$06,$20,$a5,$10,$8d,$06,$20,$e0,$50,$b0,$02,$d0,$d7
	.byte $60,$a9,$64,$85,$10,$a9,$d9,$85,$11,$20,$fc,$d4,$a9,$93,$85,$10
	.byte $a9,$d7,$85,$11,$20,$09,$d5,$a9,$c4,$85,$10,$a9,$d8,$85,$11,$20
	.byte $2a,$d5,$ad,$02,$20,$a9,$22,$85,$11,$8d,$06,$20,$a9,$44,$85,$10
	.byte $8d,$06,$20,$a2,$00,$a0,$00,$bd,$14,$d6,$8d,$07,$20,$c8,$e8,$c0
	.byte $08,$d0,$f4,$a5,$10,$18,$69,$20,$85,$10,$a5,$11,$69,$00,$85,$11
	.byte $8d,$06,$20,$a5,$10,$8d,$06,$20,$e0,$40,$90,$d9,$60,$a0,$1f,$b1
	.byte $10,$99,$20,$02,$88,$10,$f8,$4c,$dc,$81,$a0,$00,$b1,$10,$c9,$ff
	.byte $f0,$18,$99,$04,$07,$c8,$b1,$10,$99,$04,$07,$c8,$b1,$10,$99,$04
	.byte $07,$c8,$b1,$10,$99,$04,$07,$c8,$d0,$e2,$60,$a0,$00,$ad,$02,$20
	.byte $a9,$23,$8d,$06,$20,$a9,$c0,$8d,$06,$20,$b1,$10,$8d,$07,$20,$c8
	.byte $c0,$40,$d0,$f6,$60,$03,$04,$05,$06,$07,$08,$09,$03,$03,$0a,$0b
	.byte $0c,$0d,$0e,$0f,$03,$03,$10,$11,$12,$00,$13,$14,$03,$03,$16,$17
	.byte $00,$00,$15,$03,$03,$18,$19,$1a,$00,$ef,$1b,$03,$03,$1c,$1d,$1e
	.byte $1f,$20,$21,$03,$03,$22,$23,$24,$25,$03,$03,$2b,$2c,$27,$28,$29
	.byte $2a,$03,$26,$2d,$2e,$02,$50,$51,$00,$00,$52,$53,$54,$02,$55,$00
	.byte $00,$00,$00,$56,$57,$58,$59,$5a,$00,$00,$5b,$5c,$5d,$5e,$5f,$60
	.byte $00,$00,$61,$62,$63,$64,$65,$66,$67,$68,$69,$6a,$6b,$6c,$6d,$6e
	.byte $6f,$70,$71,$72,$73,$74,$75,$76,$77,$78,$79,$7a,$7b,$7c,$7d,$7e
	.byte $7f,$80,$81,$82,$83,$02,$02,$b9,$84,$02,$b5,$02,$02,$85,$b8,$b6
	.byte $86,$87,$88,$02,$02,$89,$8a,$8b,$8c,$8d,$8e,$8f,$90,$91,$92,$93
	.byte $94,$95,$96,$97,$98,$99,$9a,$9b,$b7,$00,$00,$00,$00,$9e,$9f,$a0
	.byte $00,$00,$00,$00,$00,$9c,$9d,$a1,$a2,$a3,$a4,$a5,$a6,$a7,$a8,$a9
	.byte $aa,$02,$02,$02,$02,$ab,$ac,$ad,$ae,$af,$02,$02,$02,$b0,$b1,$b2
	.byte $b3,$b4,$02,$02,$02,$ba,$bb,$bc,$01,$01,$bd,$be,$bf,$c0,$c1,$c2
	.byte $c3,$01,$c4,$c5,$c6,$c7,$c8,$c9,$ca,$f0,$cb,$cc,$cd,$ce,$cf,$d0
	.byte $d1,$01,$01,$01,$d2,$d3,$d4,$d5,$d6,$d7,$01,$d8,$d9,$da,$db,$dc
	.byte $dd,$de,$01,$df,$e0,$e1,$e2,$e3,$e4,$e5,$01,$e6,$e7,$e8,$e9,$ea
	.byte $eb,$ec,$01,$ed,$ee,$87,$04,$00,$36,$87,$05,$00,$40,$87,$06,$00
	.byte $48,$8f,$07,$00,$30,$8f,$08,$00,$38,$8f,$09,$00,$40,$8f,$0a,$00
	.byte $48,$97,$0b,$00,$28,$97,$0c,$00,$30,$97,$0d,$00,$38,$97,$0e,$00
	.byte $40,$97,$0f,$00,$48,$9f,$10,$00,$30,$9f,$11,$00,$38,$9f,$12,$00
	.byte $40,$9f,$13,$00,$48,$a7,$14,$00,$36,$a7,$15,$00,$3e,$af,$16,$01
	.byte $38,$af,$17,$01,$40,$b7,$18,$01,$38,$97,$19,$01,$20,$97,$1a,$01
	.byte $28,$9f,$1b,$01,$20,$a7,$1c,$01,$46,$a7,$6a,$01,$3e,$ff,$7f,$1d
	.byte $01,$30,$7f,$1e,$01,$38,$7f,$1e,$41,$40,$7f,$1d,$41,$48,$87,$20
	.byte $01,$30,$87,$31,$01,$40,$87,$20,$41,$48,$87,$22,$00,$30,$87,$23
	.byte $00,$38,$87,$24,$00,$40,$87,$25,$00,$48,$8f,$34,$01,$30,$8f,$32
	.byte $01,$38,$8f,$33,$01,$40,$8f,$34,$41,$48,$8f,$26,$00,$30,$8f,$27
	.byte $00,$38,$8f,$28,$00,$40,$8f,$29,$00,$48,$97,$30,$02,$2e,$97,$2a
	.byte $00,$34,$97,$2b,$00,$3c,$97,$2c,$00,$44,$9f,$2d,$00,$34,$9f,$2e
	.byte $00,$3c,$9f,$2f,$00,$44,$97,$1f,$02,$4a,$87,$21,$01,$38,$ff,$7f
	.byte $35,$00,$30,$7f,$36,$00,$38,$87,$37,$00,$28,$87,$38,$00,$30,$87
	.byte $39,$00,$38,$8f,$3a,$01,$20,$8f,$3b,$00,$28,$8f,$3c,$00,$30,$8f
	.byte $3d,$00,$38,$97,$3e,$01,$20,$97,$3f,$01,$28,$97,$40,$00,$30,$97
	.byte $41,$00,$38,$9f,$42,$01,$28,$9f,$43,$01,$30,$9f,$44,$00,$38,$9f
	.byte $45,$00,$40,$a7,$46,$00,$38,$a7,$47,$00,$40,$af,$48,$00,$2c,$af
	.byte $49,$00,$38,$af,$4a,$00,$40,$b7,$4b,$00,$38,$bf,$4c,$00,$3c,$c7
	.byte $4d,$00,$40,$ff,$a1,$4e,$00,$21,$a1,$4f,$00,$29,$a1,$50,$00,$31
	.byte $a1,$51,$00,$39,$9b,$52,$00,$40,$a3,$53,$00,$40,$a9,$54,$00,$21
	.byte $a9,$55,$00,$29,$a9,$56,$00,$31,$a9,$57,$00,$39,$b1,$58,$01,$20
	.byte $b1,$59,$01,$28,$b1,$5a,$01,$30,$b1,$5b,$00,$2a,$b5,$5c,$01,$3a
	.byte $b2,$5d,$01,$50,$b2,$5e,$01,$58,$b9,$5f,$01,$20,$b9,$60,$01,$28
	.byte $b9,$61,$01,$30,$b9,$62,$01,$38,$c1,$63,$01,$24,$c1,$64,$01,$2c
	.byte $c1,$65,$01,$34,$c9,$66,$01,$28,$c9,$67,$01,$30,$c7,$68,$01,$38
	.byte $b9,$69,$02,$38,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$00,$00,$ff,$ff,$ff,$ff,$ff,$ff,$55,$aa
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$0f,$0f,$0f
	.byte $0f,$0f,$0f,$0f,$0f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$aa,$aa,$ff,$ff,$ff,$ff,$ff,$ff,$05,$05
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$0f,$0f,$0f
	.byte $0f,$0f,$0f,$0f,$0f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$00,$00
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$00,$00,$ff,$ff,$ff,$ff,$ff,$ff,$00,$00
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$00,$00,$ff,$ff,$ff,$ff,$ff,$0f,$0f,$0f
	.byte $0f,$0f,$0f,$0f,$0f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$0f,$5f,$ff,$ff,$ff,$ff,$ff,$ff,$40,$55
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$f0,$f8,$ff,$ff,$ff,$ff,$ff,$0f,$0f,$0f
	.byte $0f,$0f,$0f,$0f,$0f,$0f,$38,$27,$21,$0f,$20,$10,$26,$0f,$20,$26
	.byte $21,$0f,$22,$16,$20,$0f,$36,$17,$10,$0f,$21,$10,$20,$0f,$0f,$0f
	.byte $20,$0f,$0f,$0f,$0f,$0f,$20,$16,$10,$0f,$20,$26,$10,$0f,$20,$21
	.byte $26,$0f,$22,$16,$20,$0f,$36,$17,$0f,$0f,$38,$27,$0f,$0f,$20,$10
	.byte $0f,$0f,$0f,$0f,$0f,$0f,$37,$27,$10,$0f,$0f,$0f,$0f,$0f,$0f,$0f
	.byte $0f,$0f,$22,$16,$20,$0f,$38,$36,$20,$0f,$28,$27,$20,$0f,$0f,$0f
	.byte $20,$0f,$0f,$0f,$0f,$0f,$21,$26,$37,$0f,$21,$36,$11,$0f,$21,$11
	.byte $01,$0f,$22,$16,$20,$0f,$36,$17,$38,$0f,$20,$17,$10,$0f,$26,$0f
	.byte $0f,$0f,$0f,$0f,$0f

Lbl_d984:
	.byte $a4

Lbl_d985:
	.byte $d9,$eb,$d9,$d5,$d9,$ba,$d9,$04,$da,$16,$da,$2c,$da,$40,$da,$56
	.byte $da,$6c,$da,$82,$da,$a1,$da,$b7,$da,$cc,$da,$e0,$da,$ff,$da,$3d
	.byte $40,$1f,$0c,$1f,$0c,$1e,$0c,$1f,$0c,$1f,$0c,$1e,$0c,$1f,$0c,$1f
	.byte $0c,$1e,$0c,$80,$ff,$40,$3d,$06,$14,$0c,$14,$0c,$14,$0c,$14,$06
	.byte $0a,$0c,$34,$0c,$2a,$06,$14,$0c,$14,$0c,$14,$0c,$14,$06,$80,$ff
	.byte $3d,$40,$26,$0a,$1e,$0a,$1e,$0a,$20,$0a,$1e,$0a,$1e,$0a,$20,$0a
	.byte $1e,$0a,$1e,$0a,$8c,$ff,$40,$3d,$08,$10,$0a,$16,$10,$16,$0a,$16
	.byte $02,$22,$0a,$28,$0a,$2a,$10,$14,$0a,$14,$0a,$18,$10,$84,$ff,$3d
	.byte $40,$18,$18,$18,$18,$20,$18,$18,$18,$18,$20,$18,$18,$18,$18,$a0
	.byte $ff,$3d,$40,$20,$0a,$14,$0a,$12,$0a,$3c,$0a,$36,$0a,$16,$0a,$20
	.byte $0a,$14,$0a,$14,$0a,$90,$ff,$3d,$40,$1b,$0a,$19,$07,$18,$08,$1b
	.byte $0c,$3f,$0a,$46,$0a,$16,$0a,$16,$0a,$9d,$ff,$3d,$40,$12,$0a,$18
	.byte $0c,$20,$0c,$1c,$0c,$14,$0c,$26,$0c,$22,$0c,$20,$0c,$10,$0c,$a4
	.byte $ff,$3d,$40,$20,$0a,$1e,$0a,$20,$0a,$1c,$1a,$0e,$13,$1f,$0a,$24
	.byte $0a,$20,$10,$14,$12,$80,$ff,$3d,$40,$20,$18,$10,$18,$20,$05,$1b
	.byte $10,$20,$10,$1b,$05,$1c,$0c,$13,$0a,$13,$0a,$9e,$ff,$40,$3d,$08
	.byte $10,$10,$10,$10,$10,$10,$10,$08,$08,$10,$10,$10,$10,$10,$10,$10
	.byte $08,$08,$10,$10,$10,$10,$10,$10,$10,$08,$80,$ff,$3d,$40,$12,$16
	.byte $13,$15,$10,$16,$12,$18,$1a,$16,$10,$16,$1e,$0c,$1a,$16,$10,$16
	.byte $8a,$ff,$40,$3d,$06,$12,$16,$12,$18,$18,$1e,$12,$28,$10,$10,$10
	.byte $1e,$12,$10,$10,$1c,$9c,$ff,$3d,$40,$18,$17,$10,$12,$10,$15,$0a
	.byte $6a,$10,$06,$10,$10,$10,$0d,$27,$1c,$80,$ff,$40,$3d,$08,$1b,$0a
	.byte $1b,$16,$14,$0e,$08,$08,$08,$0b,$0a,$16,$0a,$11,$0a,$0a,$16,$08
	.byte $08,$0b,$0a,$16,$0a,$11,$14,$0e,$80,$ff,$3d,$40,$18,$0c,$10,$0c
	.byte $10,$0c,$10,$0c,$08,$18,$0c,$10,$0c,$10,$0c,$10,$0c,$08,$18,$0c
	.byte $10,$0c,$10,$0c,$10,$0c,$88,$ff

Lbl_db1d:
	ldx #$80
	lda #$00
	sta $0601,x
	ldx #$98
	sta $0601,x
	ldx #$18
	sta $0601,x
	ldx #$60
	sta $0601,x
	rts 

Lbl_db34:
	ldx #$80
	ldy #$00
	lda $a6
	cmp #$17
	bcc Lbl_db3f
	iny 

Lbl_db3f:
	jsr Lbl_dd29
	jsr Lbl_dbac
	ldx #$98
	ldy #$40
	lda $a6
	cmp #$23
	bcc Lbl_db50
	iny 

Lbl_db50:
	jsr Lbl_dd29
	jsr Lbl_dbac
	jsr Lbl_de1a
	ldx #$18
	ldy #$80
	jsr Lbl_dd29
	jsr Lbl_dbac
	ldx #$60
	jsr Lbl_dbac
	lda $29
	cmp #$40
	bcs Lbl_db7a
	lda $a6
	cmp #$0c
	bcs Lbl_db75
	rts 

Lbl_db75:
	lda $34
	lsr a 
	bcc Lbl_db81

Lbl_db7a:
	ldx #$60
	ldy #$c1
	jsr Lbl_dd29

Lbl_db81:
	rts 

Lbl_db82:
	.byte $a9,$00,$9d,$01,$06,$a9,$f0,$9d,$00,$06,$8a,$48,$a0,$05,$a9,$f0
	.byte $9d,$00,$07,$e8,$e8,$e8,$e8,$88,$10,$f6,$68,$aa,$60

Lbl_db9f:
	and #$10
	beq Lbl_db81
	jmp Lbl_dc56

Lbl_dba6:
	.byte $20,$11,$dd,$4c,$56,$dc

Lbl_dbac:
	lda $0601,x
	bpl Lbl_dc0f
	tay 
	and #$18
	bne Lbl_db9f
	lda $0603,x
	cmp #$f8
	bcs Lbl_db82
	cmp #$08
	bcc Lbl_db82
	tya 
	and #$20
	bne Lbl_dba6
	tya 
	and #$40
	bne Lbl_dc2d
	ldy #$78
	jsr Lbl_969d
	bcc Lbl_dc10
	ldy #$7c
	jsr Lbl_969d
	bcc Lbl_dc10
	jsr Lbl_969b
	bcs Lbl_dbfc
	jsr Lbl_951d
	lda $0603,x
	pha 
	lda #$fc
	sta $0683
	sta $069b
	sta $061b
	sta $0663
	pla 
	sta $0603,x
	lda #$98
	sta $0601,x

Lbl_dbfc:
	jsr Lbl_dc61
	lda $33
	and #$0c
	lsr a 
	tay 
	lda $0602,x
	bmi Lbl_dc0b
	iny 

Lbl_dc0b:
	tya 
	jsr Lbl_de62

Lbl_dc0f:
	rts 

Lbl_dc10:
	txa 
	pha 
	tya 
	tax 
	jsr Lbl_9505
	pla 
	tax 
	ldy #$02
	jsr Lbl_a60a
	lda #$04
	jsr Lbl_a244
	lda $0601,x
	ora #$40
	sta $0601,x
	bne Lbl_dbfc

Lbl_dc2d:
	jsr Lbl_dcce
	jsr Lbl_969b
	bcs Lbl_dc53
	lda $0601,x
	ora #$20
	sta $0601,x
	lda #$40
	ldy $0603,x
	cpy #$80
	bcc Lbl_dc48
	lda #$80

Lbl_dc48:
	sta $0602,x
	ldy #$0a
	jsr Lbl_a60a
	jsr Lbl_dd90

Lbl_dc53:
	jsr Lbl_dc61

Lbl_dc56:
	lda $33
	and #$1c
	lsr a 
	lsr a 
	ora #$08
	jmp Lbl_de62

Lbl_dc61:
	jsr Lbl_919f
	beq Lbl_dc6e
	lda $33
	lsr a 
	bcs Lbl_dc6e
	inc $0600,x

Lbl_dc6e:
	lda $0602,x
	asl a 
	bcs Lbl_dc78
	asl a 
	bcs Lbl_dca3
	rts 

Lbl_dc78:
	lda $2e
	bmi Lbl_dc8f
	cmp #$08
	bcc Lbl_dc8e
	lda $19
	and #$80
	bne Lbl_dc8b
	lda $33
	lsr a 
	bcs Lbl_dc8e

Lbl_dc8b:
	dec $0603,x

Lbl_dc8e:
	rts 

Lbl_dc8f:
	cmp #$f8
	bcs Lbl_dc8e
	lda $0602,x
	lsr a 
	bcc Lbl_dc9c
	inc $0603,x

Lbl_dc9c:
	inc $0603,x
	inc $0603,x
	rts 

Lbl_dca3:
	lda $2e
	bpl Lbl_dcba
	cmp #$f8
	bcs Lbl_dcb9
	lda $19
	and #$40
	bne Lbl_dcb6
	lda $33
	lsr a 
	bcs Lbl_dcb9

Lbl_dcb6:
	inc $0603,x

Lbl_dcb9:
	rts 

Lbl_dcba:
	cmp #$08
	bcc Lbl_dc8e
	lda $0602,x
	lsr a 
	bcc Lbl_dcc7
	dec $0603,x

Lbl_dcc7:
	dec $0603,x
	dec $0603,x
	rts 

Lbl_dcce:
	lda #$80
	jsr Lbl_dcfb
	bcc Lbl_dceb
	lda #$98
	jsr Lbl_dcfb
	bcc Lbl_dceb
	lda #$18
	jsr Lbl_dcfb
	bcc Lbl_dceb
	lda #$60
	jsr Lbl_dcfb
	bcc Lbl_dceb
	rts 

Lbl_dceb:
	lda $0601,y
	sta $0601,x
	lda $0602,y
	sta $0602,x
	jsr Lbl_dde7
	rts 

Lbl_dcfb:
	sta $10
	cpx $10
	beq Lbl_dd0f
	tay 
	lda $0601,y
	and #$a0
	cmp #$a0
	bne Lbl_dd0f
	jsr Lbl_969d
	rts 

Lbl_dd0f:
	sec 
	rts 

Lbl_dd11:
	.byte $bd,$02,$06,$0a,$b0,$04,$0a,$b0,$08,$60,$fe,$03,$06,$fe,$03,$06
	.byte $60,$de,$03,$06,$de,$03,$06,$60

Lbl_dd29:
	lda $0601,x
	bmi Lbl_dd62
	lda $34
	cmp #$02
	bcc Lbl_dd62
	tya 
	cmp $33
	bne Lbl_dd62
	pha 
	lda $2e
	bmi Lbl_dd63
	lda #$80
	sta $0601,x
	ldy $2a
	bit $27
	bvc Lbl_dd4a
	iny 

Lbl_dd4a:
	lda Lbl_dd88,y
	sta $0600,x
	lda #$f0
	sta $0603,x
	ldy #$80
	pla 
	and #$01
	beq Lbl_dd5e
	ldy #$41

Lbl_dd5e:
	tya 
	sta $0602,x

Lbl_dd62:
	rts 

Lbl_dd63:
	lda #$80
	sta $0601,x
	ldy $2a
	bit $27
	bvs Lbl_dd6f
	iny 

Lbl_dd6f:
	lda Lbl_dd88,y
	sta $0600,x
	lda #$08
	sta $0603,x
	ldy #$40
	pla 
	and #$01
	beq Lbl_dd83
	ldy #$81

Lbl_dd83:
	tya 
	sta $0602,x
	rts 

Lbl_dd88:
	.byte $3e,$6e,$3e,$6e,$6e,$9e,$9e,$ce

Lbl_dd90:
	txa 
	pha 
	ldx #$e0
	lda $a0
	cmp #$03
	bne Lbl_dda8
	lda $a4
	cmp #$1d
	beq Lbl_dde3
	cmp #$1e
	beq Lbl_dde3
	cmp #$1f
	beq Lbl_dde3

Lbl_dda8:
	lda $27
	and #$06
	tay 

Lbl_ddad:
	lda Lbl_de11,y
	sta $0701,x
	lda Lbl_de10,y
	jsr Lbl_a244
	lda $0640
	sec 
	sbc #$10
	sta $0600,x
	sta $0700,x
	sta $0704,x
	lda $0643
	sta $0603,x

Lbl_ddce:
	lda #$03
	sta $0702,x
	sta $0706,x
	lda #$0f
	sta $0705,x
	lda #$40
	sta $0601,x
	pla 
	tax 
	rts 

Lbl_dde3:
	ldy #$08
	bne Lbl_ddad

Lbl_dde7:
	txa 
	pha 
	ldx #$e8
	lda #$32
	jsr Lbl_a244
	lda #$18
	sta $0701,x
	pla 
	pha 
	tay 
	lda $0600,y
	sec 
	sbc #$10
	sta $0600,x
	sta $0700,x
	sta $0704,x
	lda $0603,y
	sta $0603,x
	jmp Lbl_ddce

Lbl_de10:
	.byte $0a

Lbl_de11:
	.byte $2c,$14,$2d,$1e,$2e,$28,$2f,$63,$19

Lbl_de1a:
	ldx #$e0
	jsr Lbl_de25
	ldx #$e8
	jsr Lbl_de25
	rts 

Lbl_de25:
	lda $0603,x
	cmp #$f0
	bcs Lbl_de41
	dec $0601,x
	beq Lbl_de41
	jsr Lbl_9666
	lda $0603,x
	sta $0703,x
	clc 
	adc #$08
	sta $0707,x
	rts 

Lbl_de41:
	lda #$f0
	sta $0600,x
	sta $0700,x
	sta $0704,x
	rts 

Lbl_de4d:
	.byte $a5,$33,$4a,$90,$15,$a9,$f8,$a0,$05,$9d,$00,$07,$e8,$e8,$e8,$e8
	.byte $88,$10,$f6,$68,$60

Lbl_de62:
	pha 
	cpx #$18
	beq Lbl_de4d
	pla 
	pha 
	ldy $a0
	lda Lbl_df59,y
	sta $18
	pla 
	asl a 
	asl a 
	asl a 
	tay 
	lda #$05
	sta $12
	lda $0600,x
	sta $10
	lda $0603,x
	sta $11
	lda Lbl_ded9,y
	sta $16
	lda Lbl_dee0,y
	sta $17
	iny 
	txa 
	pha 

Lbl_de90:
	tya 
	pha 
	lda $12
	asl a 
	tay 
	lda Lbl_92a0,y
	sta $13
	lda Lbl_92a1,y
	sta $14
	pla 
	tay 
	lda $10
	clc 
	adc $13
	sta $0700,x
	inx 
	lda Lbl_ded9,y
	clc 
	adc $18
	sta $0700,x
	inx 
	iny 
	jsr Lbl_decd
	sta $0700,x
	inx 
	lda $11
	clc 
	adc $14
	sta $0700,x
	inx 
	dec $12
	bpl Lbl_de90
	pla 
	tax 
	rts 

Lbl_decd:
	lda $12
	cmp #$03
	bcc Lbl_ded6
	lda $16
	rts 

Lbl_ded6:
	lda $17
	rts 

Lbl_ded9:
	.byte $00,$c2,$c4,$c5,$c3,$c6,$c7

Lbl_dee0:
	.byte $01,$40,$c5,$c4,$c2,$c7,$c6,$c3,$41,$00,$c2,$c4,$c5,$e1,$c6,$e2
	.byte $01,$40,$c5,$c4,$c2,$e2,$c6,$e1,$41,$00,$c2,$e0,$c5,$e3,$c6,$e4
	.byte $01,$40,$c5,$e0,$c2,$e4,$c6,$e3,$41,$00,$c2,$e0,$c5,$e5,$c6,$e6
	.byte $01,$40,$c5,$e0,$c2,$e6,$c6,$e5,$41,$00,$c8,$c9,$cc,$ca,$cb,$ce
	.byte $01,$00,$d4,$d5,$d8,$d6,$d7,$da,$01,$40,$d8,$d5,$d4,$da,$d7,$d6
	.byte $41,$40,$cc,$c9,$c8,$ce,$cb,$ca,$41,$40,$dd,$dc,$d9,$df,$de,$db
	.byte $41,$40,$d1,$d0,$cd,$d3,$d2,$cf,$41,$00,$cd,$d0,$d1,$cf,$d2,$d3
	.byte $01,$00,$d9,$dc,$dd,$db,$de,$df,$01

Lbl_df59:
	.byte $00,$25,$25,$25,$00,$25,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff

Lbl_ff00:
	pha 
	and #$ff
	beq Lbl_ff07
	lda #$01

Lbl_ff07:
	jsr Lbl_ff0c
	pla 
	rts 

Lbl_ff0c:
	pha 
	sty $06f0
	tay 
	sta Lbl_8000,y
	ldy $06f0
	pla 
	rts 

Lbl_ff19:
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$20,$43,$49,$54,$59,$20,$43,$4f,$4e
	.byte $4e,$45,$43,$54,$49,$4f,$4e,$19,$54,$73,$30,$22,$01,$01,$0e,$0a
	.byte $21

.segment "VECTORS"

	.word $838d
	.word $d000
	.word $842e
        
.segment "TILES_0"
.include "CC_Chr_0.s"

.segment "TILES_1"
.include "CC_Chr_1.s"

.segment "TILES_2"
.include "CC_Chr_2.s"

.segment "TILES_3"
.include "CC_Chr_3.s"
