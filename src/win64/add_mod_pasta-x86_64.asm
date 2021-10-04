OPTION	DOTNAME
.text$	SEGMENT ALIGN(256) 'CODE'

PUBLIC	add_mod_pasta


ALIGN	32
add_mod_pasta	PROC PUBLIC
	DB	243,15,30,250
	mov	QWORD PTR[8+rsp],rdi	;WIN64 prologue
	mov	QWORD PTR[16+rsp],rsi
	mov	r11,rsp
$L$SEH_begin_add_mod_pasta::
	mov	rdi,rcx
	mov	rsi,rdx
	mov	rdx,r8
	mov	rcx,r9



	push	rbp

	push	rbx

	sub	rsp,8

$L$SEH_body_add_mod_pasta::


	mov	r8,QWORD PTR[rsi]
	mov	r9,QWORD PTR[8+rsi]
	mov	r10,QWORD PTR[16+rsi]
	mov	r11,QWORD PTR[24+rsi]

$L$oaded_a_add_mod_pasta::
	add	r8,QWORD PTR[rdx]
	adc	r9,QWORD PTR[8+rdx]
	mov	rax,r8
	adc	r10,QWORD PTR[16+rdx]
	mov	rsi,r9
	adc	r11,QWORD PTR[24+rdx]
	sbb	rdx,rdx

	mov	rbx,r10
	sub	r8,QWORD PTR[rcx]
	sbb	r9,QWORD PTR[8+rcx]
	sbb	r10,QWORD PTR[16+rcx]
	mov	rbp,r11
	sbb	r11,QWORD PTR[24+rcx]
	sbb	rdx,0

	cmovc	r8,rax
	cmovc	r9,rsi
	mov	QWORD PTR[rdi],r8
	cmovc	r10,rbx
	mov	QWORD PTR[8+rdi],r9
	cmovc	r11,rbp
	mov	QWORD PTR[16+rdi],r10
	mov	QWORD PTR[24+rdi],r11

	mov	rbx,QWORD PTR[8+rsp]

	mov	rbp,QWORD PTR[16+rsp]

	lea	rsp,QWORD PTR[24+rsp]

$L$SEH_epilogue_add_mod_pasta::
	mov	rdi,QWORD PTR[8+rsp]	;WIN64 epilogue
	mov	rsi,QWORD PTR[16+rsp]

	DB	0F3h,0C3h		;repret

$L$SEH_end_add_mod_pasta::
add_mod_pasta	ENDP


PUBLIC	sub_mod_pasta


ALIGN	32
sub_mod_pasta	PROC PUBLIC
	DB	243,15,30,250
	mov	QWORD PTR[8+rsp],rdi	;WIN64 prologue
	mov	QWORD PTR[16+rsp],rsi
	mov	r11,rsp
$L$SEH_begin_sub_mod_pasta::
	mov	rdi,rcx
	mov	rsi,rdx
	mov	rdx,r8
	mov	rcx,r9



	push	rbp

	push	rbx

	sub	rsp,8

$L$SEH_body_sub_mod_pasta::


	mov	r8,QWORD PTR[rsi]
	mov	r9,QWORD PTR[8+rsi]
	mov	r10,QWORD PTR[16+rsi]
	mov	r11,QWORD PTR[24+rsi]

	sub	r8,QWORD PTR[rdx]
	mov	rax,QWORD PTR[rcx]
	sbb	r9,QWORD PTR[8+rdx]
	mov	rsi,QWORD PTR[8+rcx]
	sbb	r10,QWORD PTR[16+rdx]
	mov	rbx,QWORD PTR[16+rcx]
	sbb	r11,QWORD PTR[24+rdx]
	mov	rbp,QWORD PTR[24+rcx]
	sbb	rdx,rdx

	and	rax,rdx
	and	rsi,rdx
	and	rbx,rdx
	and	rbp,rdx

	add	r8,rax
	adc	r9,rsi
	mov	QWORD PTR[rdi],r8
	adc	r10,rbx
	mov	QWORD PTR[8+rdi],r9
	adc	r11,rbp
	mov	QWORD PTR[16+rdi],r10
	mov	QWORD PTR[24+rdi],r11

	mov	rbx,QWORD PTR[8+rsp]

	mov	rbp,QWORD PTR[16+rsp]

	lea	rsp,QWORD PTR[24+rsp]

$L$SEH_epilogue_sub_mod_pasta::
	mov	rdi,QWORD PTR[8+rsp]	;WIN64 epilogue
	mov	rsi,QWORD PTR[16+rsp]

	DB	0F3h,0C3h		;repret

$L$SEH_end_sub_mod_pasta::
sub_mod_pasta	ENDP
.text$	ENDS
.pdata	SEGMENT READONLY ALIGN(4)
ALIGN	4
	DD	imagerel $L$SEH_begin_add_mod_pasta
	DD	imagerel $L$SEH_body_add_mod_pasta
	DD	imagerel $L$SEH_info_add_mod_pasta_prologue

	DD	imagerel $L$SEH_body_add_mod_pasta
	DD	imagerel $L$SEH_epilogue_add_mod_pasta
	DD	imagerel $L$SEH_info_add_mod_pasta_body

	DD	imagerel $L$SEH_epilogue_add_mod_pasta
	DD	imagerel $L$SEH_end_add_mod_pasta
	DD	imagerel $L$SEH_info_add_mod_pasta_epilogue

	DD	imagerel $L$SEH_begin_sub_mod_pasta
	DD	imagerel $L$SEH_body_sub_mod_pasta
	DD	imagerel $L$SEH_info_sub_mod_pasta_prologue

	DD	imagerel $L$SEH_body_sub_mod_pasta
	DD	imagerel $L$SEH_epilogue_sub_mod_pasta
	DD	imagerel $L$SEH_info_sub_mod_pasta_body

	DD	imagerel $L$SEH_epilogue_sub_mod_pasta
	DD	imagerel $L$SEH_end_sub_mod_pasta
	DD	imagerel $L$SEH_info_sub_mod_pasta_epilogue

.pdata	ENDS
.xdata	SEGMENT READONLY ALIGN(8)
ALIGN	8
$L$SEH_info_add_mod_pasta_prologue::
DB	1,0,5,00bh
DB	0,074h,1,0
DB	0,064h,2,0
DB	0,003h
DB	0,0
$L$SEH_info_add_mod_pasta_body::
DB	1,0,9,0
DB	000h,034h,001h,000h
DB	000h,054h,002h,000h
DB	000h,074h,004h,000h
DB	000h,064h,005h,000h
DB	000h,022h
DB	000h,000h
$L$SEH_info_add_mod_pasta_epilogue::
DB	1,0,4,0
DB	000h,074h,001h,000h
DB	000h,064h,002h,000h
DB	000h,000h,000h,000h

$L$SEH_info_sub_mod_pasta_prologue::
DB	1,0,5,00bh
DB	0,074h,1,0
DB	0,064h,2,0
DB	0,003h
DB	0,0
$L$SEH_info_sub_mod_pasta_body::
DB	1,0,9,0
DB	000h,034h,001h,000h
DB	000h,054h,002h,000h
DB	000h,074h,004h,000h
DB	000h,064h,005h,000h
DB	000h,022h
DB	000h,000h
$L$SEH_info_sub_mod_pasta_epilogue::
DB	1,0,4,0
DB	000h,074h,001h,000h
DB	000h,064h,002h,000h
DB	000h,000h,000h,000h


.xdata	ENDS
END
