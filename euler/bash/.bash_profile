# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

export TERM='xterm-256color'
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

#### Old module stack loading commands
# module load new hdf5/1.8.13 gcc/4.8.2 python/3.6.0 open_mpi/1.6.5 qt/4.8.4 boost/1.55.0 gmp/5.1.3 mpfr/3.1.2 openfoam/2.4.0 matlab/R2018a mesa/12.0.6 paraview/5.6.0
# module load new gcc/4.8.2 qt/4.8.4 python/3.6.0 open_mpi/1.6.5 openfoam/4.1 matlab/R2020a mesa/12.0.6 tmux/2.5

#### New module stack loading commands
module load gcc/4.8.5 openmpi/3.0.1     # Load modules
module load python/3.7.4 # Load python that works with gcc/4.8.5
module load openfoam-com/1906 paraview/5.9.1 gmsh/4.4.1 matlab/R2022a
module load vim/8.2.1201 tmux/3.2a curl/7.73.0 git/2.31.1 cmake/3.25.0
