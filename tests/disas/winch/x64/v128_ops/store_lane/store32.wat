;;! target = "x86_64"
;;! test = "winch"
;;! flags = [ "-Ccranelift-has-avx" ]

(module
  (memory 1 1)
  (func (export "_start")
        (v128.store32_lane
          1 (i32.const 0) (v128.const i64x2 0xFFFFFFFFFFFFFFFF 0xFFFFFFFFFFFFFFFF)
          )))
;; wasm[0]::function[0]:
;;       pushq   %rbp
;;       movq    %rsp, %rbp
;;       movq    8(%rdi), %r11
;;       movq    0x10(%r11), %r11
;;       addq    $0x10, %r11
;;       cmpq    %rsp, %r11
;;       ja      0x52
;;   1c: movq    %rdi, %r14
;;       subq    $0x10, %rsp
;;       movq    %rdi, 8(%rsp)
;;       movq    %rsi, (%rsp)
;;       movdqu  0x29(%rip), %xmm0
;;       movl    $0, %eax
;;       movq    0x38(%r14), %rcx
;;       addq    %rax, %rcx
;;       vpextrd $1, %xmm0, (%rcx)
;;       addq    $0x10, %rsp
;;       popq    %rbp
;;       retq
;;   52: ud2
;;   54: addb    %al, (%rax)
;;   56: addb    %al, (%rax)
;;   58: addb    %al, (%rax)
;;   5a: addb    %al, (%rax)
;;   5c: addb    %al, (%rax)
;;   5e: addb    %al, (%rax)
