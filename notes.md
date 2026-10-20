Kernel contains the code for the instruction, e.g. multiply an array of length 8 by 2. This array has 8 threads, so 8 computations in parallel. Code will run when start signal is set to high.
Code is converted into a binary signal and uploaded into program memory, to be fetched later. Inputs and results will be uploaded to the data memory.  Number of threads will be specified in the code, and stored in a register called device control register.
Dispatcher reads the number of threads from device control register, and distributes threads among the compute cores, which actually execute the instructions
Dispatcher need not interact with the code itself.
Global data memory has 256 cells and each cell stores an 8 bit value. Global program memory has 256 cells and each cell stores a 16 bit value.
Memory controllers within GPU (data and program) will act as intermediaries between global memory and cache/cores.
Cache will store global memory temporarily for quick access. Cache might be left out initially.
COMPUTE CORES:

