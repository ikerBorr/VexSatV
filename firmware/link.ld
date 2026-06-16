/*
 * link.ld - VexSatV linker script
 *
 *   BRAM : 0x0000_0000, 256 KiB  (code + data + stack live here; boots from 0x0)
 *   DDR  : 0x8000_0000, 1 GiB    (optional - large buffers / heap)
 *
 *   The image is loaded into BRAM as-is by the host, so .data needs no
 *   separate load address to copy from; only .bss must be zeroed (crt.S).
 */

OUTPUT_ARCH("riscv")
OUTPUT_FORMAT("elf32-littleriscv")
ENTRY(_start)

MEMORY
{
    ram (rwxa) : ORIGIN = 0x00000000, LENGTH = 256K
    ddr (rwxa) : ORIGIN = 0x80000000, LENGTH = 1024M
}

/* tune to taste */
_stack_size = 4K;

SECTIONS
{
    /* reset (0x0) and trap (0x20) vectors MUST come first, based at 0x0 */
    .init 0x00000000 :
    {
        KEEP(*(.init))
        KEEP(*(.init.*))
    } > ram

    .text :
    {
        *(.text .text.*)
        *(.gnu.linkonce.t.*)
    } > ram

    .rodata :
    {
        . = ALIGN(4);
        *(.rodata .rodata.*)
        *(.srodata .srodata.*)
        *(.gnu.linkonce.r.*)
    } > ram

    .data :
    {
        . = ALIGN(4);
        *(.data .data.*)
        *(.gnu.linkonce.d.*)

        /* gp points into the middle of the small-data area (+/-2 KiB reach) */
        . = ALIGN(8);
        PROVIDE(__global_pointer$ = . + 0x800);
        *(.sdata .sdata.*)
        *(.gnu.linkonce.s.*)
    } > ram

    .bss (NOLOAD) :
    {
        . = ALIGN(4);
        _bss_start = .;
        *(.sbss .sbss.*)
        *(.bss .bss.*)
        *(.gnu.linkonce.b.*)
        *(COMMON)
        . = ALIGN(4);
        _bss_end = .;
    } > ram

    . = ALIGN(8);
    _end = .;
    PROVIDE(end = .);

    /* stack at the very top of BRAM (full descending, 16-byte aligned) */
    _stack_top    = ORIGIN(ram) + LENGTH(ram);
    _stack_bottom = _stack_top - _stack_size;

    /DISCARD/ :
    {
        *(.comment)
        *(.eh_frame)
        *(.eh_frame_hdr)
        *(.riscv.attributes)
    }
}
