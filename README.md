# what & why?

* implement a lwm2m client using mbed-coap
* create a cmake based toolchain
* using vim as "IDE"

# requirements

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
brew install cmake macvim
cd .vim/bundle/YouCompleteMe
./install.py --clang-completer
~~~

## ctags

~~~
brew install ctags
alias ctags="`brew --prefix`/bin/ctags"
alias ctags >> ~/.bashrc
~~~

# IDE Features

start with
~~~
vim .
~~~

<F2> open Filesystem (NERDTreeToggle)
<F5> run Programm
<F7> Build (make)
<F12> GoToDefinition

# credits

# license

[Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0.txt)

