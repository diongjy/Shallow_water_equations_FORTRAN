! This is the parameter module for the shallow water equations

module params

   implicit none
   
   !number of points in x, y direction
   integer, parameter :: nx = 101, ny = 101

   !number of time steps
   integer, parameter :: nt = 10001

   !start and end point of x axis
   real (8), parameter :: xstart = -5.0, xend = 5.0
   
   !start and end point of y axis
   real (8), parameter :: ystart = -6.0, yend = 6.0

   !start and end point for time
   real (8), parameter :: tstart = 0.0, tend = 1000.0

   !length of the xaxis and yaxis
   real (8), parameter :: Lx = xend - xstart
   real (8), parameter :: Ly = yend - ystart

   !total of timesteps
   real (8), parameter :: Lt = tend -tstart
   
   !grid resolution, dx, dy
   real(8), parameter :: dx = Lx/float(nx-1)
   real(8), parameter :: dy = Ly/float(ny-1)

   !timestep
   real(8), parameter :: dt = Lt/float(nt-1)

   !Constants
   
   !pi
   real(8), parameter :: pi = 4.0*atan(1.0)

   !gravity
   real(8), parameter :: g = 9.8065

   !base height
   real(8), parameter :: H0 = 1.0

   !Input Parameter for model

   !rotation parameter, omega
   real(8), parameter :: omega = 1e-5
   
   !viscous drag coefficient
   real(8), parameter :: vd = 1e-3

   !Viscocity of the fluid
   real(8), parameter :: nu = 1.5e-5
  
   !perturbation
   real(8), parameter :: perturb = 0.01

   !file name 
   character (len=25), parameter :: fname ='datas_small_rotation.nc'
   

end module params



module model_vars

    use params

    implicit none
 
    !x, y and time variables
    real(8), dimension(1:nx) :: x
    real(8), dimension(1:ny) :: y
    real(8), dimension(1:nt) :: t

    !x, y, grids
    real(8), dimension(1:nx, 1:ny) :: xx, yy

    !u,v, eta
    real(8), dimension(1:nx, 1:ny, 1:nt) :: u, v, h

    !coriolis matrix
    real(8), dimension(1:nx, 1:ny) :: f





end module model_vars
