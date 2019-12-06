# what & why?

* implement a lwm2m client using mbed-coap
* create a cmake based toolchain
* using vim as "IDE"

# requirements

## vim plugins

~~~
Plugin 'VundleVim/Vundle.vim'

"YouCompleteMe is a fast, as-you-type, fuzzy search code completion engine
" for Vim
Plugin 'valloric/youcompleteme'

" NERDTree is a filesystem explorer for Vim
Plugin 'scrooloose/nerdtree'

" Full path fuzzy file buffer, mru, tag, ... finder for vim
 Plugin 'ctrlpvim/ctrlp.vim'
~~~

after that install the plugins
~~~
vim +PluginInstall +qall
~~~

## ctags

~~~
brew install ctags
alias ctags="`brew --prefix`/bin/ctags"
alias ctags >> ~/.bashrc
~~~

# credits

# license

[Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0.txt)

