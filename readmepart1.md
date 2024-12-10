# Branch Pointer Pass LLVM Pass

This project contains an LLVM pass for analyzing branching behavior in LLVM IR files. Follow the instructions below to clone the repository, build the project, and run the pass.

## Prerequisites

Make sure you have the following installed on your system:

- LLVM 
- Clang
- CMake

## Quick Start

### 1. Clone the Repository

First, clone the repository to your local machine:

```bash
git clone https://github.com/yourusername/your-repo.git
```
Navigate to the root directory of the repo and run the following commands to build the pass:


## Build the project
Run the following command to build the project:

```bash
make build
```
## Run the pass
After building, you should have a libBranchPointerPass.so file in your build directory. To run the pass, use LLVM's opt tool as follows:

```bash
# opt -load-pass-plugin ./build/BranchPointerPass/libBranchPointerPass.so -passes=branch-pointer-pass -disable-output inputs/input.ll
make run
# you can specify the LLVM installation directory and clang and opt commands as follows:
# make LLVM_DIR=/usr/lib/llvm-17 CLANG_COMMAND=/usr/bin/clang-17 OPT_COMMAND=/usr/bin/opt-17
```

Replace input.ll with the LLVM IR file you want to analyze. Or copy paste the test file code in the input.c and just write "make run" to run the code.

