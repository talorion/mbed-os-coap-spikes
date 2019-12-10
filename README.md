# what & why?

* implement a lwm2m client using mbed-coap
* create a cmake based toolchain
* using vim as "IDE"

# requirements

## prerequisites

mac os
~~~
brew install cmake macvim ctags
alias ctags="`brew --prefix`/bin/ctags"
alias ctags >> ~/.bashrc
~~~

ubuntu
~~~
sudo apt install build-essential cmake python3-dev exuberant-ctags
~~~

## vim basic setup

put following lines in ~/.vimrc
~~~
" First of all, you want to enable exrc option. This option forces Vim to source .vimrc file if it present in working directory, thus providing a place to store project-specific configuration.
set exrc
"Since Vim will source .vimrc from any directory you run Vim from, this is a potential security hole; so, you should consider setting secure option. This option will restrict usage of some commands in non-default .vimrc files; commands that write to file or execute shell commands are not allowed and map commands are displayed.
set secure
~~~

## vim plugins

download vundle
~~~
git clone https://github.com/VundleVim/Vundle.vim.git .vim/bundle/Vundle.vim
~~~

install the plugins
~~~
vim +PluginInstall +qall
~~~

build youcompleteme
~~~
cd .vim/bundle/YouCompleteMe
./install.py --clang-completer
~~~

## Generate compilation database when using mbed os

~~~
mbed export -i cmake_gcc_arm
~~~

edit file CMakeLists.txt
~~~
#########################################
## generate compile database
#########################################
SET(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# uncomment below to have a verbose build process
SET(CMAKE_VERBOSE_MAKEFILE ON)
~~~

run cmake
~~~
cmake .
~~~

# IDE Features

start in root dir of repository with
~~~
vim .
~~~

* automatic generate tags when saving a c/c++ file
* <kbd>F2</kbd> open Filesystem (NERDTreeToggle)
* <kbd>F4</kbd> toggle header source
* <kbd>F5</kbd> run Programm
* <kbd>F7</kbd> Build (make)
* <kbd>F9</kbd> FixIt (YCM FixIt)
* <kbd>F12</kbd>  GoToDefinition
* <kbd>LEADER</kbd>+<kbd>S</kbd>+ save all files
* <kbd>LEADER</kbd>+<kbd>T</kbd> run all tests(ctest)

# TODO

* Debug local
* Debug embedded
* Toggle comment

# license

[Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0.txt)

