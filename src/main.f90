program Main
!This is the main program for the model

   use params
   use model_vars

   implicit none

   integer :: i   !iterating variable

   write(6,*) "Loaded Parameters and Variables ...."

   call init
   write(6,*) 'Data initialized! Start Calculating ....'

   do i = 2, nt
    
      call rk4(i-1)
       write(6,*) 'Calculations done for timestep t= ',i-1,' of ', nt-1
 
   end do

   write(6,*) 'Done calculation! Saving data !.....'
   call data_saver
   write(6,*)'All data saved. Exiting ...'

end program main
