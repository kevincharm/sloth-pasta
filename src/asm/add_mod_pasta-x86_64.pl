#!/usr/bin/env perl
#
# Copyright Supranational LLC
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

$flavour = shift;
$output  = shift;
if ($flavour =~ /\./) { $output = $flavour; undef $flavour; }

$win64=0; $win64=1 if ($flavour =~ /[nm]asm|mingw64/ || $output =~ /\.asm$/);

$0 =~ m/(.*[\/\\])[^\/\\]+$/; $dir=$1;
( $xlate="${dir}x86_64-xlate.pl" and -f $xlate ) or
( $xlate="${dir}../../perlasm/x86_64-xlate.pl" and -f $xlate) or
die "can't locate x86_64-xlate.pl";

open STDOUT,"| \"$^X\" \"$xlate\" $flavour \"$output\""
    or die "can't call $xlate: $!";

# common argument layout
($r_ptr,$a_ptr,$b_org,$n_ptr) = ("%rdi","%rsi","%rdx","%rcx");
$b_ptr = "%rbx";

{ ############################################################## 256 bits add
my @acc=map("%r$_",(8..11, "ax", "si", "bx", "bp", 12));

$code.=<<___;
.text

.globl	add_mod_pasta
.hidden	add_mod_pasta
.type	add_mod_pasta,\@function,4,"unwind"
.align	32
add_mod_pasta:
.cfi_startproc
	push	%rbp
.cfi_push	%rbp
	push	%rbx
.cfi_push	%rbx
	sub	\$8, %rsp
.cfi_adjust_cfa_offset	8
.cfi_end_prologue

	mov	8*0($a_ptr), @acc[0]
	mov	8*1($a_ptr), @acc[1]
	mov	8*2($a_ptr), @acc[2]
	mov	8*3($a_ptr), @acc[3]

.Loaded_a_add_mod_pasta:
	add	8*0($b_org), @acc[0]
	adc	8*1($b_org), @acc[1]
	 mov	@acc[0], @acc[4]
	adc	8*2($b_org), @acc[2]
	 mov	@acc[1], @acc[5]
	adc	8*3($b_org), @acc[3]
	sbb	$b_org, $b_org

	 mov	@acc[2], @acc[6]
	sub	8*0($n_ptr), @acc[0]
	sbb	8*1($n_ptr), @acc[1]
	sbb	8*2($n_ptr), @acc[2]
	 mov	@acc[3], @acc[7]
	sbb	8*3($n_ptr), @acc[3]
	sbb	\$0, $b_org

	cmovc	@acc[4], @acc[0]
	cmovc	@acc[5], @acc[1]
	mov	@acc[0], 8*0($r_ptr)
	cmovc	@acc[6], @acc[2]
	mov	@acc[1], 8*1($r_ptr)
	cmovc	@acc[7], @acc[3]
	mov	@acc[2], 8*2($r_ptr)
	mov	@acc[3], 8*3($r_ptr)

	mov	8(%rsp),%rbx
.cfi_restore	%rbx
	mov	16(%rsp),%rbp
.cfi_restore	%rbp
	lea	24(%rsp),%rsp
.cfi_adjust_cfa_offset	-24
.cfi_epilogue
	ret
.cfi_endproc
.size	add_mod_pasta,.-add_mod_pasta

########################################################################
.globl	sub_mod_pasta
.hidden	sub_mod_pasta
.type	sub_mod_pasta,\@function,4,"unwind"
.align	32
sub_mod_pasta:
.cfi_startproc
	push	%rbp
.cfi_push	%rbp
	push	%rbx
.cfi_push	%rbx
	sub	\$8, %rsp
.cfi_adjust_cfa_offset	8
.cfi_end_prologue

	mov	8*0($a_ptr), @acc[0]
	mov	8*1($a_ptr), @acc[1]
	mov	8*2($a_ptr), @acc[2]
	mov	8*3($a_ptr), @acc[3]

	sub	8*0($b_org), @acc[0]
	 mov	8*0($n_ptr), @acc[4]
	sbb	8*1($b_org), @acc[1]
	 mov	8*1($n_ptr), @acc[5]
	sbb	8*2($b_org), @acc[2]
	 mov	8*2($n_ptr), @acc[6]
	sbb	8*3($b_org), @acc[3]
	 mov	8*3($n_ptr), @acc[7]
	sbb	$b_org, $b_org

	and	$b_org, @acc[4]
	and	$b_org, @acc[5]
	and	$b_org, @acc[6]
	and	$b_org, @acc[7]

	add	@acc[4], @acc[0]
	adc	@acc[5], @acc[1]
	mov	@acc[0], 8*0($r_ptr)
	adc	@acc[6], @acc[2]
	mov	@acc[1], 8*1($r_ptr)
	adc	@acc[7], @acc[3]
	mov	@acc[2], 8*2($r_ptr)
	mov	@acc[3], 8*3($r_ptr)

	mov	8(%rsp),%rbx
.cfi_restore	%rbx
	mov	16(%rsp),%rbp
.cfi_restore	%rbp
	lea	24(%rsp),%rsp
.cfi_adjust_cfa_offset	-24
.cfi_epilogue
	ret
.cfi_endproc
.size	sub_mod_pasta,.-sub_mod_pasta
___
}

print $code;
close STDOUT;
