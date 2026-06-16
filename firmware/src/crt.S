/*
 * crt.S - VexSatV startup code
 *
 *   Boots from BRAM at 0x0000_0000 (reset vector = 0x0).
 *   Trap vector (mtvec, DIRECT mode) = 0x0000_0020.
 *   ISA: RV32IM / ilp32.
 *
 *   Reset entry jumps over the 0x20 trap slot, sets up gp/sp,
 *   clears .bss, then calls main().  The image is loaded straight
 *   into BRAM, so .data is already in place - only .bss is zeroed.
 */

    .section .init, "ax"
    .global _start
    .global _trap_entry

_start:                         /* 0x0000_0000 : reset vector            */
    j      _boot

    .org   0x20                 /* pad up to the mtvec target            */
_trap_entry:                    /* 0x0000_0020 : trap/interrupt vector   */
    j      trap_handler

_boot:
    /* global pointer - disable relaxation until gp is valid */
    .option push
    .option norelax
    la     gp, __global_pointer$
    .option pop

    /* stack pointer at top of BRAM (full descending) */
    la     sp, _stack_top

    /* zero the .bss section */
    la     a0, _bss_start
    la     a1, _bss_end
.Lbss_clear:
    bgeu   a0, a1, .Lbss_done
    sw     zero, 0(a0)
    addi   a0, a0, 4
    j      .Lbss_clear
.Lbss_done:

    /* (mtvec already resets to 0x20; set it again to be explicit) */
    la     t0, _trap_entry
    csrw   mtvec, t0

    /* run the program */
    call   main

    /* if main() returns, park the core */
.Lhang:
    j      .Lhang

/*
 * Default trap handler - weak, so you can override it from C with:
 *     void trap_handler(void) { ... }
 * As-is it just spins; replace it to service CLINT/PLIC interrupts.
 */
    .weak  trap_handler
    .type  trap_handler, @function
trap_handler:
    j      trap_handler
    .size  trap_handler, . - trap_handler
