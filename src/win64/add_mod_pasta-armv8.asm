	AREA	|.text|,CODE,ALIGN=8,ARM64



	EXPORT	|add_mod_pasta|[FUNC]
	ALIGN	32
|add_mod_pasta| PROC
	ldp	x8,x9,[x1]
	ldp	x12,x13,[x2]

	ldp	x10,x11,[x1,#16]
	adds	x8,x8,x12
	ldp	x14,x15,[x2,#16]
	adcs	x9,x9,x13
	ldp	x4,x5,[x3]
	adcs	x10,x10,x14
	ldp	x6,x7,[x3,#16]
	adcs	x11,x11,x15
	adc	x3,xzr,xzr

	subs	x16,x8,x4
	sbcs	x17,x9,x5
	sbcs	x1,x10,x6
	sbcs	x2,x11,x7
	sbcs	xzr,x3,xzr

	csello	x8,x8,x16
	csello	x9,x9,x17
	csello	x10,x10,x1
	stp	x8,x9,[x0]
	csello	x11,x11,x2
	stp	x10,x11,[x0,#16]

	ret
	ENDP



	EXPORT	|sub_mod_pasta|[FUNC]
	ALIGN	32
|sub_mod_pasta| PROC
	ldp	x8,x9,[x1]
	ldp	x12,x13,[x2]

	ldp	x10,x11,[x1,#16]
	subs	x8,x8,x12
	ldp	x14,x15,[x2,#16]
	sbcs	x9,x9,x13
	ldp	x4,x5,[x3]
	sbcs	x10,x10,x14
	ldp	x6,x7,[x3,#16]
	sbcs	x11,x11,x15
	sbc	x3,xzr,xzr

	and	x4,x4,x3
	and	x5,x5,x3
	adds	x8,x8,x4
	and	x6,x6,x3
	adcs	x9,x9,x5
	and	x7,x7,x3
	adcs	x10,x10,x6
	stp	x8,x9,[x0]
	adc	x11,x11,x7
	stp	x10,x11,[x0,#16]

	ret
	ENDP
	END
