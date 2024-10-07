# This is the Makefile for the SW Model
#
#PRogram Name
PROG = SWE.exe

#Source Folder name
VPATH = src

#Object folder
OBJDIR = objs

#Module Folder
MODDIR = mods

#Ececutable Folder
EXECDIR = exec

#Complier and Flags
FC = gfortran
FFLAGS = -c -O3 -mcmodel=medium -g -I/home/diong/software/netcdf_f/include
FLINK = -O3 -mcmodel=medium -g -L/home/diong/software/netcdf_f/lib -lnetcdff
LINKER = $(FC) -o

#Object files
OBJS = initial.o swe_rk4.o main.o saver.o parameter.o

model : $(PROG)

#Creats the model
$(PROG) : $(OBJS)
	@echo "---------------------------------"
	@echo "Creating the executable for model"
	@echo "---------------------------------"
	$(LINKER) $(PROG) $(OBJS) $(FLINK)
	mv *.o $(OBJDIR)
	mv *.mod $(MODDIR)
	mv *.exe $(EXECDIR)

%.o : %.f90
	@echo "------------------------------"
	@echo "Compiling the files $<"
	@echo "------------------------------"
	$(FC) $(FFLAGS) $<

#make clean
clean :
	@echo "------------------------------"
	@echo "Clear everything in model"
	@echo "------------------------------"
	rm -f *~ *.nc plot*.png *.exe *.o *.mod
	rm -f $(OBJDIR)/*.o $(OBJDIR)/*~
	rm -f $(MODDIR)/*.mod $(MODDIR)/*~
	rm -f $(EXECDIR)/*~ $(EXECDIR)/*.exe $(EXECDIR)/*.nc
	rm -f $(VPATH)/*~

initial.o	: initial.f90 parameter.o
swe_rk4.o	: swe_rk4.f90 parameter.o
saver.o		: saver.f90 parameter.o
main.o		: main.f90 parameter.o
parameter.o	: parameter.f90
