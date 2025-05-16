# ESP Nude — Crazy ESP32 Programming

## About this repo

This repository documents my journey programming the ESP32 **without any frameworks**—no Arduino, no ESP-IDF—just, custom everything using PlatformIO.

The goal is to build everything from the ground up:  
- Direct control over the hardware  
- Minimal overhead, maximum understanding  
- Custom drivers, own startup code, and manual peripheral management
- Create some documtation for my self to understand what on earth is going on.

## Current Focus

- Setting up basic sensor reading routines  
- Implementing my own debug output to the terminal (UART)  
- Troubleshooting flash and RAM usage reporting in PlatformIO (stats are inaccurate so far)  
- Getting reliable data transmission back to the host terminal for debugging

## Challenges

- PlatformIO does not accurately display flash and RAM usage for this approach, I think I've bunged somthing in the linker file  
- Debugging output via UART is currently unstable or not showing as expected, Becuase I have no idea what im doing  
- Developing the entire toolchain and runtime environment manually is a steep but rewarding learning curve, like I said I have noidea what im doing

---

*I'm activly lossing it*
