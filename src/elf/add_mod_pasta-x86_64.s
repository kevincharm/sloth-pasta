.text	

.globl	add_mod_pasta
.hidden	add_mod_pasta
.type	add_mod_pasta,@function
.align	32
add_mod_pasta:
.cfi_startproc
	.byte	0xf3,0x0f,0x1e,0xfa


	pushq	%rbp
.cfi_adjust_cfa_offset	8
.cfi_offset	%rbp,-16
	pushq	%rbx
.cfi_adjust_cfa_offset	8
.cfi_offset	%rbx,-24
	subq	$8,%rsp
.cfi_adjust_cfa_offset	8


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
.cfi_restore	%rbx
	movq	16(%rsp),%rbp
.cfi_restore	%rbp
	leaq	24(%rsp),%rsp
.cfi_adjust_cfa_offset	-24

	.byte	0xf3,0xc3
.cfi_endproc	
.size	add_mod_pasta,.-add_mod_pasta


.globl	sub_mod_pasta
.hidden	sub_mod_pasta
.type	sub_mod_pasta,@function
.align	32
sub_mod_pasta:
.cfi_startproc
	.byte	0xf3,0x0f,0x1e,0xfa


	pushq	%rbp
.cfi_adjust_cfa_offset	8
.cfi_offset	%rbp,-16
	pushq	%rbx
.cfi_adjust_cfa_offset	8
.cfi_offset	%rbx,-24
	subq	$8,%rsp
.cfi_adjust_cfa_offset	8


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
.cfi_restore	%rbx
	movq	16(%rsp),%rbp
.cfi_restore	%rbp
	leaq	24(%rsp),%rsp
.cfi_adjust_cfa_offset	-24

	.byte	0xf3,0xc3
.cfi_endproc	
.size	sub_mod_pasta,.-sub_mod_pasta

.section	.note.gnu.property,"a",@note
	.long	4,2f-1f,5
	.byte	0x47,0x4E,0x55,0
1:	.long	0xc0000002,4,3
.align	8
2:
