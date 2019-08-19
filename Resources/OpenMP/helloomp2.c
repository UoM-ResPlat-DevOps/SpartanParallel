 #include <omp.h>

 main(int argc, char *argv[]) {

 int nthreads, threadid;

 /* Fork a team of threads with each thread having a private tid variable */
 #pragma omp parallel private(tid)
   {

   /* Obtain and print thread id */
   threadid = omp_get_thread_num();
   printf("Hello World from thread = %d\n", threadid);

   /* Only master thread does this */
   if (tid == 0) 
     {
     nthreads = omp_get_num_threads();
     printf("Number of threads = %d\n", nthreads);
     }

   }  /* All threads join master thread and terminate */

 }

