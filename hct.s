	.file	"hct.cpp"
	.section	.text$_ZNKSt5ctypeIcE8do_widenEc,"x"
	.linkonce discard
	.align 2
	.p2align 4,,15
	.globl	_ZNKSt5ctypeIcE8do_widenEc
	.def	_ZNKSt5ctypeIcE8do_widenEc;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNKSt5ctypeIcE8do_widenEc
_ZNKSt5ctypeIcE8do_widenEc:
.LFB1205:
	.seh_endprologue
	movl	%edx, %eax
	ret
	.seh_endproc
	.text
	.p2align 4,,15
	.def	__tcf_0;	.scl	3;	.type	32;	.endef
	.seh_proc	__tcf_0
__tcf_0:
.LFB1659:
	.seh_endprologue
	leaq	_ZStL8__ioinit(%rip), %rcx
	jmp	_ZNSt8ios_base4InitD1Ev
	.seh_endproc
	.p2align 4,,15
	.globl	_Z4Randv
	.def	_Z4Randv;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z4Randv
_Z4Randv:
.LFB1462:
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	call	rand
	cltq
	addq	$40, %rsp
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	_Z10calc_randsv
	.def	_Z10calc_randsv;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z10calc_randsv
_Z10calc_randsv:
.LFB1463:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	leaq	rands(%rip), %r12
	leaq	16384+rands(%rip), %rbp
	movl	$10, %ecx
	call	srand
	.p2align 4,,10
.L5:
	call	rand
	movslq	%eax, %rdi
	addq	$16, %r12
	call	rand
	movslq	%eax, %rbx
	call	rand
	cltq
	salq	$8, %rbx
	salq	$16, %rax
	addq	%rax, %rbx
	leaq	(%rbx,%rdi), %rsi
	call	rand
	movslq	%eax, %rdi
	salq	$24, %rdi
	call	rand
	addq	%rsi, %rdi
	salq	$32, %rax
	addq	%rax, %rdi
	movq	%rdi, -16(%r12)
	call	rand
	movslq	%eax, %rsi
	call	rand
	movslq	%eax, %rbx
	call	rand
	cltq
	salq	$8, %rbx
	salq	$16, %rax
	addq	%rax, %rbx
	leaq	(%rbx,%rsi), %rdi
	call	rand
	movslq	%eax, %rsi
	salq	$24, %rsi
	call	rand
	addq	%rdi, %rsi
	salq	$32, %rax
	addq	%rax, %rsi
	movq	%rsi, -8(%r12)
	cmpq	%rbp, %r12
	jne	.L5
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	_Z18run_random_acessesPvyyy
	.def	_Z18run_random_acessesPvyyy;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z18run_random_acessesPvyyy
_Z18run_random_acessesPvyyy:
.LFB1464:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	testq	%r9, %r9
	je	.L10
	leaq	16384+rands(%rip), %r10
	movl	%r9d, %ebx
	xorl	%r11d, %r11d
	xorl	%eax, %eax
	xorl	%r9d, %r9d
	.p2align 4,,10
.L12:
	leaq	rands(%rip), %rdx
	.p2align 4,,10
.L11:
	movq	%r8, %rsi
	addq	$64, %rdx
	andq	%rax, %rsi
	addq	-64(%rdx), %rax
	movzbl	(%rcx,%rsi), %esi
	addq	%rsi, %r9
	movq	%r8, %rsi
	andq	%rax, %rsi
	addq	-56(%rdx), %rax
	movzbl	(%rcx,%rsi), %esi
	addq	%rsi, %r9
	movq	%r8, %rsi
	andq	%rax, %rsi
	addq	-48(%rdx), %rax
	movzbl	(%rcx,%rsi), %esi
	addq	%rsi, %r9
	movq	%r8, %rsi
	andq	%rax, %rsi
	addq	-40(%rdx), %rax
	movzbl	(%rcx,%rsi), %esi
	addq	%r9, %rsi
	movq	%r8, %r9
	andq	%rax, %r9
	addq	-32(%rdx), %rax
	movzbl	(%rcx,%r9), %r9d
	addq	%r9, %rsi
	movq	%r8, %r9
	andq	%rax, %r9
	addq	-24(%rdx), %rax
	movzbl	(%rcx,%r9), %r9d
	addq	%r9, %rsi
	movq	%r8, %r9
	andq	%rax, %r9
	addq	-16(%rdx), %rax
	movzbl	(%rcx,%r9), %r9d
	addq	%r9, %rsi
	movq	%r8, %r9
	andq	%rax, %r9
	addq	-8(%rdx), %rax
	movzbl	(%rcx,%r9), %r9d
	addq	%rsi, %r9
	cmpq	%rdx, %r10
	jne	.L11
	addl	$1, %r11d
	cmpl	%ebx, %r11d
	jne	.L12
	movabsq	$12312311923, %rcx
	cmpq	%rcx, %r9
	je	.L25
.L10:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
.L25:
	movl	$1, %ecx
	call	exit
	nop
	.seh_endproc
	.p2align 4,,15
	.globl	_Z19time_random_acessesPvyyy
	.def	_Z19time_random_acessesPvyyy;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z19time_random_acessesPvyyy
_Z19time_random_acessesPvyyy:
.LFB1465:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%r9, %rsi
	movq	%rcx, %rbp
	movq	%r8, %r12
	call	clock
	testq	%rsi, %rsi
	movl	%eax, %ebx
	je	.L27
	leaq	16384+rands(%rip), %r9
	movl	%esi, %r11d
	xorl	%r10d, %r10d
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
.L29:
	leaq	rands(%rip), %rdx
	.p2align 4,,10
.L28:
	movq	%r12, %rdi
	movq	%r12, %r8
	addq	$64, %rdx
	andq	%rax, %rdi
	addq	-64(%rdx), %rax
	movzbl	0(%rbp,%rdi), %ecx
	andq	%rax, %r8
	addq	-56(%rdx), %rax
	addq	%rcx, %rsi
	movzbl	0(%rbp,%r8), %edi
	movq	%r12, %rcx
	andq	%rax, %rcx
	addq	-48(%rdx), %rax
	addq	%rdi, %rsi
	movq	%r12, %rdi
	movzbl	0(%rbp,%rcx), %r8d
	andq	%rax, %rdi
	addq	-40(%rdx), %rax
	movzbl	0(%rbp,%rdi), %ecx
	addq	%r8, %rsi
	movq	%r12, %rdi
	addq	%rsi, %rcx
	movq	%r12, %rsi
	andq	%rax, %rsi
	addq	-32(%rdx), %rax
	movzbl	0(%rbp,%rsi), %r8d
	andq	%rax, %rdi
	addq	-24(%rdx), %rax
	addq	%r8, %rcx
	movzbl	0(%rbp,%rdi), %esi
	movq	%r12, %r8
	andq	%rax, %r8
	addq	-16(%rdx), %rax
	addq	%rsi, %rcx
	movq	%r12, %rsi
	movzbl	0(%rbp,%r8), %edi
	andq	%rax, %rsi
	addq	-8(%rdx), %rax
	movzbl	0(%rbp,%rsi), %esi
	addq	%rdi, %rcx
	addq	%rcx, %rsi
	cmpq	%rdx, %r9
	jne	.L28
	addl	$1, %r10d
	cmpl	%r11d, %r10d
	jne	.L29
	movabsq	$12312311923, %rbp
	cmpq	%rbp, %rsi
	je	.L42
.L27:
	call	clock
	vxorpd	%xmm0, %xmm0, %xmm0
	subl	%ebx, %eax
	vcvtsi2sd	%eax, %xmm0, %xmm1
	vdivsd	.LC0(%rip), %xmm1, %xmm0
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
.L42:
	movl	$1, %ecx
	call	exit
	nop
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC1:
	.ascii "\11\11\0"
	.section	.text.startup,"x"
	.p2align 4,,15
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB1466:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$72, %rsp
	.seh_stackalloc	72
	vmovaps	%xmm6, 48(%rsp)
	.seh_savexmm	%xmm6, 48
	.seh_endprologue
	leaq	16384+rands(%rip), %r13
	movl	$13, %esi
	call	__main
	call	_Z10calc_randsv
	vmovsd	.LC0(%rip), %xmm6
.L51:
	movl	$1, %ebx
	leal	-6(%rsi), %r14d
	movl	$31, %ebp
	shlx	%esi, %ebx, %eax
	subl	$1, %eax
	movslq	%eax, %rdx
	movq	%rdx, 40(%rsp)
.L50:
	shlx	%r14, %rbp, %rdi
	xorq	40(%rsp), %rdi
	leaq	1(%rdi), %r12
	movq	%r12, %rcx
	call	malloc
	movq	%rax, %rbx
	call	clock
	movl	$16384, %r8d
	movl	%eax, %r15d
	xorl	%r9d, %r9d
	xorl	%eax, %eax
	.p2align 4,,10
.L45:
	leaq	rands(%rip), %rcx
	.p2align 4,,10
.L44:
	movq	%r9, %r11
	addq	(%rcx), %r9
	addq	$64, %rcx
	andq	%rdi, %r11
	movzbl	(%rbx,%r11), %r10d
	movq	%r9, %rdx
	addq	-56(%rcx), %r9
	andq	%rdi, %rdx
	addq	%r10, %rax
	movzbl	(%rbx,%rdx), %r11d
	movq	%r9, %r10
	addq	-48(%rcx), %r9
	andq	%rdi, %r10
	addq	%r11, %rax
	movzbl	(%rbx,%r10), %edx
	movq	%r9, %r11
	addq	-40(%rcx), %r9
	andq	%rdi, %r11
	addq	%rdx, %rax
	movzbl	(%rbx,%r11), %r10d
	movq	%r9, %rdx
	addq	-32(%rcx), %r9
	andq	%rdi, %rdx
	addq	%r10, %rax
	movzbl	(%rbx,%rdx), %r11d
	movq	%r9, %r10
	addq	-24(%rcx), %r9
	andq	%rdi, %r10
	addq	%r11, %rax
	movzbl	(%rbx,%r10), %edx
	movq	%r9, %r11
	addq	-16(%rcx), %r9
	andq	%rdi, %r11
	movzbl	(%rbx,%r11), %r10d
	addq	%rdx, %rax
	addq	%rax, %r10
	movq	%r9, %rax
	addq	-8(%rcx), %r9
	andq	%rdi, %rax
	movzbl	(%rbx,%rax), %eax
	addq	%r10, %rax
	cmpq	%r13, %rcx
	jne	.L44
	subl	$1, %r8d
	jne	.L45
	movabsq	$12312311923, %rdi
	cmpq	%rdi, %rax
	je	.L64
	call	clock
	movq	.refptr._ZSt4cout(%rip), %rcx
	movq	%r12, %rdx
	movl	%eax, %edi
	subl	%r15d, %edi
	call	_ZNSo9_M_insertIyEERSoT_
	leaq	.LC1(%rip), %rdx
	movl	$2, %r8d
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	vxorpd	%xmm1, %xmm1, %xmm1
	movq	%r12, %rcx
	vcvtsi2sd	%edi, %xmm1, %xmm0
	vdivsd	%xmm6, %xmm0, %xmm1
	call	_ZNSo9_M_insertIdEERSoT_
	movq	(%rax), %r8
	movq	%rax, %r15
	movq	-24(%r8), %r9
	movq	240(%rax,%r9), %rdi
	testq	%rdi, %rdi
	je	.L65
	cmpb	$0, 56(%rdi)
	je	.L48
	movsbl	67(%rdi), %edx
.L49:
	movq	%r15, %rcx
	subq	$1, %rbp
	call	_ZNSo3putEc
	movq	%rax, %rcx
	call	_ZNSo5flushEv
	movq	%rbx, %rcx
	call	free
	cmpq	$-1, %rbp
	jne	.L50
	addl	$1, %esi
	cmpl	$27, %esi
	jne	.L51
	vmovaps	48(%rsp), %xmm6
	xorl	%eax, %eax
	addq	$72, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
.L48:
	movq	%rdi, %rcx
	call	_ZNKSt5ctypeIcE13_M_widen_initEv
	movq	(%rdi), %rcx
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %r11
	movl	$10, %edx
	movq	48(%rcx), %rax
	cmpq	%r11, %rax
	je	.L49
	movq	%rdi, %rcx
	call	*%rax
	movsbl	%al, %edx
	jmp	.L49
.L65:
	call	_ZSt16__throw_bad_castv
.L64:
	movl	$1, %ecx
	call	exit
	nop
	.seh_endproc
	.p2align 4,,15
	.def	_GLOBAL__sub_I_rands;	.scl	3;	.type	32;	.endef
	.seh_proc	_GLOBAL__sub_I_rands
_GLOBAL__sub_I_rands:
.LFB1660:
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	leaq	_ZStL8__ioinit(%rip), %rcx
	call	_ZNSt8ios_base4InitC1Ev
	leaq	__tcf_0(%rip), %rcx
	addq	$40, %rsp
	jmp	atexit
	.seh_endproc
	.section	.ctors,"w"
	.align 8
	.quad	_GLOBAL__sub_I_rands
	.globl	rands
	.bss
	.align 32
rands:
	.space 16384
.lcomm _ZStL8__ioinit,1,1
	.section .rdata,"dr"
	.align 8
.LC0:
	.long	0
	.long	1083129856
	.ident	"GCC: (x86_64-posix-seh-rev1, Built by MinGW-W64 project) 5.2.0"
	.def	_ZNSt8ios_base4InitD1Ev;	.scl	2;	.type	32;	.endef
	.def	rand;	.scl	2;	.type	32;	.endef
	.def	srand;	.scl	2;	.type	32;	.endef
	.def	exit;	.scl	2;	.type	32;	.endef
	.def	clock;	.scl	2;	.type	32;	.endef
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	_ZNSo9_M_insertIyEERSoT_;	.scl	2;	.type	32;	.endef
	.def	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x;	.scl	2;	.type	32;	.endef
	.def	_ZNSo9_M_insertIdEERSoT_;	.scl	2;	.type	32;	.endef
	.def	_ZNSo3putEc;	.scl	2;	.type	32;	.endef
	.def	_ZNSo5flushEv;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	_ZNKSt5ctypeIcE13_M_widen_initEv;	.scl	2;	.type	32;	.endef
	.def	_ZSt16__throw_bad_castv;	.scl	2;	.type	32;	.endef
	.def	_ZNSt8ios_base4InitC1Ev;	.scl	2;	.type	32;	.endef
	.def	atexit;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr._ZSt4cout, "dr"
	.globl	.refptr._ZSt4cout
	.linkonce	discard
.refptr._ZSt4cout:
	.quad	_ZSt4cout
