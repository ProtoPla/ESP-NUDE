.section .text.startup, "ax"
.global _start
.type _start, @function
.extern main

_start:
    call0 main       /* call main function */
1:
    j 1b             /* infinite loop */
