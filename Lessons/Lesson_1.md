-- *Slide* --
### Part 0: Welcome! 
* Lev Lafayette has worked as an HPC sysadmin for since 2007, first at the Victorian Partnership for Advanced Computing, now at the University of Melbourne. Has worked in IT since 1999.
* Has taught approximately 175 day-long classes at 17 different research institutions across Australia since 2012.
* Collects degrees for fun.
* Stalk him at: http://levlafayette.com/ or https://www.linkedin.com/in/levlafayette
-- *Slide End* --

-- *Slide* --
### Part 0: Welcome!
* David Perry is an engineer and scientist, and completed his PhD "Temporal Processing in the Deafened Auditory Cortex" in 2003. He's since worked in bionics, climate change, renewable energy, agriculture and the internet of things.
* Stalk him at Twitter @dwjperry
-- *Slide End* --

-- *Slide* --
### Part 0: Goals for today
* Part 1: Physical Architecture and Parallel Limits
* Part 2: Job Submissions and Parallel Extensions
* Part 3: Programming in Parallel with OpenMP
* Part 4: Programming in Parallel with OpenMPI
-- *Slide End* --

-- *Slide* --
### Part 0: Slide Respository
* A copy of the slides and same code is available at: https://github.com/UoM-ResPlat-DevOps/SpartanParallel
-- *Slide End* --

-- *Slide* --
### Part 1: Flynn's Taxonomy
* The type parallelisation can be determined by Flynn's taxonomy of computer Systems (1966), where each process is considered as the execution of a pool of instructions (instruction stream) on a pool of data (data stream), and with these streams are single or multiple. 
* Four basic possibilities: Single Instruction Stream, Single Data Stream (SISD), Single Instruction Stream, Multiple Data Streams (SIMD), Multiple Instruction Streams, Single Data Stream (MISD), Multiple Instruction Streams, Multiple Data Streams (MIMD)
-- *Slide End* --

-- *Slide* --
### Part 1: Processors and Cores
* A processor is a physical device that accepts data as input and provides results as output. A uniprocessor system has one such general purpose device. 
* A unicore processor carries out the usual functions of a CPU, according to the instruction set. A multicore processor has independent central processing units ('cores') integrated a single integrated circuit die or a single chip package.
-- *Slide End* --

-- *Slide* --
### Part I: Threads
* A process provides the resources to execute an instance of a program (such as address space, the code, handles to system objects, a process identifier etc).  An execution thread is the smallest processing unit in an operating system, contained inside a process. 
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
* Symmetric multiprocessing is well established technology (IBM System/360, 1964)
* Tilera have developed 64 core (TILE64, 2007), and then a 100 core processor (2009). Founder Dr. Anant Agarwal leads the MIT Angstron Project to develop a 1,000 core processor (2012).
-- *Slide End* --

-- *Slide* --
### Part I: Memory Distribution
* In a  multiprocessor computer system memory can either be distributed or shared. Memory coherence is an issue is shared memory environments.
* HPC Clusters use memory distributed between compute nodes and shared within compute nodes.
* Operating systems like Plan 9 from Bell Labs creates a network function as a single collection of system resources.
* OpenMP uses shared memory parallelism; MPI uses distributed memory parallelism. The latter can cross compute nodes.
-- *Slide End* --

-- *Slide* --
### Part I: Speedup and Locks
* The speedup of parallelism can be measured: Speedup (p) = Time (serial)/ Time (parallel). Ideal (linear) speedup is S(p) = p.
* Correctness requires requires synchronisation (locking). Synchronisation and atomic operations causes loss of performance, communication latency. 
-- *Slide End* --

-- *Slide* --
### Part I: Deadlocks and Livelocks
* "When two trains approach each other at a crossing, both shall come to a full stop and neither shall start up again until the other has gone." (apocryphal Kansas railway statute)
* "When two people approach each other in a crowded corridor, both shall move out of the way of the other, and shall continue to move until they have an open path for progress" (Polite Persons in a Corridor Problem)
-- *Slide End* --

-- *Slide* --
### Part I: Amdahl's Law 
* Because some of the task is in serial, there is a limit to the speedup based on the time that is required for the sequential task - no matter how many processors are thrown at the problem.
<img src="https://raw.githubusercontent.com/UoM-ResPlat-DevOps/SpartanParallel/master/Images/amdhal.png" />
-- *Slide End* --

-- *Slide* --
### Part I: Gustafson-Barsis Law
* Gene Amdahl proposed his law in 1967; it wasn't until over twenty years later in 1988 that an alternative by John L. Gustafson and Edwin H. Barsis was offered. 
* Amadahl's Law assumed a computation problem of fixed data set size. Programmers tend to set the size of their computational problems according to the available equipment; therefore as faster and more parallel equipment becomes available, larger problems can be solved.
-- *Slide End* --

-- *Slide* --
### Part II: Data Parallel Jobs
* Data parallel jobs are the simplest type of parallelism - and the most common.
* Single threaded jobs (such as MATLAB, R etc) can be launched across multiple datasets by using job arrays.
* Example job arrays in Slurm at: `/usr/local/common/array`
* Note that the index values and step size can be varied.
-- *Slide End* --

-- *Slide* --
### Part II: Task Parallel Jobs
* Task parallel jobs require a communications systems whether it is through threads (OpenMP) or by message passing (OpenMPI).
* Thread-based parallelism requires that the tasks occur within the same computer node (shared memory). Message passing can distribute information between compute nodes (distributed memory).
* In Slurm scripts on Spartan MPI programmes will need to set the paths to the OpenMPI wrappers (`module avail OpenMPI`). Some simple examples are available at: `/usr/local/common/OpenMPI`
-- *Slide End* --

-- *Slide* --
### Part II: Memory
<img src="https://raw.githubusercontent.com/UoM-ResPlat-DevOps/SpartanParallel/master/Images/distmemory.png" />
-- *Slide End* --

-- *Slide* --
### Part II: Task Parallel NAMD
* A number of applications are already designed to be task parallel; NAMD (a molecullar modelling progam) is one. An example slurm script is located at `/usr/local/common/NAMD`. This script can be run and can be visualised locally with VMD.
-- *Slide End* --


-- *Slide* --
### Part II: Task Parallel Python
* Python is, by default, a single-threaded programming language. However we have added the mpi4py package to give it parallel capabilites. Example scripts are located at `/usr/local/common/Python`. In particular the file `twitter_search_541635.py` invokes the mpi4py library.
* A number of examples are available at `/usr/local/common/Python/mpi4py-examples-master`
-- *Slide End* --

-- *Slide* --
### Part II: Task Parallel MATLAB
* MATLAB is, by default, a single-threaded program. However there is extensions which provide parallelism; MATLAB DCS and the parallel compute toolbox.
* The NeCTAR research cloud has Matlab DCS available for task parallel jobs. Note that this are subject to the same 
https://github.com/resbaz/mdcs-setup/wiki/MatLab-client-VMs-in-Nectar-%28%22the-cloud%22%29
* A very simple (and popular!) change is to turn any `for` loop into a `parfor` loop.
-- *Slide End* --

-- *Slide* --
### Part II: Coming Soon: R, Octave, and Gaussian
* R is, by default, a single-threaded program. However there is a number of extensions which provide parallelism; Rmpi, SNOW (simple network of workstations) are two examples. The parallel library is installed.
* Octave is also single-threaded, but also has parallel packages (struct, parallel, MPI).
* Gaussian has multicore capability, but UniMelb has just purchased Linda, will allows it to run mulinode as well.
-- *Slide End* --

-- *Slide* --
### Part III: Fork-Join in OpenMP and POSIX
* A fork-join approach can be used in multithreading. This is the method used by OpenMP and also with POSIX threads (pthreads). 
* A program's execution branches off in parallel threads at specified points in the program and joins and merges at a subsequent specified point, returning to serial execution.
* A master thread contains the instructions that are to be executed in parallel and executes additional worker threads that divide the task among them. 
-- *Slide End* --

-- *Slide* --
### Part III: Fork-Join
<img src="https://raw.githubusercontent.com/UoM-ResPlat-DevOps/SpartanParallel/master/Images/fork_join.png" />
* By Wikipedia user A1 - w:en:File:Fork_join.svg, CC BY 3.0, https://commons.wikimedia.org/w/index.php?curid=32004077
-- *Slide End* --

-- *Slide* --
### Part III: OpenMP Directives
* OpenMP API compiler directives and internal control variables can be added to a sequential program to invoke parallel capability. They are the absolute foundation from which a OpenMP program can be differentiated from a sequential program. 
* OpenMP directives are designed to appear as comments unless the program is explicitly commanded to be attentive to them. Compiler directives are used to initiate a parallel region, divide code among threads, distribute loops among threads, and synchronise work among threads. 
-- *Slide End* --

-- *Slide* --
### Part III: Preparation
*  The first step in any OpenMP program ought to be identification of the regions of code that could be executed concurrently or in parallel and then applying appropriate directives.
* OpenMP compiler directives must begin with a sentinel (Fortran) or pragma (C). All compiler directives have the basic form of: `sentinel/pragma directive-name clauses`
-- *Slide End* --

-- *Slide* --
### Part III: Pragma/Sentinels
* The directory `/usr/local/common/OpenMP` has a Fortran and C hello world example. After launching an interactive job, these can be compiled and run with `gcc -fopenmp helloomp.c -o helloompc` or `gfortran -fopenmp helloomp.f90 -o helloompf`, `export OMP_NUM_THREADS=16`, and `./helloompc` or `./helloompf`.
* These give simple examples of the use of pragma/sentinels and threading.
-- *Slide End* --

-- *Slide* --
### Part III: Variables and ICVs 
* The examples `sharedhello.c` and `sharedhello.f90` illustrate two further aspects. Firstly, that the value of variables inside a function can be different to those outside it, and secondly the number of threads that a function uses can be set.
* An official OpenMP publication contains an absolutely superb example of internal control variables and their interactions with runtime library routines (`icv1.f90` and `icv1.c`). 
* Four ICV's - nest-var, mex-active-levels-var, dyn-var, and nthreads-var - are modified by calls their respective library routines (`omp_set_nested()`, `omp_set_max_active_levels()`, `omp_set_dynamic()`, and `omp_set_num_threads()`).
-- *Slide End* --

-- *Slide* --
### Part III: Loop Constructs
* One of the most typical applications is the parallelisation of loops. This includes a worksharing construct. Example are available at: `hello1millomp.c`, `hello1millomp.f90`
* A further variation is the SIMD loop, which enables multiple iterations concurrently by means of SIMD instructions, a particularly efficient method for multiple data tasks. This example is available at `hello1millsimd.f90`, `hello1millsimd.c`
The `sections` construct contains a collection of structured blocks that are distributed among the threads in the team. The examples are: `hello3versomp.c`, `hello3versomp.f90`
-- *Slide End* --

-- *Slide* --
### Part III: Tasks and Synchronisation
* `Task` constructs allow for a thread to generate tasks that are executed according to the runtime system, immediately or delayed. Task synchronisation is carried out with the `barrier` or `taskwait` constructs. 
* An example of the task constructs are `colourless-3.f90` and `colourless-3.c`
-- *Slide End* --

-- *Slide* --
### Part IV: Message Passing
* The core principle is that many processors should be able cooperate to solve a problem by passing messages to each through a common communications network. 
* It does require additional programmer effort. Additional routines act as wrappers to existing compilers.
-- *Slide End* --

-- *Slide* --
### Part IV: The Communications World
* The basic principle behind MPI is to intiate a communications world, assign ranks to each member of that communications world, carry out the necessary tasks and close the communications world. 
* The examples `mpi-helloworld.c` and `mpi-helloworld.f90`
-- *Slide End* --

-- *Slide* --
### Part IV: Sending and Receiving
* There are several routines for sending and receiving information in MPI. In each of these a number of parameters must be included, including the buffer, the rank of the sender, the rank of the receiver, a communication notice, a tag.
* If the MPI communications world is analoguous to a postal service, this information is the equivalent of addressing an envelope.
* The basic example is `mpi-sendrecv.c` and `mpi-sendrecv.f90`.
-- *Slide End* --

-- *Slide* --
### Part IV: Sending and Receive Options
* `MPI_Status()` MPI_Status is not a routine, but  rather a data structure and is typically attached to an MPI_Recv() routine.
* `MPI_Ssend()` MPI_Ssend performs a synchronous-mode, blocking send. Whereas MPI_Send will not return until the program can use the send buffer,  MPI_Ssend will no return until a matching receive is posted.
-- *Slide End* --


-- *Slide* --
### Part IV: Sending and Receive Options
|Send Mode | Explanation |  Benefits |  Problems
|MPI_Send() | Standard send. May be synchronous or buffering | Flexible tradeoff; automatically uses buffer if available, but goes for synchronous if not. | Can hide deadlocks, uncertainty of type makes debugging harder. |
| MPI_Ssend() | Synchronous send. Doesn't return until receive has also completed. | Safest mode, confident that message has been received. | Lower performance, especially without non-blocking. |
| MPI_Bsend() | Buffered send. Copies data to buffer, program free to continue whilst message delivered later. | Good performance. Need to be aware of buffer space. | Buffer management issues. |
| MPI_Rsend() | Receive send. Message must be already posted or is lost. | Slight performance increase since there's no handshake. | Risky and difficult to design. |
-- *Slide End* --


-- *Slide* --
### Part IV: Sending and Receive Options
|Send Mode | Explanation | Benefits  |Problems      |
|:---------|:------------|:----------|:-------------:|
|MPI_Send() | Standard send. May be synchronous or buffering | Flexible tradeoff; automatically uses buffer if available, but goes for synchronous if not. | Can hide deadlocks, uncertainty of type makes debugging harder. |
| MPI_Ssend() | Synchronous send. Doesn't return until receive has also completed. | Safest mode, confident that message has been received. | Lower performance, especially without non-blocking. |
| MPI_Bsend() | Buffered send. Copies data to buffer, program free to continue whilst message delivered later. | Good performance. Need to be aware of buffer space. | Buffer management issues. |
| MPI_Rsend() | Receive send. Message must be already posted or is lost. | Slight performance increase since there's no handshake. | Risky and difficult to design. |
-- *Slide End* --

-- *Slide* --
### Part IV: Sending and Receive Options
* MPI can also conduct collective communications.  These include MPI_Broadcast, MPI_Scatter, MPI_Gather, MPI_Reduce, and MPI_Allreduce. 
* MPI_Bcast Broadcasts a message from the process with rank "root" to all other processes of the communicator, including itself. It is significantly more prefereable than using a loop.
-- *Slide End* --




