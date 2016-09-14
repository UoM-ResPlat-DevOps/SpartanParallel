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
### Part 1: Processors, Cores, and Threads
* A processor is a physical device that accepts data as input and provides results as output. A uniprocessor system has one such general purpose device. 
* A unicore processor carries out the usual functions of a CPU, according to the instruction set. A multicore processor has independent central processing units ('cores') integrated a single integrated circuit die or a single chip package.
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
### Shared and Distributed Memory
* In a  multiprocessor computer system memory can either be distributed or shared. Memory coherence is an issue is shared memory environments.
* HPC Clusters use memory distributed between compute nodes and shared within compute nodes.
* Operating systems like Plan 9 from Bell Labs creates a network function as a single collection of system resources.
* OpenMP uses shared memory parallelism; MPI uses distributed memory parallelism. The latter can cross compute nodes.
-- *Slide End* --

-- *Slide* --
### Speedup and Locks
* The speedup of parallelism can be measured: Speedup (p) = Time (serial)/ Time (parallel). Ideal (linear) speedup is S(p) = p.
* Correctness requires requires synchronisation (locking). Synchronisation and atomic operations causes loss of performance, communication latency. 
-- *Slide End* --

-- *Slide* --
### Deadlocks and Livelocks
* "When two trains approach each other at a crossing, both shall come to a full stop and neither shall start up again until the other has gone." (apocryphal Kansas railway statute)
* "When two people approach each other in a crowded corridor, both shall move out of the way of the other, and shall continue to move until they have an open path for progress" (Polite Persons in a Corridor Problem)
-- *Slide End* --

### Amdahl's Law 
-- *Slide* --
* Because some of the task is in serial, there is a limit to the speedup based on the time that is required for the sequential task - no matter how many processors are thrown at the problem.

-- *Slide End* --

### Gustafson-Barsis Law


