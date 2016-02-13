	.file	"compile_test.cpp"
	.section	.text$_Z6printfPKcz,"x"
	.linkonce discard
	.p2align 4,,15
	.globl	_Z6printfPKcz
	.def	_Z6printfPKcz;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z6printfPKcz
_Z6printfPKcz:
.LFB23:
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movq	%rdx, 72(%rsp)
	leaq	72(%rsp), %rdx
	movq	%r8, 80(%rsp)
	movq	%r9, 88(%rsp)
	movq	%rdx, 40(%rsp)
	call	__mingw_vprintf
	addq	$56, %rsp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC0:
	.ascii "sum thing is weird\0"
	.text
	.p2align 4,,15
	.globl	_Z18run_random_acessesP4linky
	.def	_Z18run_random_acessesP4linky;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z18run_random_acessesP4linky
_Z18run_random_acessesP4linky:
.LFB61:
	.seh_endprologue
	testq	%rdx, %rdx
	je	.L3
	leaq	-1(%rdx), %r8
	movq	(%rcx), %rcx
	movl	$1, %eax
	andl	$7, %r8d
	cmpq	$1, %rdx
	je	.L3
	testq	%r8, %r8
	je	.L4
	cmpq	$1, %r8
	je	.L32
	cmpq	$2, %r8
	je	.L33
	cmpq	$3, %r8
	je	.L34
	cmpq	$4, %r8
	je	.L35
	cmpq	$5, %r8
	je	.L36
	cmpq	$6, %r8
	je	.L37
	movq	(%rcx), %rcx
	movl	$2, %eax
.L37:
	movq	(%rcx), %rcx
	addq	$1, %rax
.L36:
	movq	(%rcx), %rcx
	addq	$1, %rax
.L35:
	movq	(%rcx), %rcx
	addq	$1, %rax
.L34:
	movq	(%rcx), %rcx
	addq	$1, %rax
.L33:
	movq	(%rcx), %rcx
	addq	$1, %rax
.L32:
	addq	$1, %rax
	movq	(%rcx), %rcx
	cmpq	%rax, %rdx
	je	.L3
.L4:
	movq	(%rcx), %rcx
	addq	$8, %rax
	cmpq	%rax, %rdx
	movq	(%rcx), %r9
	movq	(%r9), %r10
	movq	(%r10), %r11
	movq	(%r11), %r8
	movq	(%r8), %rcx
	movq	(%rcx), %r9
	movq	(%r9), %rcx
	jne	.L4
.L3:
	testq	%rcx, %rcx
	je	.L48
	rep ret
	.p2align 4,,10
.L48:
	leaq	.LC0(%rip), %rcx
	jmp	_Z6printfPKcz
	.seh_endproc
	.ident	"GCC: (x86_64-posix-seh-rev1, Built by MinGW-W64 project) 5.2.0"
	.def	__mingw_vprintf;	.scl	2;	.type	32;	.endef
