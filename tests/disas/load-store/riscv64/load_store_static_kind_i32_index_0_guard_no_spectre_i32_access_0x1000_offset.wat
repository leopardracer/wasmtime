;;! target = "riscv64"
;;! test = "compile"
;;! flags = " -C cranelift-enable-heap-access-spectre-mitigation=false -O static-memory-forced -O static-memory-guard-size=0 -O dynamic-memory-guard-size=0"

;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;; !!! GENERATED BY 'make-load-store-tests.sh' DO NOT EDIT !!!
;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

(module
  (memory i32 1)

  (func (export "do_store") (param i32 i32)
    local.get 0
    local.get 1
    i32.store offset=0x1000)

  (func (export "do_load") (param i32) (result i32)
    local.get 0
    i32.load offset=0x1000))

;; wasm[0]::function[0]:
;;       addi    sp, sp, -0x10
;;       sd      ra, 8(sp)
;;       sd      s0, 0(sp)
;;       mv      s0, sp
;;       slli    a4, a2, 0x20
;;       srli    a5, a4, 0x20
;;       lui     a2, 0x40000
;;       addi    a4, a2, -0x401
;;       slli    a1, a4, 2
;;       bgeu    a1, a5, 8
;;       .byte   0x00, 0x00, 0x00, 0x00
;;       ld      a0, 0x38(a0)
;;       add     a5, a0, a5
;;       lui     t6, 1
;;       add     t6, t6, a5
;;       sw      a3, 0(t6)
;;       ld      ra, 8(sp)
;;       ld      s0, 0(sp)
;;       addi    sp, sp, 0x10
;;       ret
;;
;; wasm[0]::function[1]:
;;       addi    sp, sp, -0x10
;;       sd      ra, 8(sp)
;;       sd      s0, 0(sp)
;;       mv      s0, sp
;;       slli    a3, a2, 0x20
;;       srli    a5, a3, 0x20
;;       lui     a2, 0x40000
;;       addi    a4, a2, -0x401
;;       slli    a1, a4, 2
;;       bgeu    a1, a5, 8
;;       .byte   0x00, 0x00, 0x00, 0x00
;;       ld      a0, 0x38(a0)
;;       add     a5, a0, a5
;;       lui     t6, 1
;;       add     t6, t6, a5
;;       lw      a0, 0(t6)
;;       ld      ra, 8(sp)
;;       ld      s0, 0(sp)
;;       addi    sp, sp, 0x10
;;       ret
