" Loading @reu's vim
source ~/.vim/vimrc

""""""""""""""""""""""""""""
" Redefining @reu's defaults

" code smell for ruby
Bundle 'rainerborene/vim-reek'
" POWER ALL THE LINE!
set rtp+=/home/daniel/workspace/powerline/powerline/bindings/vim

" wrap lines, please
set wrap
let &showbreak = '↳ '

" list buffers on F5
nnoremap <F5> :buffers<CR>:buffer<Space>

" Redefine colorschema and fonts
if has("gui_running")
    colorscheme jellybeans
    if has("gui_gnome")
        set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 10
    endif

    if has("gui_win32") || has("gui_win32s")
        set guifont=Consolas:h12
        set enc=utf-8
    endif
else
    if $COLORTERM == 'gnome-terminal'
      colorscheme jellybeans
    endif
endif

" Fix tab for js and coffee
autocmd FileType coffee set tabstop=2|set shiftwidth=2|set expandtab|set softtabstop=2
autocmd FileType js set tabstop=2|set shiftwidth=2|set expandtab|set softtabstop=2

" Fix IndentGuides for terminal
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#252525 ctermbg=0

" Use system clipboard
set clipboard=unnamedplus

" Ignore gems and log for fuzzy find
set wildignore+=.bundle/gems/**,log/**
