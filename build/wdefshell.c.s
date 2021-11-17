#NO_APP
	.file	"wdefshell.c"
	.text
	.section	.text.BUTTONFRAMEPROC,"ax",@progbits
	.align	2
	.globl	BUTTONFRAMEPROC
	.type	BUTTONFRAMEPROC, @function
BUTTONFRAMEPROC:
	link.w %fp,#-16
	move.l %d3,-(%sp)
	move.l 10(%fp),-(%sp)
	move.w #1,-(%sp)
	pea -14(%fp)
	pea -12(%fp)
	move.l %fp,%d3
	subq.l #8,%d3
	move.l %d3,-(%sp)
	.short 0xa98d
	move.l %d3,-(%sp)
	move.w #-4,-(%sp)
	move.w #-4,-(%sp)
	.short 0xa8a9
	move.w #3,-(%sp)
	move.w #3,-(%sp)
	.short 0xa89b
	move.l %d3,-(%sp)
	move.w #16,-(%sp)
	move.w #16,-(%sp)
	.short 0xa8b0
	move.l -20(%fp),%d3
	unlk %fp
	move.l (%a7)+, %a0
	lea 6.w(%a7), %a7
	jmp (%a0)
	.size	BUTTONFRAMEPROC, .-BUTTONFRAMEPROC
	.pushsection .text.BUTTONFRAMEPROC.macsbug,"ax",@progbits
# macsbug symbol
	.byte 143
	.ascii	"BUTTONFRAMEPROC"
	.align 2,0
	.short 0
	.popsection
	.section	.text._log,"ax",@progbits
	.align	2
	.globl	_log
	.type	_log, @function
_log:
	link.w %fp,#-64
	move.l %d3,-(%sp)
	move.l 8(%fp),%d3
	move.l %d3,-(%sp)
	jsr strlen
	move.b %d0,-64(%fp)
	moveq #0,%d1
	not.b %d1
	and.l %d0,%d1
	move.l %d1,(%sp)
	move.l %d3,-(%sp)
	pea -63(%fp)
	jsr memcpy
	move.b _log_line,%d1
	move.b %d1,%d2
	addq.b #1,%d2
	move.b %d2,_log_line
	move.w #300,-(%sp)
	and.w #255,%d1
	move.w %d1,%d0
	add.w %d1,%d0
	add.w %d0,%d0
	add.w %d1,%d0
	add.w %d0,%d0
	add.w #40,%d0
	move.w %d0,-(%sp)
	.short 0xa893
	pea -64(%fp)
	.short 0xa884
	clr.w %d0
	move.b _log_line,%d0
	moveq #20,%d2
	and.l #0xFFFF,%d0
	divu.w %d2,%d0
	move.l %d0,%d1
	swap %d1
	move.b %d1,_log_line
	lea (12,%sp),%sp
	move.l -68(%fp),%d3
	unlk %fp
	rts
	.size	_log, .-_log
	.pushsection .text._log.macsbug,"ax",@progbits
# macsbug symbol
	.byte 132
	.ascii	"_log"
	.align 2,0
	.short 0
	.popsection
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
	.section	.text._logI,"ax",@progbits
	.align	2
	.globl	_logI
	.type	_logI, @function
_logI:
	link.w %fp,#-96
	move.l %a2,-(%sp)
	move.l 8(%fp),-(%sp)
	pea .LC0
	lea (-96,%fp),%a2
	move.l %a2,-(%sp)
	jsr sprintf
	move.l %a2,-(%sp)
	jsr strlen
	move.b %d0,-64(%fp)
	move.l %d0,(%sp)
	move.l %a2,-(%sp)
	pea -63(%fp)
	jsr memcpy
	move.b _log_line,%d1
	move.b %d1,%d0
	addq.b #1,%d0
	move.b %d0,_log_line
	move.w #300,-(%sp)
	and.w #255,%d1
	move.w %d1,%d0
	add.w %d1,%d0
	add.w %d0,%d0
	add.w %d1,%d0
	add.w %d0,%d0
	add.w #40,%d0
	move.w %d0,-(%sp)
	.short 0xa893
	pea -64(%fp)
	.short 0xa884
	clr.w %d0
	move.b _log_line,%d0
	moveq #20,%d2
	and.l #0xFFFF,%d0
	divu.w %d2,%d0
	move.l %d0,%d1
	swap %d1
	move.b %d1,_log_line
	lea (24,%sp),%sp
	move.l -100(%fp),%a2
	unlk %fp
	rts
	.size	_logI, .-_logI
	.pushsection .text._logI.macsbug,"ax",@progbits
# macsbug symbol
	.byte 133
	.ascii	"_logI"
	.align 2,0
	.short 0
	.popsection
	.section	.text.MakeNewWindow,"ax",@progbits
	.align	2
	.globl	MakeNewWindow
	.type	MakeNewWindow, @function
MakeNewWindow:
	subq.l #4,%sp
	clr.l -(%sp)
	pea _initialWindowRect
	move.l 16(%sp),-(%sp)
	move.b #1,-(%sp)
	move.w 26(%sp),-(%sp)
	pea -1.w
	move.b #1,-(%sp)
	clr.l -(%sp)
	.short 0xa913
	move.l (%sp),_window
	addq.l #4,%sp
	rts
	.size	MakeNewWindow, .-MakeNewWindow
	.pushsection .text.MakeNewWindow.macsbug,"ax",@progbits
# macsbug symbol
	.byte 141
	.ascii	"MakeNewWindow"
	.align 2,0
	.short 0
	.popsection
	.section	.text.InitCustomWDEF,"ax",@progbits
	.align	2
	.globl	InitCustomWDEF
	.type	InitCustomWDEF, @function
InitCustomWDEF:
	move.l %a2,-(%sp)
	subq.l #4,%sp
	move.l #1464091974,-(%sp)
	move.w #128,-(%sp)
	.short 0xa9a0
	move.l (%sp),%a2
	addq.l #4,%sp
	move.l %a2,%a0
	.short 0xa029
	move.l (%a2),%a0
	move.l #MYWINDOWDEFPROC,6(%a0)
	move.l (%sp)+,%a2
	rts
	.size	InitCustomWDEF, .-InitCustomWDEF
	.pushsection .text.InitCustomWDEF.macsbug,"ax",@progbits
# macsbug symbol
	.byte 142
	.ascii	"InitCustomWDEF"
	.align 2,0
	.short 0
	.popsection
	.section	.text.ShowAboutBox,"ax",@progbits
	.align	2
	.globl	ShowAboutBox
	.type	ShowAboutBox, @function
ShowAboutBox:
	subq.l #8,%sp
	movem.l #4144,-(%sp)
	subq.l #4,%sp
	move.w #128,-(%sp)
	clr.l -(%sp)
	pea -1.w
	.short 0xa9bd
	move.l (%sp),%a2
	move.w qd+92,%d0
	move.w %d0,%d1
	moveq #15,%d2
	lsr.w %d2,%d1
	add.w %d0,%d1
	asr.w #1,%d1
	move.w 22(%a2),%d2
	move.w %d2,%d0
	moveq #15,%d3
	lsr.w %d3,%d0
	add.w %d2,%d0
	asr.w #1,%d0
	sub.w %d0,%d1
	move.w %d1,-(%sp)
	move.w qd+90,%d0
	move.w %d0,%d1
	lsr.w %d3,%d1
	add.w %d0,%d1
	asr.w #1,%d1
	move.w 20(%a2),%d2
	move.w %d2,%d0
	lsr.w %d3,%d0
	add.w %d2,%d0
	asr.w #1,%d0
	sub.w %d0,%d1
	move.w %d1,-(%sp)
	move.b #0,-(%sp)
	.short 0xa91b
	move.l %a2,-(%sp)
	.short 0xa915
	move.l %a2,-(%sp)
	.short 0xa873
	subq.l #4,%sp
	move.l #1413830740,-(%sp)
	move.w #128,-(%sp)
	.short 0xa9a0
	move.l (%sp),%a3
	addq.l #4,%sp
	move.l %a3,%a0
	.short 0xa029
	move.l 16(%a2),%d0
	move.l 20(%a2),%d1
	move.l %d0,12(%sp)
	move.l %d1,16(%sp)
	moveq #12,%d3
	add.l %sp,%d3
	move.l %d3,-(%sp)
	move.w #10,-(%sp)
	move.w #10,-(%sp)
	.short 0xa8a9
	move.l %a3,%a0
	.short 0xa025
	move.l (%a3),-(%sp)
	move.l %d0,-(%sp)
	move.l %d3,-(%sp)
	clr.w -(%sp)
	.short 0xa9ce
	move.l %a3,-(%sp)
	.short 0xa9a3
.L12:
	subq.l #2,%sp
	.short 0xa974
	move.b (%sp),%d0
	addq.l #2,%sp
	jeq .L12
.L13:
	subq.l #2,%sp
	.short 0xa974
	move.b (%sp),%d0
	addq.l #2,%sp
	jne .L13
	move.w #-1,-(%sp)
	clr.w -(%sp)
	.short 0x201f, 0xa032
	move.l %a2,-(%sp)
	.short 0xa914
	movem.l (%sp)+,#3080
	addq.l #8,%sp
	rts
	.size	ShowAboutBox, .-ShowAboutBox
	.pushsection .text.ShowAboutBox.macsbug,"ax",@progbits
# macsbug symbol
	.byte 140
	.ascii	"ShowAboutBox"
	.align 2,0
	.short 0
	.popsection
	.globl	__mulsi3
	.section	.rodata.str1.1
.LC1:
	.string	"DANGER TO MALLOC!"
	.section	.text.showVictoryBox,"ax",@progbits
	.align	2
	.globl	showVictoryBox
	.type	showVictoryBox, @function
showVictoryBox:
	link.w %fp,#-48
	movem.l #7992,-(%sp)
	subq.l #4,%sp
	move.w #128,-(%sp)
	clr.l -(%sp)
	pea -1.w
	.short 0xa97c
	move.l (%sp),-46(%fp)
	addq.l #4,%sp
	.short 0xa850
	move.l -46(%fp),-(%sp)
	move.w #2,-(%sp)
	pea -42(%fp)
	pea -38(%fp)
	lea (-30,%fp),%a2
	move.l %a2,-(%sp)
	.short 0xa98d
	move.l -46(%fp),-(%sp)
	move.w #2,-(%sp)
	move.w -42(%fp),-(%sp)
	pea BUTTONFRAMEPROC
	move.l %a2,-(%sp)
	.short 0xa98e
	pea -34(%fp)
	.short 0xa874
	subq.l #4,%sp
	.short 0xa924
	.short 0xa873
	move.l 8(%fp),%a0
	move.b (%a0),%d4
	moveq #0,%d0
	move.b %d4,%d0
	addq.l #7,%d0
	asr.l #3,%d0
	move.w %d0,-10(%fp)
	move.b 1(%a0),%d3
	moveq #0,%d1
	move.b %d3,%d1
	lea __mulsi3,%a2
	move.l %d0,-(%sp)
	move.l %d1,-(%sp)
	jsr (%a2)
	addq.l #8,%sp
	add.l %d0,%d0
	move.l %d0,-(%sp)
	jsr malloc
	move.l %d0,-14(%fp)
	addq.l #4,%sp
	jeq .L50
	lea (-8,%fp),%a4
	move.l %a4,-(%sp)
	clr.w -(%sp)
	clr.w -(%sp)
	and.w #255,%d4
	move.w %d4,-(%sp)
	and.w #255,%d3
	move.w %d3,-(%sp)
	.short 0xa8a7
	move.l 8(%fp),%a1
	move.b 1(%a1),%d0
	jeq .L37
	clr.b -47(%fp)
	move.w -10(%fp),%a1
.L23:
	cmp.w #0,%a1
	jle .L35
	moveq #0,%d4
	move.b -47(%fp),%d4
	clr.w %d7
	move.b -47(%fp),%d7
	move.l %d4,%d1
	lsl.l #6,%d1
	clr.b %d5
	clr.b %d3
	sub.l %a3,%a3
	move.l 8(%fp),%d6
	add.l %d1,%d6
.L33:
	move.l %d4,-(%sp)
	move.l %a1,-(%sp)
	jsr (%a2)
	addq.l #8,%sp
	move.l -14(%fp),%a0
	add.l %a3,%a0
	clr.b (%a0,%d0.l)
	move.w -10(%fp),%d0
	move.w %d0,%a1
	move.l 8(%fp),%a0
	cmp.b (%a0),%d3
	jcc .L24
	moveq #0,%d1
	move.b %d3,%d1
	move.l %d6,%a0
	add.l %d1,%a0
	tst.b 2690(%a0)
	jeq .L25
	muls.w %d7,%d0
	lea (%a3,%d0.l),%a0
	add.l -14(%fp),%a0
	add.b #-128,(%a0)
	move.w -10(%fp),%d0
	move.w %d0,%a1
.L25:
	move.b %d3,%d1
	addq.b #1,%d1
	move.l 8(%fp),%a0
	cmp.b (%a0),%d1
	jcc .L44
	and.l #255,%d1
	move.l %d6,%a0
	add.l %d1,%a0
	tst.b 2690(%a0)
	jeq .L26
	muls.w %d7,%d0
	lea (%a3,%d0.l),%a0
	add.l -14(%fp),%a0
	add.b #64,(%a0)
	move.w -10(%fp),%d0
	move.w %d0,%a1
.L26:
	move.b %d3,%d1
	addq.b #2,%d1
	move.l 8(%fp),%a0
	cmp.b (%a0),%d1
	jcc .L44
	and.l #255,%d1
	move.l %d6,%a0
	add.l %d1,%a0
	tst.b 2690(%a0)
	jeq .L27
	muls.w %d7,%d0
	lea (%a3,%d0.l),%a0
	add.l -14(%fp),%a0
	add.b #32,(%a0)
	move.w -10(%fp),%d0
	move.w %d0,%a1
.L27:
	move.b %d3,%d1
	addq.b #3,%d1
	move.l 8(%fp),%a0
	cmp.b (%a0),%d1
	jcc .L44
	and.l #255,%d1
	move.l %d6,%a0
	add.l %d1,%a0
	tst.b 2690(%a0)
	jeq .L28
	muls.w %d7,%d0
	lea (%a3,%d0.l),%a0
	add.l -14(%fp),%a0
	add.b #16,(%a0)
	move.w -10(%fp),%d0
	move.w %d0,%a1
.L28:
	move.b %d3,%d1
	addq.b #4,%d1
	move.l 8(%fp),%a0
	cmp.b (%a0),%d1
	jcc .L44
	and.l #255,%d1
	move.l %d6,%a0
	add.l %d1,%a0
	tst.b 2690(%a0)
	jeq .L29
	muls.w %d7,%d0
	lea (%a3,%d0.l),%a0
	add.l -14(%fp),%a0
	addq.b #8,(%a0)
	move.w -10(%fp),%d0
	move.w %d0,%a1
.L29:
	move.b %d3,%d1
	addq.b #5,%d1
	move.l 8(%fp),%a0
	cmp.b (%a0),%d1
	jcc .L44
	and.l #255,%d1
	move.l %d6,%a0
	add.l %d1,%a0
	tst.b 2690(%a0)
	jeq .L30
	muls.w %d7,%d0
	lea (%a3,%d0.l),%a0
	add.l -14(%fp),%a0
	addq.b #4,(%a0)
	move.w -10(%fp),%d0
	move.w %d0,%a1
.L30:
	move.b %d3,%d1
	addq.b #6,%d1
	move.l 8(%fp),%a0
	cmp.b (%a0),%d1
	jcc .L44
	and.l #255,%d1
	move.l %d6,%a0
	add.l %d1,%a0
	tst.b 2690(%a0)
	jeq .L31
	muls.w %d7,%d0
	lea (%a3,%d0.l),%a0
	add.l -14(%fp),%a0
	addq.b #2,(%a0)
	move.w -10(%fp),%d0
	move.w %d0,%a1
.L31:
	move.b %d3,%d1
	addq.b #7,%d1
	move.l 8(%fp),%a0
	cmp.b (%a0),%d1
	jcc .L44
	and.l #255,%d1
	move.l %d6,%a0
	add.l %d1,%a0
	tst.b 2690(%a0)
	jeq .L32
	muls.w %d7,%d0
	lea (%a3,%d0.l),%a0
	add.l -14(%fp),%a0
	addq.b #1,(%a0)
	move.w -10(%fp),%a1
.L32:
	addq.b #8,%d3
.L24:
	addq.b #1,%d5
	moveq #0,%d0
	move.b %d5,%d0
	move.l %d0,%a3
	cmp.l %a3,%a1
	jgt .L33
.L51:
	move.l 8(%fp),%a0
	move.b 1(%a0),%d0
.L35:
	addq.b #1,-47(%fp)
	cmp.b -47(%fp),%d0
	jhi .L23
	and.w #255,%d0
	add.w %d0,%d0
	add.w #30,%d0
	move.l -46(%fp),%a2
	move.w 18(%a2),%a1
	move.w 22(%a2),%a0
	sub.w %a1,%a0
	move.l %a0,%d1
	jpl .L52
	addq.l #1,%d1
.L52:
	asr.l #1,%d1
	move.w %a1,%a0
	add.w %d1,%a0
	move.l 8(%fp),%a1
	move.b (%a1),%d1
	lsr.b #1,%d1
	and.w #255,%d1
	add.w %d1,%d1
	move.w #30,-22(%fp)
	move.w %a0,%a2
	sub.w %d1,%a2
	move.w %a2,-20(%fp)
	move.w %d0,-18(%fp)
	add.w %d1,%a0
	move.w %a0,-16(%fp)
	subq.l #4,%sp
	.short 0xa924
	move.l (%sp),%a0
	lea (-14,%fp),%a1
	move.l %a1,(%sp)
	pea 2(%a0)
	move.l %a4,-(%sp)
	pea -22(%fp)
	clr.w -(%sp)
	clr.l -(%sp)
	.short 0xa8ec
	move.l -34(%fp),-(%sp)
	.short 0xa873
	lea (-40,%fp),%a2
.L36:
	clr.l -(%sp)
	move.l %a2,-(%sp)
	.short 0xa991
	cmp.w #1,-40(%fp)
	jne .L36
	move.l -14(%fp),-(%sp)
	jsr free
	move.w #-1,-(%sp)
	move.w #-1,-(%sp)
	.short 0x201f, 0xa032
	move.l -46(%fp),-(%sp)
	.short 0xa983
	addq.l #4,%sp
	movem.l -80(%fp),#7416
	unlk %fp
	rts
.L44:
	move.b %d1,%d3
	addq.b #1,%d5
	moveq #0,%d0
	move.b %d5,%d0
	move.l %d0,%a3
	cmp.l %a3,%a1
	jgt .L33
	jra .L51
.L37:
	moveq #30,%d0
	move.l -46(%fp),%a2
	move.w 18(%a2),%a1
	move.w 22(%a2),%a0
	sub.w %a1,%a0
	move.l %a0,%d1
	jpl .L53
	addq.l #1,%d1
.L53:
	asr.l #1,%d1
	move.w %a1,%a0
	add.w %d1,%a0
	move.l 8(%fp),%a1
	move.b (%a1),%d1
	lsr.b #1,%d1
	and.w #255,%d1
	add.w %d1,%d1
	move.w #30,-22(%fp)
	move.w %a0,%a2
	sub.w %d1,%a2
	move.w %a2,-20(%fp)
	move.w %d0,-18(%fp)
	add.w %d1,%a0
	move.w %a0,-16(%fp)
	subq.l #4,%sp
	.short 0xa924
	move.l (%sp),%a0
	lea (-14,%fp),%a1
	move.l %a1,(%sp)
	pea 2(%a0)
	move.l %a4,-(%sp)
	pea -22(%fp)
	clr.w -(%sp)
	clr.l -(%sp)
	.short 0xa8ec
	move.l -34(%fp),-(%sp)
	.short 0xa873
	lea (-40,%fp),%a2
	jra .L36
.L50:
	pea .LC1
	jsr _log
	addq.l #4,%sp
	movem.l -80(%fp),#7416
	unlk %fp
	rts
	.size	showVictoryBox, .-showVictoryBox
	.pushsection .text.showVictoryBox.macsbug,"ax",@progbits
# macsbug symbol
	.byte 142
	.ascii	"showVictoryBox"
	.align 2,0
	.short 0
	.popsection
	.section	.text.UpdateMenus,"ax",@progbits
	.align	2
	.globl	UpdateMenus
	.type	UpdateMenus, @function
UpdateMenus:
	move.l %d3,-(%sp)
	subq.l #4,%sp
	move.w #129,-(%sp)
	.short 0xa9bf
	move.l (%sp),%d3
	.short 0xa924
	move.l (%sp),%d0
	addq.l #4,%sp
	jeq .L55
	move.l %d3,-(%sp)
	move.w #4,-(%sp)
	.short 0xa939
	move.l %d3,-(%sp)
	move.w #5,-(%sp)
	.short 0xa939
	move.l %d3,-(%sp)
	move.w #2,-(%sp)
	.short 0xa939
	subq.l #4,%sp
	move.w #129,-(%sp)
	.short 0xa9bf
	addq.l #4,%sp
	move.l (%sp)+,%d3
	rts
.L55:
	move.l %d3,-(%sp)
	move.w #4,-(%sp)
	.short 0xa93a
	move.l %d3,-(%sp)
	move.w #5,-(%sp)
	.short 0xa93a
	move.l %d3,-(%sp)
	move.w #2,-(%sp)
	.short 0xa93a
	subq.l #4,%sp
	move.w #129,-(%sp)
	.short 0xa9bf
	addq.l #4,%sp
	move.l (%sp)+,%d3
	rts
	.size	UpdateMenus, .-UpdateMenus
	.pushsection .text.UpdateMenus.macsbug,"ax",@progbits
# macsbug symbol
	.byte 139
	.ascii	"UpdateMenus"
	.align 2,0
	.short 0
	.popsection
	.section	.text.DoMenuCommand,"ax",@progbits
	.align	2
	.globl	DoMenuCommand
	.type	DoMenuCommand, @function
DoMenuCommand:
	lea (-272,%sp),%sp
	move.l %a2,-(%sp)
	move.l %d3,-(%sp)
	move.l 284(%sp),%d3
	move.l %d3,%d2
	swap %d2
	ext.l %d2
	cmp.l #128,%d2
	jeq .L83
	cmp.l #129,%d2
	jeq .L84
.L62:
	clr.w -(%sp)
	.short 0xa938
	move.l (%sp)+,%d3
	move.l (%sp)+,%a2
	lea (272,%sp),%sp
	rts
.L84:
	cmp.w #7,%d3
	jhi .L62
	moveq #0,%d0
	move.w %d3,%d0
	add.l %d0,%d0
	move.w .L65(%pc,%d0.l),%d0
	jmp %pc@(2,%d0:w)
	.balignw 2,0x284c
	.swbeg	&8
.L65:
	.word .L62-.L65
	.word .L69-.L65
	.word .L68-.L65
	.word .L62-.L65
	.word .L67-.L65
	.word .L66-.L65
	.word .L62-.L65
	.word .L64-.L65
.L83:
	cmp.w #1,%d3
	jeq .L85
	subq.l #4,%sp
	move.w %d2,-(%sp)
	.short 0xa9bf
	move.w %d3,-(%sp)
	moveq #30,%d3
	add.l %sp,%d3
	move.l %d3,-(%sp)
	.short 0xa946
	subq.l #2,%sp
	move.l %d3,-(%sp)
	.short 0xa9b6
	addq.l #2,%sp
	clr.w -(%sp)
	.short 0xa938
	move.l (%sp)+,%d3
	move.l (%sp)+,%a2
	lea (272,%sp),%sp
	rts
.L85:
	jsr ShowAboutBox
	clr.w -(%sp)
	.short 0xa938
	move.l (%sp)+,%d3
	move.l (%sp)+,%a2
	lea (272,%sp),%sp
	rts
.L64:
	.short 0xa9f4
	clr.w -(%sp)
	.short 0xa938
	move.l (%sp)+,%d3
	move.l (%sp)+,%a2
	lea (272,%sp),%sp
	rts
.L66:
	lea _game+2690,%a0
	lea _game+6786,%a1
	move.l %a1,%d1
.L73:
	moveq #0,%d0
	move.b (%a0)+,%d0
	move.l %d0,(%a1)+
	cmp.l %a0,%d1
	jne .L73
.L74:
	pea _game+23170
	.short 0xa928
	clr.w -(%sp)
	.short 0xa938
	move.l (%sp)+,%d3
	move.l (%sp)+,%a2
	lea (272,%sp),%sp
	rts
.L67:
	lea _game+6786,%a0
	move.l #_game+23170,%d0
.L72:
	moveq #2,%d1
	move.l %d1,(%a0)+
	cmp.l %a0,%d0
	jeq .L74
	moveq #2,%d1
	move.l %d1,(%a0)+
	cmp.l %a0,%d0
	jne .L72
	jra .L74
.L68:
	subq.l #4,%sp
	.short 0xa924
	move.l (%sp),%a0
	addq.l #4,%sp
	cmp.w #0,%a0
	jeq .L62
	move.w 108(%a0),%d0
	jlt .L86
	subq.l #4,%sp
	.short 0xa924
	.short 0xa914
	clr.w -(%sp)
	.short 0xa938
	move.l (%sp)+,%d3
	move.l (%sp)+,%a2
	lea (272,%sp),%sp
	rts
.L69:
	pea _game+23180
	jsr strlen
	move.b %d0,12(%sp)
	lea (12,%sp),%a2
	move.l %d0,(%sp)
	pea _game+23180
	pea 1(%a2)
	jsr memcpy
	subq.l #4,%sp
	clr.l -(%sp)
	pea _initialWindowRect
	move.l %a2,-(%sp)
	move.b #1,-(%sp)
	clr.w -(%sp)
	pea -1.w
	move.b #1,-(%sp)
	clr.l -(%sp)
	.short 0xa913
	move.l (%sp),_window
	lea (16,%sp),%sp
	clr.w -(%sp)
	.short 0xa938
	move.l (%sp)+,%d3
	move.l (%sp)+,%a2
	lea (272,%sp),%sp
	rts
.L86:
	move.w %d0,-(%sp)
	.short 0xa9b7
	clr.w -(%sp)
	.short 0xa938
	move.l (%sp)+,%d3
	move.l (%sp)+,%a2
	lea (272,%sp),%sp
	rts
	.size	DoMenuCommand, .-DoMenuCommand
	.pushsection .text.DoMenuCommand.macsbug,"ax",@progbits
# macsbug symbol
	.byte 141
	.ascii	"DoMenuCommand"
	.align 2,0
	.short 0
	.popsection
	.section	.text.loadGame,"ax",@progbits
	.align	2
	.globl	loadGame
	.type	loadGame, @function
loadGame:
	lea (-12,%sp),%sp
	movem.l #7994,-(%sp)
	move.l 52(%sp),%a0
	move.b (%a0),%d3
	lea _game,%a6
	move.b %d3,(%a6)
	move.b 1(%a0),46(%sp)
	move.b 46(%sp),_game+1
	move.b #14,_game+23178
	pea 16.w
	pea 514(%a0)
	pea _game+23180
	jsr strncpy
	clr.w _game+23198
	clr.w _game+23196
	lea (12,%sp),%sp
	tst.b 46(%sp)
	jeq .L89
	lea _game+2,%a3
	move.l #_game+6786,40(%sp)
	moveq #0,%d6
	moveq #0,%d5
	clr.b 47(%sp)
	clr.w 44(%sp)
	moveq #127,%d4
	not.b %d4
.L96:
	clr.b (%a3)
	tst.b %d3
	jeq .L90
	lea _game+2690,%a1
	add.l %d6,%a1
	move.l 40(%sp),%a0
	clr.b %d0
	clr.b %d2
	move.l %d5,%d1
	lsl.l #3,%d1
	move.l %d1,%a2
	add.l 52(%sp),%a2
	move.l %d5,%d1
	add.l %d5,%d1
	add.l %d5,%d1
	move.l %d1,%d7
	lsl.l #3,%d7
	sub.l %d1,%d7
	lea (%a6,%d7.l),%a4
	move.l %d5,36(%sp)
.L93:
	move.b %d0,%d7
	lsr.b #3,%d7
	and.l #255,%d7
	moveq #7,%d1
	and.l %d0,%d1
	move.l %d4,%d5
	asr.l %d1,%d5
	move.l %d5,%d1
	and.b 2(%a2,%d7.l),%d1
	sne %d7
	neg.b %d7
	move.b %d7,(%a1)+
	tst.b %d1
	jeq .L91
	addq.b #1,%d2
.L92:
	moveq #2,%d1
	move.l %d1,(%a0)+
	addq.b #1,%d0
	cmp.b %d3,%d0
	jne .L93
.L136:
	move.l 36(%sp),%d5
	tst.b %d2
	jeq .L132
	move.b (%a3),%d1
	move.b %d1,%d0
	addq.b #1,%d0
	move.b %d0,(%a3)
	and.l #255,%d1
	move.l %d5,%d7
	add.l %d5,%d7
	add.l %d5,%d7
	move.l %d7,%d0
	lsl.l #3,%d0
	sub.l %d7,%d0
	lea (%a6,%d0.l),%a0
	move.b %d2,3(%a0,%d1.l)
.L132:
	move.b (%a3),%d0
	moveq #0,%d1
	move.b %d0,%d1
	move.w 44(%sp),%a0
	cmp.l %a0,%d1
	jle .L90
	and.w #255,%d0
	move.w %d0,44(%sp)
	move.b #1,47(%sp)
.L90:
	addq.l #1,%d5
	lea (21,%a3),%a3
	add.l #256,40(%sp)
	moveq #64,%d1
	add.l %d1,%d6
	cmp.b 46(%sp),%d5
	jcs .L96
	tst.b 47(%sp)
	jeq .L89
	move.w 44(%sp),_game+23198
.L89:
	tst.b %d3
	jeq .L87
	lea _game+1346,%a2
	move.b 46(%sp),%d0
	subq.b #1,%d0
	and.l #255,%d0
	lsl.l #6,%d0
	move.l %d0,%a1
	add.l #_game+2754,%a1
	moveq #0,%d5
	clr.b 40(%sp)
	clr.w %d7
	lea _game+2690,%a3
.L105:
	clr.b (%a2)
	tst.b 46(%sp)
	jeq .L100
	lea (%a3,%d5.l),%a0
	clr.b %d4
	clr.b %d1
	moveq #0,%d0
	move.l %d5,%d2
	add.l %d5,%d2
	add.l %d5,%d2
	move.l %d2,%d6
	lsl.l #3,%d6
	sub.l %d2,%d6
	add.l %a6,%d6
.L103:
	move.l %d0,%d2
	tst.b (%a0)
	jeq .L101
	addq.b #1,%d1
.L102:
	lea (64,%a0),%a0
	cmp.l %a0,%a1
	jne .L103
.L135:
	tst.b %d1
	jeq .L104
	addq.b #1,%d4
	move.b %d4,(%a2)
	move.l %d5,%d2
	add.l %d5,%d2
	add.l %d5,%d2
	move.l %d2,%d4
	lsl.l #3,%d4
	move.l %d4,%a0
	sub.l %d2,%a0
	lea (%a6,%a0.l),%a0
	add.l %d0,%a0
	move.b %d1,1347(%a0)
	move.b (%a2),%d4
	moveq #0,%d2
	move.b %d4,%d2
.L104:
	move.w %d7,%a0
	cmp.l %a0,%d2
	jle .L100
	clr.w %d7
	move.b %d4,%d7
	move.b #1,40(%sp)
.L100:
	addq.l #1,%d5
	lea (21,%a2),%a2
	addq.l #1,%a1
	cmp.b %d3,%d5
	jcs .L105
	tst.b 40(%sp)
	jeq .L87
	move.w %d7,_game+23196
.L87:
	movem.l (%sp)+,#23800
	lea (12,%sp),%sp
	rts
.L101:
	tst.b %d1
	jeq .L102
	addq.b #1,%d4
	move.b %d4,(%a2)
	move.l %d6,%a4
	add.l %d0,%a4
	move.b %d1,1347(%a4)
	move.b (%a2),%d4
	moveq #0,%d0
	move.b %d4,%d0
	move.l %d0,%d2
	clr.b %d1
	lea (64,%a0),%a0
	cmp.l %a0,%a1
	jne .L103
	jra .L135
.L91:
	tst.b %d2
	jeq .L92
	move.b (%a3),%d1
	move.b %d1,%d5
	addq.b #1,%d5
	move.b %d5,(%a3)
	and.l #255,%d1
	move.b %d2,3(%a4,%d1.l)
	clr.b %d2
	moveq #2,%d1
	move.l %d1,(%a0)+
	addq.b #1,%d0
	cmp.b %d3,%d0
	jne .L93
	jra .L136
	.size	loadGame, .-loadGame
	.pushsection .text.loadGame.macsbug,"ax",@progbits
# macsbug symbol
	rts
	.byte 136
	.ascii	"loadGame"
	.align 2,0
	.short 0
	.popsection
	.section	.text.getBitmapOffset,"ax",@progbits
	.align	2
	.globl	getBitmapOffset
	.type	getBitmapOffset, @function
getBitmapOffset:
	move.l 4(%sp),%a0
	move.w CHAR_DIM+2,%d1
	muls.w 23198(%a0),%d1
	move.w CHAR_DIM,%d2
	muls.w 23196(%a0),%d2
	move.l %d2,%d0
	swap %d0
	clr.w %d0
	move.w %d1,%d0
	rts
	.size	getBitmapOffset, .-getBitmapOffset
	.pushsection .text.getBitmapOffset.macsbug,"ax",@progbits
# macsbug symbol
	.byte 143
	.ascii	"getBitmapOffset"
	.align 2,0
	.short 0
	.popsection
	.section	.text.drawHints,"ax",@progbits
	.align	2
	.globl	drawHints
	.type	drawHints, @function
drawHints:
	lea (-28,%sp),%sp
	movem.l #7994,-(%sp)
	move.l 68(%sp),%a2
	move.w CHAR_DIM,%d0
	muls.w 23196(%a2),%d0
	move.w %d0,44(%sp)
	move.w CHAR_DIM+2,%d5
	muls.w 23198(%a2),%d5
	lea (48,%sp),%a3
	move.l %a3,-(%sp)
	clr.w -(%sp)
	move.w %d0,-(%sp)
	move.w %d5,-(%sp)
	clr.w %d0
	move.b 1(%a2),%d0
	clr.w %d1
	move.b 23178(%a2),%d1
	muls.w %d1,%d0
	add.w 54(%sp),%d0
	move.w %d0,-(%sp)
	.short 0xa8a7
	move.l %a3,-(%sp)
	.short 0xa8a1
	move.l %a3,-(%sp)
	move.w %d5,-(%sp)
	clr.w -(%sp)
	clr.w %d0
	move.b (%a2),%d0
	clr.w %d1
	move.b 23178(%a2),%d1
	muls.w %d1,%d0
	add.w %d5,%d0
	move.w %d0,-(%sp)
	move.w 54(%sp),-(%sp)
	.short 0xa8a7
	move.l %a3,-(%sp)
	.short 0xa8a1
	tst.b 1(%a2)
	jeq .L141
	clr.b %d6
	lea (56,%sp),%a0
	move.l %a0,40(%sp)
	move.w 44(%sp),%d4
	subq.w #2,%d4
	lea (46,%sp),%a6
	move.w %d5,36(%sp)
.L140:
	moveq #0,%d1
	move.b %d6,%d1
	move.l %d1,%d5
	addq.l #1,%d5
	move.w %d5,%d3
	move.l %d1,%d0
	add.l %d1,%d0
	add.l %d1,%d0
	move.l %d0,%d1
	lsl.l #3,%d1
	move.l %d1,%a3
	sub.l %d0,%a3
	lea (%a2,%a3.l),%a3
	lea (2,%a3),%a4
	clr.b %d7
	tst.b (%a4)
	jeq .L146
.L144:
	clr.w %d0
	move.b %d7,%d0
	muls.w CHAR_DIM+2,%d0
	move.w %d0,-(%sp)
	clr.w %d0
	move.b 23178(%a2),%d0
	muls.w %d3,%d0
	add.w %d4,%d0
	move.w %d0,-(%sp)
	.short 0xa893
	moveq #0,%d0
	move.b %d7,%d0
	move.b 3(%a3,%d0.l),%d0
	move.b %d7,%d1
	addq.b #1,%d1
	cmp.b #9,%d0
	jhi .L142
	move.b #1,46(%sp)
	add.b #48,%d0
	move.b %d0,47(%sp)
	move.b %d1,%d7
	move.l %a6,-(%sp)
	.short 0xa884
	cmp.b (%a4),%d7
	jcs .L144
.L146:
	clr.w %d0
	move.b 23178(%a2),%d0
	muls.w %d0,%d5
	add.w 44(%sp),%d5
	move.l 40(%sp),-(%sp)
	clr.w -(%sp)
	move.w %d5,%a0
	subq.w #1,%a0
	move.w %a0,-(%sp)
	move.w 44(%sp),-(%sp)
	move.w %d5,-(%sp)
	.short 0xa8a7
	move.l 40(%sp),-(%sp)
	.short 0xa8a1
	addq.b #1,%d6
	cmp.b 1(%a2),%d6
	jcs .L140
	move.w 36(%sp),%d5
.L141:
	tst.b (%a2)
	jeq .L139
	sub.l %a6,%a6
	lea (56,%sp),%a0
	move.l %a0,40(%sp)
	lea (46,%sp),%a4
.L147:
	move.w %a6,%d0
	and.l #255,%d0
	move.l %d0,36(%sp)
	add.l %d0,%d0
	add.l 36(%sp),%d0
	move.l %d0,%d4
	lsl.l #3,%d4
	sub.l %d0,%d4
	add.l %a2,%d4
	move.l %d4,%a3
	lea (1346,%a3),%a3
	tst.b (%a3)
	jeq .L153
	move.w %a6,%d0
	clr.w %d6
	move.b %d0,%d6
	clr.b %d7
.L151:
	moveq #0,%d3
	move.b %d7,%d3
	clr.w %d1
	move.b 23178(%a2),%d1
	muls.w %d6,%d1
	add.w %d5,%d1
	move.w %d1,-(%sp)
	move.l %d3,%d1
	addq.l #1,%d1
	muls.w CHAR_DIM,%d1
	subq.w #2,%d1
	move.w %d1,-(%sp)
	.short 0xa893
	move.l %d4,%a0
	add.l %d3,%a0
	move.b 1347(%a0),%d1
	move.b %d7,%d2
	addq.b #1,%d2
	cmp.b #9,%d1
	jhi .L149
	move.b #1,46(%sp)
	add.b #48,%d1
	move.b %d1,47(%sp)
	move.b %d2,%d7
	move.l %a4,-(%sp)
	.short 0xa884
	cmp.b (%a3),%d7
	jcs .L151
.L153:
	move.l 36(%sp),%d0
	addq.l #1,%d0
	clr.w %d7
	move.b 23178(%a2),%d7
	muls.w %d0,%d7
	add.w %d5,%d7
	move.l 40(%sp),-(%sp)
	move.w %d7,%d1
	subq.w #1,%d1
	move.w %d1,-(%sp)
	clr.w -(%sp)
	move.w %d7,-(%sp)
	move.w 54(%sp),-(%sp)
	.short 0xa8a7
	move.l 40(%sp),-(%sp)
	.short 0xa8a1
	move.w %a6,%d0
	addq.b #1,%d0
	move.w %d0,%a6
	cmp.b (%a2),%d0
	jcs .L147
.L139:
	movem.l (%sp)+,#23800
	lea (28,%sp),%sp
	rts
.L149:
	cmp.b #99,%d1
	jhi .L157
	move.b #2,46(%sp)
	and.w #255,%d1
	move.w %d1,%d2
	mulu.w #52429,%d2
	clr.w %d2
	swap %d2
	lsr.w #3,%d2
	move.b %d2,%d0
	add.b #48,%d0
	move.b %d0,47(%sp)
	move.w %d2,%a0
	add.w %d2,%a0
	add.w %a0,%a0
	add.w %d2,%a0
	add.w %a0,%a0
	sub.w %a0,%d1
	add.b #48,%d1
	move.b %d1,48(%sp)
	addq.b #2,%d7
	move.l %a4,-(%sp)
	.short 0xa884
	cmp.b (%a3),%d7
	jcs .L151
	jra .L153
.L142:
	cmp.b #99,%d0
	jhi .L155
	move.b #2,46(%sp)
	and.w #255,%d0
	move.w %d0,%d2
	mulu.w #52429,%d2
	clr.w %d2
	swap %d2
	lsr.w #3,%d2
	move.b %d2,%d1
	add.b #48,%d1
	move.b %d1,47(%sp)
	move.w %d2,%d1
	add.w %d2,%d1
	add.w %d1,%d1
	add.w %d2,%d1
	add.w %d1,%d1
	sub.w %d1,%d0
	add.b #48,%d0
	move.b %d0,48(%sp)
	addq.b #2,%d7
	move.l %a6,-(%sp)
	.short 0xa884
	cmp.b (%a4),%d7
	jcs .L144
	jra .L146
.L157:
	move.b %d2,%d7
	move.l %a4,-(%sp)
	.short 0xa884
	cmp.b (%a3),%d7
	jcs .L151
	jra .L153
.L155:
	move.b %d1,%d7
	move.l %a6,-(%sp)
	.short 0xa884
	cmp.b (%a4),%d7
	jcs .L144
	jra .L146
	.size	drawHints, .-drawHints
	.pushsection .text.drawHints.macsbug,"ax",@progbits
# macsbug symbol
	rts
	.byte 137
	.ascii	"drawHints"
	.align 2,0
	.short 0
	.popsection
	.section	.text.drawPlayfield,"ax",@progbits
	.align	2
	.globl	drawPlayfield
	.type	drawPlayfield, @function
drawPlayfield:
	lea (-40,%sp),%sp
	movem.l #7994,-(%sp)
	move.b 80(%sp),%d3
	move.b 82(%sp),%d4
	move.l 84(%sp),%a4
	move.w CHAR_DIM,%d0
	muls.w 23196(%a4),%d0
	move.w %d0,%a3
	move.w CHAR_DIM+2,%d1
	muls.w 23198(%a4),%d1
	move.w %d1,%a6
	clr.w %d2
	move.b 23178(%a4),%d2
	pea 23170(%a4)
	move.w %d1,-(%sp)
	move.w %d0,-(%sp)
	clr.w %d1
	move.b %d3,%d1
	muls.w %d2,%d1
	add.w %a6,%d1
	move.w %d1,-(%sp)
	clr.w %d0
	move.b %d4,%d0
	muls.w %d2,%d0
	add.w %a3,%d0
	move.w %d0,-(%sp)
	.short 0xa8a7
	tst.b %d4
	jeq .L162
	tst.b %d3
	jeq .L162
	lea (6786,%a4),%a0
	move.l %a0,50(%sp)
	subq.b #1,%d4
	and.l #255,%d4
	move.l %d4,54(%sp)
	clr.l 46(%sp)
	move.w %a3,%d0
	subq.w #1,%d0
	move.w %d0,44(%sp)
	move.w %a6,%d1
	subq.w #1,%d1
	move.w %d1,42(%sp)
	subq.b #1,%d3
	move.b %d3,59(%sp)
	clr.w %d0
	move.b 49(%sp),%d0
	moveq #5,%d2
	and.l #0xFFFF,%d0
	divu.w %d2,%d0
	move.l %d0,%d1
	swap %d1
	move.b %d1,58(%sp)
	move.w 48(%sp),38(%sp)
	move.w 48(%sp),%d7
	addq.w #1,%d7
	clr.w %d0
	move.b 59(%sp),%d0
	move.w %d0,40(%sp)
	move.l 50(%sp),%a2
	clr.w %d6
.L172:
	move.b %d6,%d3
	lea qd+178,%a0
	move.l (%a0),68(%sp)
	move.l qd+182,72(%sp)
	move.l (%a2)+,%d5
	jne .L166
.L192:
	lea qd+194,%a0
	move.l (%a0),68(%sp)
	move.l qd+198,72(%sp)
.L167:
	clr.w %d0
	move.b 23178(%a4),%d0
	move.w %d6,%d4
	addq.w #1,%d4
	move.w %d0,%d1
	muls.w %d4,%d1
	pea 60(%sp)
	move.w %d1,%a0
	sub.w %d0,%a0
	add.w %a6,%a0
	move.w %a0,-(%sp)
	move.w %d0,%d2
	muls.w 44(%sp),%d2
	add.w %a3,%d2
	move.w %d2,-(%sp)
	add.w 50(%sp),%d1
	move.w %d1,-(%sp)
	muls.w %d7,%d0
	add.w 54(%sp),%d0
	move.w %d0,-(%sp)
	.short 0xa8a7
	pea 60(%sp)
	pea 72(%sp)
	.short 0xa8a5
	clr.w %d1
	move.b 23178(%a4),%d1
	move.w %d1,%d0
	muls.w %d7,%d0
	add.w %a3,%d0
	move.w %d1,%d2
	muls.w %d4,%d2
	pea 60(%sp)
	move.w %d2,%a0
	sub.w %d1,%a0
	move.w %a0,%d1
	add.w %a6,%d1
	move.w %d1,-(%sp)
	move.w %d0,%d1
	subq.w #1,%d1
	move.w %d1,-(%sp)
	add.w %a6,%d2
	move.w %d2,-(%sp)
	move.w %d0,-(%sp)
	.short 0xa8a7
	cmp.b #4,58(%sp)
	jeq .L189
.L168:
	move.l #qd+178,%d0
	moveq #2,%d2
	cmp.l %d5,%d2
	jeq .L185
.L169:
	pea 60(%sp)
	move.l %d0,-(%sp)
	.short 0xa8a5
	clr.w %d0
	move.b 23178(%a4),%d0
	move.w %d0,%d1
	muls.w %d4,%d1
	add.w %a6,%d1
	pea 60(%sp)
	move.w %d1,%a0
	subq.w #1,%a0
	move.w %a0,-(%sp)
	move.w %d0,%d2
	muls.w 44(%sp),%d2
	add.w %a3,%d2
	move.w %d2,-(%sp)
	move.w %d1,-(%sp)
	muls.w %d7,%d0
	add.w %a3,%d0
	move.w %d0,-(%sp)
	.short 0xa8a7
	and.w #255,%d3
	moveq #5,%d1
	and.l #0xFFFF,%d3
	divu.w %d1,%d3
	move.l %d3,%d0
	swap %d0
	cmp.b #4,%d0
	jeq .L190
.L170:
	move.l #qd+178,%d0
	subq.l #2,%d5
	jeq .L186
.L171:
	pea 60(%sp)
	move.l %d0,-(%sp)
	.short 0xa8a5
	cmp.w 40(%sp),%d6
	jeq .L191
.L177:
	move.w %d4,%d6
	move.b %d6,%d3
	lea qd+178,%a0
	move.l (%a0),68(%sp)
	move.l qd+182,72(%sp)
	move.l (%a2)+,%d5
	jeq .L192
.L166:
	moveq #1,%d0
	cmp.l %d5,%d0
	jne .L167
	lea qd+186,%a0
	move.l (%a0),68(%sp)
	move.l qd+190,72(%sp)
	clr.w %d0
	move.b 23178(%a4),%d0
	move.w %d6,%d4
	addq.w #1,%d4
	move.w %d0,%d1
	muls.w %d4,%d1
	pea 60(%sp)
	move.w %d1,%a0
	sub.w %d0,%a0
	add.w %a6,%a0
	move.w %a0,-(%sp)
	move.w %d0,%d2
	muls.w 44(%sp),%d2
	add.w %a3,%d2
	move.w %d2,-(%sp)
	add.w 50(%sp),%d1
	move.w %d1,-(%sp)
	muls.w %d7,%d0
	add.w 54(%sp),%d0
	move.w %d0,-(%sp)
	.short 0xa8a7
	pea 60(%sp)
	pea 72(%sp)
	.short 0xa8a5
	clr.w %d1
	move.b 23178(%a4),%d1
	move.w %d1,%d0
	muls.w %d7,%d0
	add.w %a3,%d0
	move.w %d1,%d2
	muls.w %d4,%d2
	pea 60(%sp)
	move.w %d2,%a0
	sub.w %d1,%a0
	move.w %a0,%d1
	add.w %a6,%d1
	move.w %d1,-(%sp)
	move.w %d0,%d1
	subq.w #1,%d1
	move.w %d1,-(%sp)
	add.w %a6,%d2
	move.w %d2,-(%sp)
	move.w %d0,-(%sp)
	.short 0xa8a7
	cmp.b #4,58(%sp)
	jne .L168
.L189:
	tst.l %d5
	jeq .L185
	move.l #qd+194,%d0
	pea 60(%sp)
	move.l %d0,-(%sp)
	.short 0xa8a5
	clr.w %d0
	move.b 23178(%a4),%d0
	move.w %d0,%d1
	muls.w %d4,%d1
	add.w %a6,%d1
	pea 60(%sp)
	move.w %d1,%a0
	subq.w #1,%a0
	move.w %a0,-(%sp)
	move.w %d0,%d2
	muls.w 44(%sp),%d2
	add.w %a3,%d2
	move.w %d2,-(%sp)
	move.w %d1,-(%sp)
	muls.w %d7,%d0
	add.w %a3,%d0
	move.w %d0,-(%sp)
	.short 0xa8a7
	and.w #255,%d3
	moveq #5,%d1
	and.l #0xFFFF,%d3
	divu.w %d1,%d3
	move.l %d3,%d0
	swap %d0
	cmp.b #4,%d0
	jne .L170
.L190:
	tst.l %d5
	jeq .L186
	move.l #qd+194,%d0
	pea 60(%sp)
	move.l %d0,-(%sp)
	.short 0xa8a5
	cmp.w 40(%sp),%d6
	jne .L177
.L191:
	move.l 46(%sp),%d0
	addq.l #1,%d0
	add.l #256,50(%sp)
	move.l 54(%sp),%d1
	cmp.l 46(%sp),%d1
	jeq .L162
	move.l %d0,46(%sp)
	clr.w %d0
	move.b 49(%sp),%d0
	moveq #5,%d2
	and.l #0xFFFF,%d0
	divu.w %d2,%d0
	move.l %d0,%d1
	swap %d1
	move.b %d1,58(%sp)
	move.w 48(%sp),38(%sp)
	move.w 48(%sp),%d7
	addq.w #1,%d7
	clr.w %d0
	move.b 59(%sp),%d0
	move.w %d0,40(%sp)
	move.l 50(%sp),%a2
	clr.w %d6
	jra .L172
.L186:
	move.l #qd+186,%d0
	jra .L171
.L185:
	move.l #qd+186,%d0
	jra .L169
.L162:
	movem.l (%sp)+,#23800
	lea (40,%sp),%sp
	rts
	.size	drawPlayfield, .-drawPlayfield
	.pushsection .text.drawPlayfield.macsbug,"ax",@progbits
# macsbug symbol
	.byte 141
	.ascii	"drawPlayfield"
	.align 2,0
	.short 0
	.popsection
	.section	.text.drawGame,"ax",@progbits
	.align	2
	.globl	drawGame
	.type	drawGame, @function
drawGame:
	move.l %a2,-(%sp)
	pea _game
	lea _game,%a2
	move.b _game+1,-(%sp)
	move.b (%a2),-(%sp)
	jsr drawPlayfield
	move.l %a2,-(%sp)
	jsr drawHints
	lea (12,%sp),%sp
	move.l (%sp)+,%a2
	rts
	.size	drawGame, .-drawGame
	.pushsection .text.drawGame.macsbug,"ax",@progbits
# macsbug symbol
	.byte 136
	.ascii	"drawGame"
	.align 2,0
	.short 0
	.popsection
	.section	.text.DoUpdate,"ax",@progbits
	.align	2
	.globl	DoUpdate
	.type	DoUpdate, @function
DoUpdate:
	move.l %a2,-(%sp)
	move.l %d3,-(%sp)
	move.l 12(%sp),%d3
	move.l %d3,-(%sp)
	.short 0xa873
	move.l %d3,-(%sp)
	.short 0xa922
	pea _game
	lea _game,%a2
	move.b _game+1,-(%sp)
	move.b (%a2),-(%sp)
	jsr drawPlayfield
	move.l %a2,-(%sp)
	jsr drawHints
	move.l %d3,-(%sp)
	.short 0xa923
	lea (12,%sp),%sp
	move.l (%sp)+,%d3
	move.l (%sp)+,%a2
	rts
	.size	DoUpdate, .-DoUpdate
	.pushsection .text.DoUpdate.macsbug,"ax",@progbits
# macsbug symbol
	.byte 136
	.ascii	"DoUpdate"
	.align 2,0
	.short 0
	.popsection
	.section	.text.initGame,"ax",@progbits
	.align	2
	.globl	initGame
	.type	initGame, @function
initGame:
	pea _pak
	jsr loadGame
	addq.l #4,%sp
	rts
	.size	initGame, .-initGame
	.pushsection .text.initGame.macsbug,"ax",@progbits
# macsbug symbol
	.byte 136
	.ascii	"initGame"
	.align 2,0
	.short 0
	.popsection
	.globl	__divsi3
	.section	.text.getBitAtPoint,"ax",@progbits
	.align	2
	.globl	getBitAtPoint
	.type	getBitAtPoint, @function
getBitAtPoint:
	movem.l #6192,-(%sp)
	move.l 20(%sp),%a3
	moveq #0,%d4
	move.b _game+23178,%d4
	move.w 2(%a3),%a0
	move.w CHAR_DIM+2,%d0
	muls.w _game+23198,%d0
	lea __divsi3,%a2
	move.l %d4,-(%sp)
	sub.w %d0,%a0
	move.l %a0,-(%sp)
	jsr (%a2)
	addq.l #8,%sp
	move.l %d0,%d3
	move.w (%a3),%a0
	move.w CHAR_DIM,%d0
	muls.w _game+23196,%d0
	move.l %d4,-(%sp)
	sub.w %d0,%a0
	move.l %a0,-(%sp)
	jsr (%a2)
	addq.l #8,%sp
	swap %d0
	clr.w %d0
	move.w %d3,%d0
	movem.l (%sp)+,#3096
	rts
	.size	getBitAtPoint, .-getBitAtPoint
	.pushsection .text.getBitAtPoint.macsbug,"ax",@progbits
# macsbug symbol
	.byte 141
	.ascii	"getBitAtPoint"
	.align 2,0
	.short 0
	.popsection
	.section	.text.isInside,"ax",@progbits
	.align	2
	.globl	isInside
	.type	isInside, @function
isInside:
	move.l %a2,-(%sp)
	move.l 8(%sp),%a1
	move.l 12(%sp),%a0
	move.w 2(%a1),%d0
	cmp.w 2(%a0),%d0
	sge %d0
	ext.w %d0
	ext.l %d0
	neg.l %d0
	move.w 6(%a0),%a2
	cmp.l %d0,%a2
	jle .L203
	move.w (%a1),%d0
	cmp.w (%a0),%d0
	sge %d0
	ext.w %d0
	ext.l %d0
	neg.l %d0
	move.w 4(%a0),%a0
	cmp.l %d0,%a0
	sge %d0
	neg.b %d0
	move.l (%sp)+,%a2
	rts
.L203:
	clr.b %d0
	move.l (%sp)+,%a2
	rts
	.size	isInside, .-isInside
	.pushsection .text.isInside.macsbug,"ax",@progbits
# macsbug symbol
	.byte 136
	.ascii	"isInside"
	.align 2,0
	.short 0
	.popsection
	.section	.text.checkForUltimateVictory,"ax",@progbits
	.align	2
	.globl	checkForUltimateVictory
	.type	checkForUltimateVictory, @function
checkForUltimateVictory:
	movem.l #6200,-(%sp)
	move.l 24(%sp),%a3
	move.b 1(%a3),%d0
	jeq .L207
	move.b (%a3),%d2
	move.b %d2,%d1
	subq.b #1,%d1
	and.l #255,%d1
	lea (2691,%a3),%a2
	add.l %d1,%a2
	move.l %a3,%d1
	add.l #6786,%d1
	subq.b #1,%d0
	and.l #255,%d0
	lsl.l #8,%d0
	lea (7042,%a3),%a0
	add.l %a0,%d0
	sub.l %a4,%a4
	move.l %a3,%d3
	add.l #2690,%d3
.L208:
	tst.b %d2
	jeq .L213
	lea (%a4,%d3.l),%a0
	move.l %d1,%a1
.L211:
	moveq #1,%d4
	cmp.l (%a1)+,%d4
	jeq .L209
	tst.b (%a0)
	jne .L206
.L209:
	addq.l #1,%a0
	cmp.l %a0,%a2
	jne .L211
.L213:
	lea (64,%a2),%a2
	add.l #256,%d1
	lea (64,%a4),%a4
	cmp.l %d1,%d0
	jne .L208
.L207:
	move.l %a3,24(%sp)
	movem.l (%sp)+,#7192
	jra showVictoryBox
.L206:
	movem.l (%sp)+,#7192
	rts
	.size	checkForUltimateVictory, .-checkForUltimateVictory
	.pushsection .text.checkForUltimateVictory.macsbug,"ax",@progbits
# macsbug symbol
	.byte 151
	.ascii	"checkForUltimateVictory"
	.align 2,0
	.short 0
	.popsection
	.section	.text.toggleBit,"ax",@progbits
	.align	2
	.globl	toggleBit
	.type	toggleBit, @function
toggleBit:
	movem.l #7736,-(%sp)
	move.l 32(%sp),%a2
	moveq #0,%d4
	move.b _game+23178,%d4
	move.w 2(%a2),%a0
	move.w CHAR_DIM+2,%d0
	muls.w _game+23198,%d0
	lea __divsi3,%a4
	move.l %d4,-(%sp)
	sub.w %d0,%a0
	move.l %a0,-(%sp)
	jsr (%a4)
	addq.l #8,%sp
	move.l %d0,%d3
	move.w %d0,%d6
	jlt .L224
	move.w %d0,%a3
	move.b _game,%d5
	moveq #0,%d0
	move.b %d5,%d0
	cmp.l %a3,%d0
	jle .L224
	move.w (%a2),%a0
	move.w CHAR_DIM,%d0
	muls.w _game+23196,%d0
	move.l %d4,-(%sp)
	sub.w %d0,%a0
	move.l %a0,-(%sp)
	jsr (%a4)
	addq.l #8,%sp
	tst.w %d0
	jlt .L224
	move.b _game+1,%d1
	move.w %d0,%a0
	moveq #0,%d2
	move.b %d1,%d2
	cmp.l %a0,%d2
	jlt .L224
	moveq #0,%d4
	move.w %d0,%d4
	swap %d0
	clr.w %d0
	move.l %d0,%d2
	move.w %d3,%d2
	move.l 36(%sp),%a1
	cmp.l (%a1),%d2
	jeq .L246
	move.l %a0,%d0
	lsl.l #6,%d0
	add.l %a3,%d0
	lsl.l #2,%d0
	move.l %d0,%a0
	add.l #_game+6786,%a0
	move.l (%a0),%d0
	subq.l #1,%d0
	moveq #2,%d2
	cmp.l %d0,%d2
	jcs .L228
	move.l %d0,(%a0)
.L229:
	tst.b %d1
	jeq .L230
	move.b %d5,%d0
	subq.b #1,%d0
	and.l #255,%d0
	move.l %d0,%a1
	add.l #_game+2691,%a1
	move.l #_game+6786,%d0
	subq.b #1,%d1
	and.l #255,%d1
	addq.l #1,%d1
	lsl.l #6,%d1
	sub.l %a3,%a3
	move.l #_game+2690,%d2
.L231:
	tst.b %d5
	jeq .L236
	lea (%a3,%d2.l),%a0
	move.l %d0,%a2
.L234:
	moveq #1,%d3
	cmp.l (%a2)+,%d3
	jeq .L232
	tst.b (%a0)
	jne .L233
.L232:
	addq.l #1,%a0
	cmp.l %a0,%a1
	jne .L234
.L236:
	lea (64,%a1),%a1
	add.l #256,%d0
	lea (64,%a3),%a3
	cmp.l %a3,%d1
	jne .L231
.L230:
	pea _game
	jsr showVictoryBox
	addq.l #4,%sp
.L233:
	move.l %d4,%d0
	swap %d0
	clr.w %d0
	move.w %d6,%d0
	movem.l (%sp)+,#7288
	rts
.L224:
	moveq #-1,%d0
	movem.l (%sp)+,#7288
	rts
.L228:
	moveq #2,%d3
	move.l %d3,(%a0)
	jra .L229
.L246:
	move.w %d3,%d0
	movem.l (%sp)+,#7288
	rts
	.size	toggleBit, .-toggleBit
	.pushsection .text.toggleBit.macsbug,"ax",@progbits
# macsbug symbol
	.byte 137
	.ascii	"toggleBit"
	.align 2,0
	.short 0
	.popsection
	.section	.text.startup.main,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	lea (-28,%sp),%sp
	movem.l #7994,-(%sp)
	pea qd+202
	.short 0xa86e
	.short 0xa8fe
	.short 0xa912
	.short 0xa930
	.short 0xa9cc
	clr.l -(%sp)
	.short 0xa97b
	subq.l #4,%sp
	move.w #128,-(%sp)
	.short 0xa9c0
	.short 0xa93c
	subq.l #4,%sp
	move.w #128,-(%sp)
	.short 0xa9bf
	move.l #1146246738,-(%sp)
	.short 0xa94d
	.short 0xa937
	jsr InitCustomWDEF
	.short 0xa850
	pea _pak
	jsr loadGame
	pea _initialWindowRect
	clr.w -(%sp)
	move.w #38,-(%sp)
	move.w #520,-(%sp)
	move.w #330,-(%sp)
	.short 0xa8a7
	move.w #-1,40(%sp)
	move.w #-1,42(%sp)
	addq.l #4,%sp
	lea (48,%sp),%a2
	lea _initialWindowRect,%a3
	move.l #DoMenuCommand,%d7
	moveq #40,%d5
	add.l %sp,%d5
	move.l #.L260,%d6
	lea _game,%a4
	move.l #drawPlayfield,%d4
	lea drawHints,%a6
.L269:
	.short 0xa9b4
	subq.l #2,%sp
	move.w #-1,-(%sp)
	move.l %a2,-(%sp)
	.short 0xa970
	move.b (%sp),%d0
	addq.l #2,%sp
	jeq .L269
	move.w 58(%sp),%d0
	sub.w (%a3),%d0
	move.w %d0,44(%sp)
	move.w 60(%sp),%a0
	sub.w _initialWindowRect+2,%a0
	move.w %a0,46(%sp)
	move.w 48(%sp),%d0
	cmp.w #3,%d0
	jeq .L249
	jgt .L250
	cmp.w #1,%d0
	jeq .L251
	cmp.w #2,%d0
	jne .L269
	move.w #-1,38(%sp)
	move.w #-1,36(%sp)
	jra .L269
.L250:
	cmp.w #6,%d0
	jne .L269
	move.l 50(%sp),%d3
	move.l %d3,-(%sp)
	.short 0xa873
	move.l %d3,-(%sp)
	.short 0xa922
	pea _game
	move.b _game+1,-(%sp)
	move.b (%a4),-(%sp)
	move.l %d4,%a0
	jsr (%a0)
	move.l %a4,-(%sp)
	jsr (%a6)
	move.l %d3,-(%sp)
	.short 0xa923
	lea (12,%sp),%sp
	cmp.w #-1,38(%sp)
	jeq .L269
.L279:
	move.w 46(%sp),%d0
	cmp.w _game+23172.l,%d0
	sge %d0
	ext.w %d0
	ext.l %d0
	neg.l %d0
	move.w _game+23176,%a0
	cmp.l %d0,%a0
	jle .L269
	move.w 44(%sp),%d0
	cmp.w _game+23170.l,%d0
	sge %d0
	ext.w %d0
	ext.l %d0
	neg.l %d0
	move.w _game+23174,%a0
	cmp.l %d0,%a0
	jlt .L269
	pea 36(%sp)
	pea 48(%sp)
	jsr toggleBit
	move.l %d0,44(%sp)
	pea _game+23170
	.short 0xa928
	addq.l #8,%sp
	jra .L269
.L249:
	btst #0,62(%sp)
	jeq .L269
	subq.l #4,%sp
	move.w #129,-(%sp)
	.short 0xa9bf
	move.l (%sp),%d3
	.short 0xa924
	move.l (%sp),%d0
	addq.l #4,%sp
	jeq .L257
	move.l %d3,-(%sp)
	move.w #4,-(%sp)
	.short 0xa939
	move.l %d3,-(%sp)
	move.w #5,-(%sp)
	.short 0xa939
	move.l %d3,-(%sp)
	move.w #2,-(%sp)
	.short 0xa939
	subq.l #4,%sp
	move.w #129,-(%sp)
	.short 0xa9bf
	clr.w %d0
	move.b 57(%sp),%d0
	move.w %d0,-(%sp)
	.short 0xa93e
	move.l %d7,%a0
	jsr (%a0)
	addq.l #4,%sp
	jra .L269
.L251:
	subq.l #2,%sp
	move.l 60(%sp),-(%sp)
	move.l %d5,-(%sp)
	.short 0xa92c
	move.w (%sp),%d0
	addq.l #2,%sp
	cmp.w #6,%d0
	jhi .L269
	and.l #65535,%d0
	add.l %d0,%d0
	move.l %d6,%a0
	move.w (%a0,%d0.l),%d0
	jmp %pc@(2,%d0:w)
	.balignw 2,0x284c
	.swbeg	&7
.L260:
	.word .L269-.L260
	.word .L264-.L260
	.word .L263-.L260
	.word .L262-.L260
	.word .L261-.L260
	.word .L269-.L260
	.word .L259-.L260
.L259:
	subq.l #2,%sp
	move.l 42(%sp),-(%sp)
	move.l 64(%sp),-(%sp)
	.short 0xa91e
	move.b (%sp),%d0
	addq.l #2,%sp
	jeq .L269
	move.l 40(%sp),-(%sp)
	.short 0xa914
	jra .L269
.L261:
	move.l 40(%sp),-(%sp)
	move.l 62(%sp),-(%sp)
	pea qd+86
	.short 0xa925
	jra .L269
.L262:
	move.l 40(%sp),-(%sp)
	.short 0xa91f
	jra .L279
.L263:
	move.l %a2,-(%sp)
	move.l 44(%sp),-(%sp)
	.short 0xa9b3
	jra .L269
.L264:
	subq.l #4,%sp
	move.w #129,-(%sp)
	.short 0xa9bf
	move.l (%sp),%d3
	.short 0xa924
	move.l (%sp),%d0
	addq.l #4,%sp
	jeq .L266
	move.l %d3,-(%sp)
	move.w #4,-(%sp)
	.short 0xa939
	move.l %d3,-(%sp)
	move.w #5,-(%sp)
	.short 0xa939
	move.l %d3,-(%sp)
	move.w #2,-(%sp)
	.short 0xa939
	subq.l #4,%sp
	move.w #129,-(%sp)
	.short 0xa9bf
	move.l 62(%sp),-(%sp)
	.short 0xa93d
	move.l %d7,%a0
	jsr (%a0)
	addq.l #4,%sp
	jra .L269
.L257:
	move.l %d3,-(%sp)
	move.w #4,-(%sp)
	.short 0xa93a
	move.l %d3,-(%sp)
	move.w #5,-(%sp)
	.short 0xa93a
	move.l %d3,-(%sp)
	move.w #2,-(%sp)
	.short 0xa93a
	subq.l #4,%sp
	move.w #129,-(%sp)
	.short 0xa9bf
	clr.w %d0
	move.b 57(%sp),%d0
	move.w %d0,-(%sp)
	.short 0xa93e
	move.l %d7,%a0
	jsr (%a0)
	addq.l #4,%sp
	jra .L269
.L266:
	move.l %d3,-(%sp)
	move.w #4,-(%sp)
	.short 0xa93a
	move.l %d3,-(%sp)
	move.w #5,-(%sp)
	.short 0xa93a
	move.l %d3,-(%sp)
	move.w #2,-(%sp)
	.short 0xa93a
	subq.l #4,%sp
	move.w #129,-(%sp)
	.short 0xa9bf
	move.l 62(%sp),-(%sp)
	.short 0xa93d
	move.l %d7,%a0
	jsr (%a0)
	addq.l #4,%sp
	jra .L269
	.size	main, .-main
	.pushsection .text.main.macsbug,"ax",@progbits
# macsbug symbol
	rts
	.byte 132
	.ascii	"main"
	.align 2,0
	.short 0
	.popsection
	.globl	CHAR_DIM
	.data
	.align	2
	.type	CHAR_DIM, @object
	.size	CHAR_DIM, 4
CHAR_DIM:
	.word	14
	.word	10
	.globl	_log_line
	.section	.bss
	.type	_log_line, @object
	.size	_log_line, 1
_log_line:
	.zero	1
	.globl	_pak
	.data
	.type	_pak, @object
	.size	_pak, 530
_pak:
	.byte	10
	.byte	10
	.string	"\f"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\f"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\036"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\022"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"3"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"?"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\177\200"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"a\200"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\341\300"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\363\300"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.zero	431
	.string	"Key"
	.zero	12
	.comm	_game,23200,2
	.comm	_window,4,2
	.local	_initialWindowRect
	.comm	_initialWindowRect,8,2
	.ident	"GCC: (GNU) 9.1.0"
