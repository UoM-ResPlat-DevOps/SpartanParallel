-- *Slide* --
### Part 0: Goals for today
* Part 1: Architecture, and Parallel Limits
* Part 2: Shared Memory Programming with OpenMP
* Part 3: Basic Distributed Memory Programming with OpenMPI
* Part 4: Debugging
-- *Slide End* --

-- *Slide* --
### Part 0: Slide Respository
* A copy of the slides and same code is available at: https://github.com/UoM-ResPlat-DevOps/SpartanParallel
* Make use of our resources: `dashboard.hpc.unimelb.edu.au`,  `hpc-support@unimelb.edu.au`, `man spartan`, `/usr/local/common`
-- *Slide End* --

-- *Slide* --
### Part 1: Parallel Programming Strategy
#### "Taking control is the key strategy!"
-- Dr. Rolf Rabenseifner, High Performance Computing Center, Stuttgart
-- *Slide End* --

-- *Slide* --
### Part 1: Data and Task Parallel Jobs
* The difference between data and task parallisation is a fundamental concept.
* With a data parallel job the data is split up for paralleisation (e.g., multiple datasets, single task).
* With a task parallel job the tasks are split up for parallelisation (e.g., multiple simultaneous tasks).
* A job can be a hybrid of the two (e.g., multiple tasks, multiple datasets).
-- *Slide End* --

-- *Slide* --
### Part 1: Data Parallel Jobs
* Data parallel jobs are the simplest type of parallelism - and the most common.
* Single threaded jobs (such as MATLAB, R etc) can be launched across multiple datasets by using job arrays.
* Example job arrays in Slurm at: `/usr/local/common/array`
* Note that the index values and step size can be varied.
-- *Slide End* --

-- *Slide* --
### Part 1: Task Parallel Jobs
* Task parallel jobs require a communications systems whether it is through threads (OpenMP) or by message passing (OpenMPI).
* Thread-based parallelism requires that the tasks occur within the same computer node (shared memory).
* Message passing can distribute information between compute nodes (distributed memory).
-- *Slide End* --

-- *Slide* --
### Part 1: Task Parallel NAMD
* In Slurm scripts on Spartan MPI programmes will need to set the paths to the OpenMPI wrappers (`module avail OpenMPI/`). Some simple examples are available at: `/usr/local/common/OpenMPI`
* A number of applications are already designed to be task parallel; NAMD is one. An example slurm script is located at `/usr/local/common/NAMD`. This script can be run and can be visualised locally with VMD.
-- *Slide End* --

-- *Slide* --
### Part 1: Task Parallel Matlab
* There is a simple example of task parallel Matlab, available in `/usr/local/common/MATLAB`, using the most basic of Matlab worker distribution, the parfor loop.
-- *Slide End* --

-- *Slide* --
### Part 1: Task Parallel Python
* Python is, by default, a single-threaded programming language. However we have added the mpi4py package to give it parallel capabilites. Example scripts are located at `/usr/local/common/Python`. In particular the file `twitter_search_541635.py` invokes the mpi4py library.
* A number of examples are available at `/usr/local/common/Python/mpi4py-examples-master`
-- *Slide End* --

-- *Slide* --
### Part 1: Flynn's Taxonomy
* The type parallelisation can be determined by Flynn's taxonomy of computer Systems (1966), where each process is considered as the execution of a pool of instructions (instruction stream) on a pool of data (data stream), and with these streams are single or multiple. 
-- *Slide End* --

-- *Slide* --
### Part 1: Flynn's Taxonomy
* Four basic possibilities: Single Instruction Stream, Single Data Stream (SISD), Single Instruction Stream, Multiple Data Streams (SIMD), Multiple Instruction Streams, Single Data Stream (MISD), Multiple Instruction Streams, Multiple Data Streams (MIMD)
-- *Slide End* --

-- *Slide* --
### Part 1: Processors and Cores
* A processor is a physical device that accepts data as input and provides results as output. A uniprocessor system has one such general purpose device. 
* A unicore processor carries out the usual functions of a CPU, according to the instruction set. A multicore processor has independent central processing units ('cores') integrated a single integrated circuit die or a single chip package.
-- *Slide End* --

-- *Slide* --
### Part 1: Threads and Strands
* A process provides the resources to execute an instance of a program (such as address space, the code, handles to system objects, a process identifier etc).  An execution thread is the smallest processing unit in an operating system, contained inside a process. 
* There are also hardware threads (aka "strands"). Determine this from the output of `lscupu` and view the `NUMA node` information.
-- *Slide End* --

-- *Slide* --
### Part 1: Multicore Drivers
<img src="https://raw.githubusercontent.com/UoM-ResPlat-DevOps/SpartanParallel/master/Images/intelcpu.png" />
-- *Slide End* --

-- *Slide* --
### Part 1: Multicore Drivers
* Datasets are becoming larger than computers are improving.
* Effective clock speeds have flattened due to heat and power.
* Increasing gap between memory and processing speeds. 
-- *Slide End* --

-- *Slide* --
### Part 1: Multicore Drivers
* Symmetric multiprocessing (multi-processors, shared memory) is well established technology (IBM System/360, 1964)
* Tilera have developed 64 core (TILE64, 2007), and then a 100 core processor (2009). Founder Dr. Anant Agarwal leads the MIT Angstron Project to develop a 1,000 core processor (2012).
-- *Slide End* --

-- *Slide* --
### Part 1: Memory Distribution
* In a  multiprocessor computer system memory can either be distributed or shared. Memory coherence is an issue is shared memory environments.
* HPC Clusters use memory distributed between compute nodes and shared within compute nodes.
-- *Slide End* --

-- *Slide* --
### Part 1: Memory Distribution
* Operating systems like Plan 9 from Bell Labs creates a network function as a single collection of system resources.
* OpenMP uses shared memory parallelism; MPI uses distributed memory parallelism. The latter can cross compute nodes.
-- *Slide End* --

-- *Slide* --
### Part 1: Speedup and Locks
* The speedup of parallelism can be measured: Speedup (p) = Time (serial)/ Time (parallel). Ideal (linear) speedup is S(p) = p.
* Correctness requires requires synchronisation (locking). Synchronisation and atomic operations causes loss of performance, communication latency. 
-- *Slide End* --

-- *Slide* --
### Part 1: Deadlocks and Livelocks
* "When two trains approach each other at a crossing, both shall come to a full stop and neither shall start up again until the other has gone." (apocryphal Kansas railway statute)
* "When two people approach each other in a crowded corridor, both shall move out of the way of the other, and shall continue to move until they have an open path for progress" (Polite Persons in a Corridor Problem)
-- *Slide End* --

-- *Slide* --
### Part 1: Amdahl's Law 
* Because some of the task is in serial, there is a limit to the speedup based on the time that is required for the sequential task - no matter how many processors are thrown at the problem.
-- *Slide End* --

-- *Slide* --
<img src="https://raw.githubusercontent.com/UoM-ResPlat-DevOps/SpartanParallel/master/Images/amdhal.png" />
-- *Slide End* --

-- *Slide* --
### Part 1: Gustafson-Barsis Law
* Gene Amdahl proposed his law in 1967; it wasn't until over twenty years later in 1988 that an alternative by John L. Gustafson and Edwin H. Barsis was offered. 
* Amadahl's Law assumed a computation problem of fixed data set size. Programmers tend to set the size of their computational problems according to the available equipment; therefore as faster and more parallel equipment becomes available, larger problems can be solved.
-- *Slide End* --

-- *Slide* --
### Part 2: Fork-Join in OpenMP and POSIX
* A fork-join approach can be used in multithreading. This is the method used by OpenMP and also with POSIX threads (pthreads). 
* A program's execution branches off in parallel threads at specified points in the program and joins and merges at a subsequent specified point, returning to serial execution.
-- *Slide End* --

-- *Slide* --
### Part 2: Fork-Join in OpenMP and POSIX
* A master thread contains the instructions that are to be executed in parallel and executes additional worker threads that divide the task among them. 
-- *Slide End* --

-- *Slide* --
### Part 2: OpenMP Directives
* OpenMP API compiler directives and internal control variables can be added to a sequential program to invoke parallel capability. They are the absolute foundation from which a OpenMP program can be differentiated from a sequential program. 
-- *Slide End* --

-- *Slide* --
### Part 2: OpenMP Directives
* OpenMP directives are designed to appear as comments unless the program is explicitly commanded to be attentive to them. Compiler directives are used to initiate a parallel region, divide code among threads, distribute loops among threads, and synchronise work among threads. 
-- *Slide End* --

-- *Slide* --
### Part 2: Preparation
*  The first step in any OpenMP program ought to be identification of the regions of code that could be executed concurrently or in parallel and then applying appropriate directives.
* OpenMP compiler directives must begin with a sentinel (Fortran) or pragma (C). All compiler directives have the basic form of: `sentinel/pragma directive-name clauses`
-- *Slide End* --

-- *Slide* --
### Part 2: Pragma/Sentinels
* The directory `/usr/local/common/OpenMP` has a Fortran and C hello world example. After launching an interactive job, these can be compiled and run with `gcc -fopenmp helloomp.c -o helloompc` or `gfortran -fopenmp helloomp.f90 -o helloompf`, `export OMP_NUM_THREADS=8`, and `./helloompc` or `./helloompf`.
* These give simple examples of the use of pragma/sentinels and threading.
-- *Slide End* --

-- *Slide* --
### Part 2: Variables 
* The examples `sharedhello.c` and `sharedhello.f90` illustrate two further aspects. Firstly, that the value of variables inside a function can be different to those outside it, and secondly the number of threads that a function uses can be set.
-- *Slide End* --

-- *Slide* --
### Part 2: ICVs 
* An official OpenMP publication contains an absolutely superb example of internal control variables and their interactions with runtime library routines (`icv1.f90` and `icv1.c`). 
* Four ICV's - nest-var, mex-active-levels-var, dyn-var, and nthreads-var - are modified by calls their respective library routines (`omp_set_nested()`, `omp_set_max_active_levels()`, `omp_set_dynamic()`, and `omp_set_num_threads()`).
-- *Slide End* --

-- *Slide* --
### Part 2: Loop Constructs
* One of the most typical applications is the parallelisation of loops. This includes a worksharing construct. Example are available at: `hello1millomp.c`, `hello1millomp.f90`
* A further variation is the SIMD loop, which enables multiple iterations concurrently by means of SIMD instructions, a particularly efficient method for multiple data tasks. This example is available at `hello1millsimd.f90`, `hello1millsimd.c`
-- *Slide End* --

-- *Slide* --
### Part 2: Loop Constructs
* The `sections` construct contains a collection of structured blocks that are distributed among the threads in the team. The examples are: `hello3versomp.c`, `hello3versomp.f90`
-- *Slide End* --

-- *Slide* --
### Part 2: Tasks and Synchronisation
* `Task` constructs allow for a thread to generate tasks that are executed according to the runtime system, immediately or delayed. Task synchronisation is carried out with the `barrier` or `taskwait` constructs. 
* An example of the task constructs are `colourless-3.f90` and `colourless-3.c`
-- *Slide End* --

-- *Slide* --
### Part 3: Message Passing
* The core principle is that many processors should be able cooperate to solve a problem by passing messages to each through a common communications network. 
* It does require additional programmer effort. Additional routines act as wrappers to existing compilers.
-- *Slide End* --

-- *Slide* --
### Part 3: The Communications World
* The basic principle behind MPI is to intiate a communications world, assign ranks to each member of that communications world, carry out the necessary tasks and close the communications world. 
* The examples `mpi-helloworld.c` and `mpi-helloworld.f90`
-- *Slide End* --

-- *Slide* --
### Part 3: Send and Receiving
* There are several routines for sending and receiving information in MPI. In each of these a number of parameters must be included, including the buffer, the rank of the sender, the rank of the receiver, a communication notice, a tag.
* If the MPI communications world is analoguous to a postal service, this information is the equivalent of addressing an envelope.
* The basic example is `mpi-sendrecv.c` and `mpi-sendrecv.f90`.
-- *Slide End* --

-- *Slide* --
### Part 3: Send and Receive Options
* `MPI_Status()` MPI_Status is not a routine, but  rather a data structure and is typically attached to an MPI_Recv() routine.
* `MPI_Ssend()` MPI_Ssend performs a synchronous-mode, blocking send. Whereas MPI_Send will not return until the program can use the send buffer,  MPI_Ssend will no return until a matching receive is posted.
-- *Slide End* --

-- *Slide* --
### Part 3: Send and Receive Options
|Send Mode | Explanation | Benefits  |Problems      |
|:---------|:------------|:----------|:-------------:|
|MPI_Send() | Standard send. May be synchronous or buffering | Flexible tradeoff; automatically uses buffer if available, but goes for synchronous if not. | Can hide deadlocks, uncertainty of type makes debugging harder. |
-- *Slide End* --

-- *Slide* --
|Send Mode | Explanation | Benefits  |Problems      |
|:---------|:------------|:----------|:-------------:|
| MPI_Ssend() | Synchronous send. Doesn't return until receive has also completed. | Safest mode, confident that message has been received. | Lower performance, especially without non-blocking. |
-- *Slide End* --

-- *Slide* --
|Send Mode | Explanation | Benefits  |Problems      |
|:---------|:------------|:----------|:-------------:|
| MPI_Bsend() | Buffered send. Copies data to buffer, program free to continue whilst message delivered later. | Good performance. Need to be aware of buffer space. | Buffer management issues. |
-- *Slide End* --

-- *Slide* --
|Send Mode | Explanation | Benefits  |Problems      |
|:---------|:------------|:----------|:-------------:|
| MPI_Rsend() | Receive send. Message must be already posted. | Slight performance increase since there's no handshake. | Risky and difficult to design. |
-- *Slide End* --

-- *Slide* --
### Part 3: Collective Communications
* MPI can also conduct collective communications.  These include MPI_Broadcast, MPI_Scatter, MPI_Gather, MPI_Reduce, and MPI_Allreduce. 
* MPI_Bcast Broadcasts a message from the process with rank "root" to all other processes of the communicator, including itself. It is significantly more prefereable than using a loop.
-- *Slide End* --

-- *Slide* --
### Part 3: Collective Communications
* MPI_Scatter sends data from one task to all tasks in a group; the inverse operation of MPI_Gather. The outcome is as if the root executed n send operations and each process executed a receive. MPI_Scatterv scatters a buffer in parts to all tasks in a group.
-- *Slide End* --

-- *Slide* --
<img src="https://raw.githubusercontent.com/UoM-ResPlat-DevOps/SpartanParallel/master/Images/scatter.png" />
<img src="https://raw.githubusercontent.com/UoM-ResPlat-DevOps/SpartanParallel/master/Images/gather.png" />
-- *Slide End* --

-- *Slide* --
### Part 3: Reductions
* MPI_Reduce performs a reduce operation (such as sum, max, logical AND, etc.) across all the members of a communication group.
* MPI_Allreduce conducts the same operation but returns the reduced result to all processors.
-- *Slide End* --

-- *Slide* --
### Part 3: Reductions
* The general principle in Reduce and All Reduce is the idea of reducing a set of numbers to a small set via a function. If you have a set of numbers (e.g., [1,2,3,4,5]) a reduce function (e.g., sum) can convert that set to a reduced set (e.g., 15). MPI_Reduce takes in an array of values as that set and outputs the result to the root process. MPI_AllReduce outputs the result to all processes.
* Examples; `mpi-particle.f90` `mpi-particle.f90`
-- *Slide End* --

-- *Slide* --
### Part 3: Reductions
<img src="https://raw.githubusercontent.com/UoM-ResPlat-DevOps/SpartanParallel/master/Images/reduce.png" /> 
-- *Slide End* --

-- *Slide* --
### Part 3: Reductions
<img src="https://raw.githubusercontent.com/UoM-ResPlat-DevOps/SpartanParallel/master/Images/allreduce.png" />
-- *Slide End* --

-- *Slide* --
### Part 3: Reduction Operators
| MPI_Name  | Function |
|:----------|:---------|
| MPI_MAX   | Maximum  |
| MPI_MIN   | Minimum  |
| MPI_SUM   | Sum      |
| MPI_PROD  | Product  |
| MPI_LAND  | Logical AND |
-- *Slide End* --

-- *Slide* --
### Part 3: Reduction Operators
| MPI_Name  | Function |
|:----------|:---------|
| MPI_BAND  | Bitwise AND |
| MPI_LOR   | Logical OR  |
| MPI_BOR   | Bitwise OR |
| MPI_LXOR  | Logical exclusive OR |
| MPI_BXOR  | Bitwise exclusive OR |
| MPI_MAXLOC | Maximum and location |
| MPI_MINLOC | Miniumun and location|
-- *Slide End* --

-- *Slide* --
### Part 4: Common Mistakes
* Syntax errors (e.g., missing or wrong terminators, wrong qutotes)
* Compiler can catch these.
* Semantic errors (e.g., crossing array bounds, wrong scope, memory leaks)
* Compiler won't catch these - means unexpected behaviour.
-- *Slide End* --

-- *Slide* --
### Part 4: Parallel Code
* Race conditions. 
* Deadlocks and livelocks.
* Start with working serial code - then incrementally make parallel.
* Basic debugging examples at `/usr/local/common/Debug`.
-- *Slide End* --

-- *Slide* --
### Part 4: Valgrind
* Valgrind is a debugging suite that automatically detects many memory management and threading bugs. 
* Typically built for serial applications, it can also be built with mpicc wrappers for GCC and Intel.
* Use the same compiler used in both the build and the Valgrind test. Turn on debgugging information at compilation.
* `mpicc -g mpi-debug.c -o mpi-debug` or `mpif90 -g mpi.debug.f90 -o mpi-debug` then `mpiexec -np 2 valgrind ./mpi-sendrec 2> valgrind.out`
-- *Slide End* --

-- *Slide* --
### Part 4: GDB
* GDB, the GNU Project debugger, allows you to see what happens to a program while it executes.
* Stepwise operation on code.
* `module load GDB`, `mpiexec -np 2 gdb --exec=mpi-debug --command=gdb.cmd`
* Attach to individual processes and stepwise. 
* Add `printf("PID %d on %s ready for attach\n", getpid(), hostname);`, then `mpiexec -np 2 mpi-debug` and `gdb -p $PID` 
-- *Slide End* --

### Part 4: Gprof
* Gprof, the GNU profiler, provides a flat profile (total execution time in each function) and and the call graph, which shows who called a function (parent) and who it called (child subroutines).
* Instrumention code is inserted with the `-pg` option at compilation. The `gprof` tool can be run against the executatble and output. e.g.,
* `gcc -Wall -pg test_gprof.c test_gprof_new.c -o test_gprof`, `./test_grof`, then `gprof test_gprof gmon.out > analysis.txt`


-- *Slide* --
### Part 4: PDT and TAU
* TAU (Tuning and Analysis Utilities) is a portable profiling and tracing toolkit.
* Parallel Performance Issues include the following: Coverage - % of the code that is parallel., Granularity - Amount of work in each section
Load Balancing., Locality - Communication structure., Synchronization - Locking latencies
* Load with `pprof` and `paraprof`
-- *Slide End* --

-- *Slide* --
<img src="https://raw.githubusercontent.com/UoM-ResPlat-DevOps/SpartanParallel/master/Images/hypnotoad.png" />
-- *Slide End* --
