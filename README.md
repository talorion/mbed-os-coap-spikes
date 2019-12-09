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

install the plugins
~~~
vim +PluginInstall +qall
~~~

build youcompleteme
~~~
cd .vim/bundle/YouCompleteMe
./install.py --clang-completer
~~~

# IDE Features

start with
~~~
vim .
~~~

* automatic generate tags when saving a c/c++ file
* <F2> open Filesystem (NERDTreeToggle)
* <F5> run Programm
* <F7> Build (make)
* <F12> GoToDefinition

## TODO

* <F4> toggle header source
* <C-M-t> run all tests(ctest)
* <Ctrl>+s save current file
* <Ctrl>+<Shift>+s save all files


# license

[Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0.txt)

