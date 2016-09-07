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
* Datasets are becoming larger. Effective clock speeds have flattened.






-- *Slide End* --
