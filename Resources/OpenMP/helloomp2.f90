        PROGRAM HELLO

        INTEGER NTHREADS, TID, OMP_GET_NUM_THREADS, OMP_GET_THREAD_NUM

 !     Fork a team of threads with each thread having a private TID variable
 !$OMP PARALLEL PRIVATE(THREADID)

 !     Obtain and print thread id
       TID = OMP_GET_THREAD_NUM()
       PRINT *, 'Hello World from thread = ', THREADID

 !     Only master thread does this
       IF (THREADID .EQ. 0) THEN
         NTHREADS = OMP_GET_NUM_THREADS()
         PRINT *, 'Number of threads = ', NTHREADS
       END IF

 !     All threads join master thread and disband
 !$OMP END PARALLEL

        END
