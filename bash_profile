# Add aliases for commonly used servers.
alias athena='ssh btjones@athena.dialup.mit.edu'
alias delmar='ssh bjones@delmar'
alias delmarx='ssh -X bjones@delmar'
alias gulf='ssh bjones@gulf'
alias gulfx='ssh -X bjones@gulf'
alias kenny='ssh bjones@kenny'
alias kennyx='ssh -X bjones@kenny'
alias scylla='ssh bjones@scylla'
alias scyllax='ssh -X bjones@scylla'

# Set up TeX Live.
export INFOPATH=$INFOPATH:/usr/local/texlive/2015/texmf-dist/doc/info
export MANPATH=$MANPATH:/usr/local/texlive/2015/texmf-dist/doc/man
export PATH=$PATH:/usr/local/texlive/2015/bin/x86_64-darwin

# Set the paths to Homebrew installed software. These should be used before
# software that came with the system.
export PATH=/usr/local/bin:$PATH

# Add the bin directory in the home folder for custom scripts and software.
export PATH=$HOME/bin:$PATH

# Setup virtualenvwrapper for Python.
source /usr/local/bin/virtualenvwrapper.sh

# Add the paths for the CUDA toolkit.
export PATH=/Developer/NVIDIA/CUDA-7.0/bin:$PATH
export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-7.0/lib:$DYLD_LIBRARY_PATH

# Add aliases for programs. Some are specific to OS X, others are applicable to
# Linux as well.
alias emacs='emacs -nw'
if [ `uname` = "Darwin" ]
then
    alias itunes='open -a /Applications/iTunes.app'
    alias mathematica='open -a /Applications/Mathematica.app'
    alias spotify='open -a /Applications/Spotify.app'
fi

# Enable color.
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
