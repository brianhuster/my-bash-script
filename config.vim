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

" How to exit terminal
tnoremap <Esc> <C-\><C-n> 

" In normal mode, type \a to turn on/off autosave
vim.api.nvim_set_keymap("n", "<leader>a", ":ASToggle<CR>", {})

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
