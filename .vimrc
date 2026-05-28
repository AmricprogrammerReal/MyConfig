" ============================================================================
" Pure-Vim LÖVE2D Config (Lightline Fix + Ctrl+Space Completion)
" ============================================================================

" --- General Settings ---
set number                  " Show line numbers
set relativenumber          " Relative line numbers for fast navigation
set syntax=on               " Enable syntax highlighting
set mouse=a                 " Enable mouse support
set clipboard=unnamedplus   " Use system clipboard
set noswapfile              " No annoying swap files
set nobackup
set encoding=utf-8

" --- THE LIGHTLINE FIX ---
set laststatus=2            " ALWAYS show statusline (Forces Lightline to appear)

" --- Tabs & Indentation ---
set tabstop=4
set shiftwidth=4
set expandtab               " Convert tabs to spaces
set autoindent
set smartindent

" --- Pure Vim Auto-Completion Settings (Clean & No Noise) ---
set wildmenu
set wildmode=longest:full,full
" noinsert+noselect stops Vim from pushing text into your line automatically
set completeopt=menuone,noinsert,noselect 
set shortmess+=c            " Hide the annoying 'match 1 of 2' completion logs

" NO DUPLICATES: Scan only current file (.), open windows (w), and loaded buffers (b)
" Dropping tags (t) and unloaded buffers (u) gets rid of duplicate spam.
set complete=.,w,b

" --- UI Styles ---
set termguicolors
set background=dark

" ============================================================================
" Plugins (Automated Installation)
" ============================================================================
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'       " Classic Gruvbox Theme
Plug 'itchyny/lightline.vim' " Ultra-lightweight Statusbar
Plug 'preservim/nerdtree'    " Minimal File Explorer
call plug#end()

" --- Theme & Lightline Setup ---
colorscheme gruvbox
let g:lightline = { 'colorscheme': 'gruvbox' }
" --- Theme & Lightline Setup ---
colorscheme gruvbox
let g:lightline = { 'colorscheme': 'gruvbox' }

" --- Make Vim Transparent ---
" This strips the solid background colors forced by the theme
highlight Normal guibg=NONE ctermbg=NONE
highlight LineNr guibg=NONE ctermbg=NONE
highlight SignColumn guibg=NONE ctermbg=NONE
highlight EndOfBuffer guibg=NONE ctermbg=NONE
" ============================================================================
" Keybindings, Brackets, & Custom Completion
" ============================================================================

" 1. File Explorer Toggle (Press Tab in normal mode)
nnoremap <Tab> :NERDTreeToggle<CR>

" 2. Run LÖVE2D Game (Press F5 to save and launch game instantly)
autocmd FileType lua nnoremap <F5> :w<CR>:silent !love . &<CR>:redraw!<CR>

" 3. Native Auto-Closing Brackets & Quotes
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap " ""<Left>
inoremap ' ''<Left>

" 4. Perfect Ctrl + Space Completion
" We map both <C-Space> and <C-@> because terminal emulators send <C-@> for Ctrl+Space.
inoremap <C-Space> <C-x><C-n>
inoremap <C-@> <C-x><C-n>

" While the completion menu is open, use Tab and Shift+Tab to walk through it.
" If the menu is closed, Tab behaves exactly like a normal tab key.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
