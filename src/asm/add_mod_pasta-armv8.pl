#!/usr/bin/env perl
#
# Copyright Supranational LLC
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

$flavour = shift;
$output  = shift;

if ($flavour && $flavour ne "void") {
    $0 =~ m/(.*[\/\\])[^\/\\]+$/; $dir=$1;
    ( $xlate="${dir}arm-xlate.pl" and -f $xlate ) or
    ( $xlate="${dir}../../perlasm/arm-xlate.pl" and -f $xlate) or
    die "can't locate arm-xlate.pl";

    open STDOUT,"| \"$^X\" $xlate $flavour $output";
} else {
    open STDOUT,">$output";
}

($r_ptr,$a_ptr,$b_ptr,$n_ptr) = map("x$_", 0..3);

@mod=map("x$_",(4..7));
@a=map("x$_",(8..11));
@b=map("x$_",(12..15));
@t=map("x$_",(16,17,1..3));

$code.=<<___;
.text

.globl	add_mod_pasta
.hidden	add_mod_pasta
.type	add_mod_pasta,%function
.align	5
add_mod_pasta:
	ldp	@a[0],@a[1],[$a_ptr]
	ldp	@b[0],@b[1],[$b_ptr]

	 ldp	@a[2],@a[3],[$a_ptr,#16]
	adds	@a[0],@a[0],@b[0]
	 ldp	@b[2],@b[3],[$b_ptr,#16]
	adcs	@a[1],@a[1],@b[1]
	 ldp	@mod[0],@mod[1],[$n_ptr]
	adcs	@a[2],@a[2],@b[2]
	 ldp	@mod[2],@mod[3],[$n_ptr,#16]
	adcs	@a[3],@a[3],@b[3]
	adc	@t[4],xzr,xzr

	subs	@t[0],@a[0],@mod[0]
	sbcs	@t[1],@a[1],@mod[1]
	sbcs	@t[2],@a[2],@mod[2]
	sbcs	@t[3],@a[3],@mod[3]
	sbcs	xzr,@t[4],xzr

	csel	@a[0],@a[0],@t[0],lo
	csel	@a[1],@a[1],@t[1],lo
	csel	@a[2],@a[2],@t[2],lo
	stp	@a[0],@a[1],[$r_ptr]
	csel	@a[3],@a[3],@t[3],lo
	stp	@a[2],@a[3],[$r_ptr,#16]

	ret
.size	add_mod_pasta,.-add_mod_pasta

.globl	sub_mod_pasta
.hidden	sub_mod_pasta
.type	sub_mod_pasta,%function
.align	5
sub_mod_pasta:
	ldp	@a[0],@a[1],[$a_ptr]
	ldp	@b[0],@b[1],[$b_ptr]

	 ldp	@a[2],@a[3],[$a_ptr,#16]
	subs	@a[0],@a[0],@b[0]
	 ldp	@b[2],@b[3],[$b_ptr,#16]
	sbcs	@a[1],@a[1],@b[1]
	 ldp	@mod[0],@mod[1],[$n_ptr]
	sbcs	@a[2],@a[2],@b[2]
	 ldp	@mod[2],@mod[3],[$n_ptr,#16]
	sbcs	@a[3],@a[3],@b[3]
	sbc	@t[4],xzr,xzr

	 and	@mod[0],@mod[0],@t[4]
	 and	@mod[1],@mod[1],@t[4]
	adds	@a[0],@a[0],@mod[0]
	 and	@mod[2],@mod[2],@t[4]
	adcs	@a[1],@a[1],@mod[1]
	 and	@mod[3],@mod[3],@t[4]
	adcs	@a[2],@a[2],@mod[2]
	stp	@a[0],@a[1],[$r_ptr]
	adc	@a[3],@a[3],@mod[3]
	stp	@a[2],@a[3],[$r_ptr,#16]

	ret
.size	sub_mod_pasta,.-sub_mod_pasta
___

print $code;

close STDOUT;
