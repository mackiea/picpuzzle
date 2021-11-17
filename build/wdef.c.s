#NO_APP
	.file	"wdef.c"
	.text
	.section	.text.MYWINDOWDEFPROC,"ax",@progbits
	.align	2
	.globl	MYWINDOWDEFPROC
	.type	MYWINDOWDEFPROC, @function
MYWINDOWDEFPROC:
	subq.l #8,%sp
	movem.l #7200,-(%sp)
	move.w 32(%sp),%d0
	move.l 34(%sp),%a2
	cmp.w #1,%d0
	jeq .L2
	cmp.w #2,%d0
	jeq .L3
	tst.w %d0
	jeq .L15
.L9:
	moveq #0,%d0
	move.l %d0,40(%sp)
	movem.l (%sp)+,#1080
	addq.l #8,%sp
	move.l (%a7)+, %a0
	lea 12.w(%a7), %a7
	jmp (%a0)
.L15:
	subq.l #4,%sp
	.short 0xa8d8
	move.l (%sp),%d3
	move.l 114(%a2),(%sp)
	move.l 118(%a2),-(%sp)
	move.l %d3,-(%sp)
	.short 0xa8e6
	tst.b 111(%a2)
	jeq .L16
	move.l #qd+194,%d0
	move.l %d3,-(%sp)
	move.l %d0,-(%sp)
	.short 0xa8d6
	move.l qd+202,%a0
	move.w 52(%a0),%d4
	move.w 54(%a0),%d5
	tst.b 111(%a2)
	jne .L17
.L6:
	move.l %d3,-(%sp)
	.short 0xa8d2
	move.w %d5,-(%sp)
	move.w %d4,-(%sp)
	.short 0xa89b
	move.l %d3,-(%sp)
	.short 0xa8d9
	move.l 118(%a2),%a0
	move.l (%a0),%a0
	move.w 4(%a0),-(%sp)
	move.w 2(%a0),%a0
	lea (-10,%a0),%a0
	move.w %a0,-(%sp)
	.short 0xa893
	move.l 134(%a2),%a0
	.short 0xa029
	move.l 134(%a2),%a0
	move.l (%a0),-(%sp)
	.short 0xa884
	move.l 134(%a2),%a0
	.short 0xa02a
	moveq #0,%d0
.L18:
	move.l %d0,40(%sp)
	movem.l (%sp)+,#1080
	addq.l #8,%sp
	move.l (%a7)+, %a0
	lea 12.w(%a7), %a7
	jmp (%a0)
.L3:
	move.l 16(%a2),%d0
	move.l 20(%a2),%d1
	move.l %d0,16(%sp)
	move.l %d1,20(%sp)
	moveq #16,%d3
	add.l %sp,%d3
	move.l %d3,-(%sp)
	move.w 10(%a2),%d1
	neg.w %d1
	move.w %d1,-(%sp)
	move.w 8(%a2),%d0
	neg.w %d0
	move.w %d0,-(%sp)
	.short 0xa8a8
	move.l 118(%a2),-(%sp)
	move.l %d3,-(%sp)
	.short 0xa8df
	move.l %d3,-(%sp)
	move.w #-10,-(%sp)
	move.w #-10,-(%sp)
	.short 0xa8a9
	move.l 114(%a2),-(%sp)
	move.l %d3,-(%sp)
	.short 0xa8df
	move.l 134(%a2),%a0
	.short 0xa029
	subq.l #2,%sp
	move.l 134(%a2),%a0
	move.l (%a0),-(%sp)
	.short 0xa88c
	move.w (%sp),%d3
	addq.l #2,%sp
	move.l 134(%a2),%a0
	.short 0xa02a
	add.w #20,%d3
	move.w 22(%sp),%d0
	move.w 18(%sp),%d1
	move.w %d0,%a0
	sub.w %d1,%a0
	lea (-9,%a0),%a0
	move.w %d3,%a1
	cmp.l %a0,%a1
	jlt .L8
	move.w %d0,%d3
	add.w #-10,%d3
	sub.w %d1,%d3
.L8:
	subq.l #4,%sp
	.short 0xa8d8
	move.l (%sp),%d4
	move.w 20(%sp),%d0
	move.w 22(%sp),%d1
	move.w %d1,-(%sp)
	move.w %d0,%a0
	lea (-20,%a0),%a0
	move.w %a0,-(%sp)
	add.w %d3,%d1
	move.w %d1,-(%sp)
	move.w %d0,-(%sp)
	.short 0xa8de
	move.l 114(%a2),%d0
	move.l %d4,-(%sp)
	move.l %d0,-(%sp)
	move.l %d0,-(%sp)
	.short 0xa8e5
	move.l %d4,-(%sp)
	.short 0xa8d9
	moveq #0,%d0
	move.l %d0,40(%sp)
	movem.l (%sp)+,#1080
	addq.l #8,%sp
	move.l (%a7)+, %a0
	lea 12.w(%a7), %a7
	jmp (%a0)
.L2:
	move.l 28(%sp),%d3
	clr.w %d3
	move.w 30(%sp),%d3
	subq.l #2,%sp
	move.l %d3,-(%sp)
	move.l 114(%a2),-(%sp)
	.short 0xa8e8
	move.b (%sp),%d0
	addq.l #2,%sp
	jeq .L9
	subq.l #2,%sp
	move.l %d3,-(%sp)
	move.l 118(%a2),-(%sp)
	.short 0xa8e8
	move.b (%sp),%d0
	addq.l #2,%sp
	jne .L12
	moveq #2,%d0
	move.l %d0,40(%sp)
	movem.l (%sp)+,#1080
	addq.l #8,%sp
	move.l (%a7)+, %a0
	lea 12.w(%a7), %a7
	jmp (%a0)
.L16:
	move.l #qd+170,%d0
	move.l %d3,-(%sp)
	move.l %d0,-(%sp)
	.short 0xa8d6
	move.l qd+202,%a0
	move.w 52(%a0),%d4
	move.w 54(%a0),%d5
	tst.b 111(%a2)
	jeq .L6
.L17:
	move.w #3,-(%sp)
	move.w #3,-(%sp)
	.short 0xa89b
	move.l %d3,-(%sp)
	.short 0xa8d2
	move.w %d5,-(%sp)
	move.w %d4,-(%sp)
	.short 0xa89b
	move.l %d3,-(%sp)
	.short 0xa8d9
	move.l 118(%a2),%a0
	move.l (%a0),%a0
	move.w 4(%a0),-(%sp)
	move.w 2(%a0),%a0
	lea (-10,%a0),%a0
	move.w %a0,-(%sp)
	.short 0xa893
	move.l 134(%a2),%a0
	.short 0xa029
	move.l 134(%a2),%a0
	move.l (%a0),-(%sp)
	.short 0xa884
	move.l 134(%a2),%a0
	.short 0xa02a
	moveq #0,%d0
	jra .L18
.L12:
	moveq #1,%d0
	move.l %d0,40(%sp)
	movem.l (%sp)+,#1080
	addq.l #8,%sp
	move.l (%a7)+, %a0
	lea 12.w(%a7), %a7
	jmp (%a0)
	.size	MYWINDOWDEFPROC, .-MYWINDOWDEFPROC
	.pushsection .text.MYWINDOWDEFPROC.macsbug,"ax",@progbits
# macsbug symbol
	.byte 143
	.ascii	"MYWINDOWDEFPROC"
	.align 2,0
	.short 0
	.popsection
	.ident	"GCC: (GNU) 9.1.0"
