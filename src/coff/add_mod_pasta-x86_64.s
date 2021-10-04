.text	

.globl	add_mod_pasta

.def	add_mod_pasta;	.scl 2;	.type 32;	.endef
.p2align	5
add_mod_pasta:
	.byte	0xf3,0x0f,0x1e,0xfa
	movq	%rdi,8(%rsp)
	movq	%rsi,16(%rsp)
	movq	%rsp,%r11
.LSEH_begin_add_mod_pasta:
	movq	%rcx,%rdi
	movq	%rdx,%rsi
	movq	%r8,%rdx
	movq	%r9,%rcx


	pushq	%rbp

	pushq	%rbx

	subq	$8,%rsp

.LSEH_body_add_mod_pasta:


	movq	0(%rsi),%r8
	movq	8(%rsi),%r9
	movq	16(%rsi),%r10
	movq	24(%rsi),%r11

.Loaded_a_add_mod_pasta:
	addq	0(%rdx),%r8
	adcq	8(%rdx),%r9
	movq	%r8,%rax
	adcq	16(%rdx),%r10
	movq	%r9,%rsi
	adcq	24(%rdx),%r11
	sbbq	%rdx,%rdx

	movq	%r10,%rbx
	subq	0(%rcx),%r8
	sbbq	8(%rcx),%r9
	sbbq	16(%rcx),%r10
	movq	%r11,%rbp
	sbbq	24(%rcx),%r11
	sbbq	$0,%rdx

	cmovcq	%rax,%r8
	cmovcq	%rsi,%r9
	movq	%r8,0(%rdi)
	cmovcq	%rbx,%r10
	movq	%r9,8(%rdi)
	cmovcq	%rbp,%r11
	movq	%r10,16(%rdi)
	movq	%r11,24(%rdi)

	movq	8(%rsp),%rbx

	movq	16(%rsp),%rbp

	leaq	24(%rsp),%rsp

.LSEH_epilogue_add_mod_pasta:
	mov	8(%rsp),%rdi
	mov	16(%rsp),%rsi

	.byte	0xf3,0xc3

.LSEH_end_add_mod_pasta:


.globl	sub_mod_pasta

.def	sub_mod_pasta;	.scl 2;	.type 32;	.endef
.p2align	5
sub_mod_pasta:
	.byte	0xf3,0x0f,0x1e,0xfa
	movq	%rdi,8(%rsp)
	movq	%rsi,16(%rsp)
	movq	%rsp,%r11
.LSEH_begin_sub_mod_pasta:
	movq	%rcx,%rdi
	movq	%rdx,%rsi
	movq	%r8,%rdx
	movq	%r9,%rcx


	pushq	%rbp

	pushq	%rbx

	subq	$8,%rsp

.LSEH_body_sub_mod_pasta:


	movq	0(%rsi),%r8
	movq	8(%rsi),%r9
	movq	16(%rsi),%r10
	movq	24(%rsi),%r11

	subq	0(%rdx),%r8
	movq	0(%rcx),%rax
	sbbq	8(%rdx),%r9
	movq	8(%rcx),%rsi
	sbbq	16(%rdx),%r10
	movq	16(%rcx),%rbx
	sbbq	24(%rdx),%r11
	movq	24(%rcx),%rbp
	sbbq	%rdx,%rdx

	andq	%rdx,%rax
	andq	%rdx,%rsi
	andq	%rdx,%rbx
	andq	%rdx,%rbp

	addq	%rax,%r8
	adcq	%rsi,%r9
	movq	%r8,0(%rdi)
	adcq	%rbx,%r10
	movq	%r9,8(%rdi)
	adcq	%rbp,%r11
	movq	%r10,16(%rdi)
	movq	%r11,24(%rdi)

	movq	8(%rsp),%rbx

	movq	16(%rsp),%rbp

	leaq	24(%rsp),%rsp

.LSEH_epilogue_sub_mod_pasta:
	mov	8(%rsp),%rdi
	mov	16(%rsp),%rsi

	.byte	0xf3,0xc3

.LSEH_end_sub_mod_pasta:
.section	.pdata
.p2align	2
.rva	.LSEH_begin_add_mod_pasta
.rva	.LSEH_body_add_mod_pasta
.rva	.LSEH_info_add_mod_pasta_prologue

.rva	.LSEH_body_add_mod_pasta
.rva	.LSEH_epilogue_add_mod_pasta
.rva	.LSEH_info_add_mod_pasta_body

.rva	.LSEH_epilogue_add_mod_pasta
.rva	.LSEH_end_add_mod_pasta
.rva	.LSEH_info_add_mod_pasta_epilogue

.rva	.LSEH_begin_sub_mod_pasta
.rva	.LSEH_body_sub_mod_pasta
.rva	.LSEH_info_sub_mod_pasta_prologue

.rva	.LSEH_body_sub_mod_pasta
.rva	.LSEH_epilogue_sub_mod_pasta
.rva	.LSEH_info_sub_mod_pasta_body

.rva	.LSEH_epilogue_sub_mod_pasta
.rva	.LSEH_end_sub_mod_pasta
.rva	.LSEH_info_sub_mod_pasta_epilogue

.section	.xdata
.p2align	3
.LSEH_info_add_mod_pasta_prologue:
.byte	1,0,5,0x0b
.byte	0,0x74,1,0
.byte	0,0x64,2,0
.byte	0,0x03
.byte	0,0
.LSEH_info_add_mod_pasta_body:
.byte	1,0,9,0
.byte	0x00,0x34,0x01,0x00
.byte	0x00,0x54,0x02,0x00
.byte	0x00,0x74,0x04,0x00
.byte	0x00,0x64,0x05,0x00
.byte	0x00,0x22
.byte	0x00,0x00
.LSEH_info_add_mod_pasta_epilogue:
.byte	1,0,4,0
.byte	0x00,0x74,0x01,0x00
.byte	0x00,0x64,0x02,0x00
.byte	0x00,0x00,0x00,0x00

.LSEH_info_sub_mod_pasta_prologue:
.byte	1,0,5,0x0b
.byte	0,0x74,1,0
.byte	0,0x64,2,0
.byte	0,0x03
.byte	0,0
.LSEH_info_sub_mod_pasta_body:
.byte	1,0,9,0
.byte	0x00,0x34,0x01,0x00
.byte	0x00,0x54,0x02,0x00
.byte	0x00,0x74,0x04,0x00
.byte	0x00,0x64,0x05,0x00
.byte	0x00,0x22
.byte	0x00,0x00
.LSEH_info_sub_mod_pasta_epilogue:
.byte	1,0,4,0
.byte	0x00,0x74,0x01,0x00
.byte	0x00,0x64,0x02,0x00
.byte	0x00,0x00,0x00,0x00

