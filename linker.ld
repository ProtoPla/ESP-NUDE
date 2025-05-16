/* Bare-metal linker script for ESP32-D0WD-V3
   Aligned with ESP-IDF layout: app starts at 0x10000 */

MEMORY
{
  /* Application firmware location (after bootloader & partition table) */
  FLASH (rx)  : ORIGIN = 0x10000, LENGTH = 3M  /* From 0x10000 onward */

  /* Instruction RAM (IRAM) for code */
  IRAM (rx)   : ORIGIN = 0x40080000, LENGTH = 256K

  /* Data RAM (DRAM) for variables */
  DRAM (rw)   : ORIGIN = 0x3FFB0000, LENGTH = 288K
}

ENTRY(_start)

SECTIONS
{
  /* Code and read-only sections */
  .text : ALIGN(4)
  {
    _text_start = .;
    KEEP(*(.text.startup))
    *(.literal*)
    *(.rodata*)
    *(.text*)
    _etext = .;
  } > IRAM

  /* Initialized data */
.text : ALIGN(4)
  {
      _text_start = .;

      KEEP(*(.text.startup))  /* Keep crt0.o _start */
      KEEP(*(.text.main))     /* In case main() is dropped */
      KEEP(*(.text*))
      KEEP(*(.literal*))
      KEEP(*(.rodata*))

      _etext = .;
  } > IRAM

  /* Zero-initialized data */
  .bss : ALIGN(4)
  {
    _bss_start = .;
    *(.bss*)
    *(COMMON)
    _bss_end = .;
  } > DRAM

  /* Optional stack and heap */
  _stack_start = ORIGIN(DRAM) + LENGTH(DRAM);
  _heap_start = _bss_end;
  _heap_end = _stack_start;
}

