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

# Generate compilation database

~~~
mbed export -i cmake_gcc_arm
~~~

edit file CMakeLists.txt
~~~
# force cmake compilers
SET(CMAKE_ASM_COMPILER    "/opt/gcc-arm-none-eabi-9-2019-q4-major/bin/arm-none-eabi-gcc")
SET(CMAKE_C_COMPILER      "/opt/gcc-arm-none-eabi-9-2019-q4-major/bin/arm-none-eabi-gcc")
SET(CMAKE_CXX_COMPILER    "/opt/gcc-arm-none-eabi-9-2019-q4-major/bin/arm-none-eabi-g++")
SET(ELF2BIN               "/opt/gcc-arm-none-eabi-9-2019-q4-major/bin/arm-none-eabi-objcopy")
include_directories(
BEFORE
SYSTEM
/opt/gcc-arm-none-eabi-9-2019-q4-major/arm-none-eabi/include
)

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
* <kbd>TAB</kbd> next Tab

# TESTING

all test must be located under ls mbed-os-coap-client/UNITTESTS/<testgroup>/<testname>
and contain following files
test_<testname>.cpp
unittest.cmake

prepare tests
~~~
cmake -DCOMPILE_TESTS=ON .
~~~

run test
~~~
<kbd>LEADER</kbd>+<kbd>T</kbd> in IDE
or
ctest outside the IDE
~~~

# TODO

* Debug local
* Debug embedded
* Toggle comment

# license

[Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0.txt)

