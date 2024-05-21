" Initialize vim-plug
call plug#begin()

" Plugins to install
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'github/copilot.vim'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" Configure NERDTree
" open NERDTree automatically
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree
autocmd VimEnter * belowright split | terminal | resize 10

let g:NERDTreeGitStatusWithFlags = 1
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:NERDTreeGitStatusNodeColorization = 1
"let g:NERDTreeColorMapCustom = {
"\ "Staged"    : "#0ee375",  
"\ "Modified"  : "#d9bf91",  
"\ "Renamed"   : "#51C9FC",  
"\ "Untracked" : "#FCE77C",  
"\ "Unmerged"  : "#FC51E6",  
"\ "Dirty"     : "#FFBD61",  
"\ "Clean"     : "#87939A",   
"\ "Ignored"   : "#808080"   
"\ }

let g:NERDTreeIgnore = ['^node_modules$']

" Configure Coc
" Keybindings for Coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)

" Add the language packs for coc
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-css',
  \ 'coc-eslint',
  \ 'coc-prettier'
  \ ]

" Configure Copilot
" Execute this command in Neovim: :Copilot setup , and after that a code will appear and take you to github. Use that code to authenticate Copilot to your Github Account.

" Configure Airline-themes
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_statusline_ontop=0
let g:airline_theme='ayu_light'
let g:airline#extensions#tabline#formatter = 'default'

" Navigation between buffers
nnoremap <M-Right> :bn<cr>
nnoremap <M-Left> :bp<cr>
nnoremap <c-x> :bp \|bd #<cr>

" General settings
set mouse=a
set number
set hidden
set cursorline
set expandtab
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set encoding=utf8
set history=5000
set clipboard=unnamedplus
