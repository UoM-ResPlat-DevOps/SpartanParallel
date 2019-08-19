program hello
	implicit none
        include "omp_lib.h"
	character(len=16) :: greetings 
	integer :: a
	greetings = "Hello World!" 
	
	!$omp parallel do
	! Hello World, one million times
	do a = 1, 1000000
	print *, greetings   
	end do
	!$omp end parallel do
	
end program hello

