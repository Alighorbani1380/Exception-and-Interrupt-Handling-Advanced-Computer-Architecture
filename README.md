# Advanced Computer Architecture - Exception and Interrupt Handling 🚀

This repository contains the implementation of **Exception Handling** and **Interrupt Handling** mechanisms for a MIPS-like processor. The project demonstrates the design and functionality of a data path capable of detecting and managing various exceptions and interrupts.

---

## 📚 Project Overview

Handling **Exceptions** and **Interrupts** is a critical part of modern processor architecture. This project aims to:

- Extend the processor's data path to detect and handle exceptions.
- Implement an **Interrupt Routine** to respond to external and internal events.
- Test the processor with a specific program to ensure proper functionality.

---

## ✨ Features

1. **Exception Handling**:
   - Detects multiple types of exceptions, including:
     - `PC Address Exception`
     - `Unknown Instruction Exception`
     - `Overflow Exception`
     - `Data Address Exception`
   - Executes corresponding exception handling routines (EHR).

2. **Interrupt Handling**:
   - Detects external interrupts (e.g., timer overflow).
   - Implements a simple interrupt routine to increment a memory location.

3. **Testbench**:
   - A program that finds the maximum value in a 10-element array.
   - Generates an interrupt every 15 cycles for testing.

---

## 🛠️ Modules and Design

The design consists of the following core modules:

### 1. **Exep_Detector_Fetch**
- Checks for invalid program counter (PC) addresses.
- Outputs `PC Address Exception` signals.

### 2. **Exep_Detector_ID**
- Identifies unknown instructions.
- Outputs `Unknown Instruction Exception` signals.

### 3. **Exep_Detector_EXE**
- Detects **Overflow Exceptions** during arithmetic operations in the ALU.
- Sends exception signals and target register details.

### 4. **Exep_Detector_MEM**
- Detects invalid memory access (Data Address Exception).
- Monitors the `Interrupt` signal and triggers the interrupt handling routine.

---

## 🧪 Testing

The processor was tested using a program that:
- Finds the maximum element in a signed integer array of size 10.
- Simulates an interrupt every 15 cycles.

### Simulation Results:
- The exceptions and interrupts were correctly handled without affecting the primary computation.
- The final results were verified to be accurate.
- ![image](https://github.com/user-attachments/assets/5b4bcd91-3996-463d-863d-2838c3955653)


