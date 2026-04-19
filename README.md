# SIMON-Cipher-Hardware-Implementation-
Verilog implementation of a lightweight SIMON block cipher with top-level integration and testbench for secure hardware encryption.
# 🔐 SIMON Cipher Hardware Implementation (Verilog)

This project implements a **lightweight block cipher (SIMON)** in Verilog, designed for **secure and efficient hardware encryption** in resource-constrained systems such as IoT and embedded devices.

---

## 📌 Features

- 🔒 SIMON lightweight encryption algorithm
- ⚙️ Fully modular Verilog design
- 🧩 Top-level integration module
- 🧪 Testbench for functional verification
- 📂 Supports memory-based input (HEX file)

---

---

## ⚙️ Design Overview

### 🔐 SIMON Cipher Core (`encrypt.v`)
- Implements lightweight block cipher operations
- Uses bitwise operations (shift, XOR, AND)
- Optimized for hardware efficiency

---

### 🧩 Wrapper & Top Modules

#### `simon_top_wrapper.v`
- Connects encryption core to system interface
- Manages input/output flow

#### `Top.v`
- Full system integration
- Handles data input, processing, and output

---

### 🧪 Testbench (`Top_tb.v`)
- Simulates encryption process
- Loads input data from `dsd.hex`
- Verifies correctness of output

---

## ▶️ How to Run

### Using Icarus Verilog

```bash
iverilog -o sim encrypt.v simon_top_wrapper.v Top.v Top_tb.v
vvp sim
