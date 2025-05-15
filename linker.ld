/* Minimal linker script for ESP32 WROOM-32 bare-metal */

/* Adjust FLASH and IRAM sizes and start addresses as needed */

MEMORY
{
  /* ESP32 typically has 4MB flash starting at 0x100000 */
  FLASH (rx) : ORIGIN = 0x100000, LENGTH = 4M

  /* IRAM for executable code and literals (typically 0x40000000) */
  IRAM (rx) : ORIGIN = 0x40080000, LENGTH = 512K
}

/* Entry point */
ENTRY(_start)

SECTIONS
{
  /* Text section: code + literals + read-only data */
  .text : ALIGN(4)
  {
    KEEP(*(.text.startup))   /* crt0 startup */
    *(.literal)              /* literals before code */
    *(.rodata*)              /* read-only data */
    *(.text*)                /* all code */
  } > IRAM

  /* Data section: initialized data */
  .data : ALIGN(4)
  {
    _data = .;
    *(.data*)
    _edata = .;
  } > IRAM

  /* BSS section: zero-initialized data */
  .bss : ALIGN(4)
  {
    _bss_start = .;
    *(.bss*)
    *(COMMON)
    _bss_end = .;
  } > IRAM

  /* Stack and heap could be defined here if you want */

  /* Provide symbols for runtime */
  _stack_start = ORIGIN(IRAM) + LENGTH(IRAM);
}
