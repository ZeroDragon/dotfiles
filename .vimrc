call plug#begin()
Plug 'dense-analysis/ale' "              Lintern
Plug 'digitaltoad/vim-pug' "             Pug Support
Plug 'elixir-editors/vim-elixir' "       Elixir Support
Plug 'posva/vim-vue' "                   Vue support
Plug 'leafgarland/typescript-vim' "      Typescrpt Support
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fzf
Plug 'junegunn/fzf.vim' "                Fzf for vim
Plug 'airblade/vim-gitgutter' "          Git in gutter
Plug 'itchyny/lightline.vim' "           Lighline (eyecandy)
Plug 'moll/vim-bbye' "                   Better Buffer control
Plug 'ap/vim-buftabline' "               Buffers as tabs (eyecandy)
Plug 'zerodragon/onehalfdark' "          Color Theme
Plug 'vimwiki/vimwiki' "                 Wiki for notes and stuff
Plug 'terryma/vim-multiple-cursors' "    Multiple cursors
Plug 'ap/vim-css-color' "                Display CSS hex codes as colors
Plug 'preservim/nerdtree' "              File tree display
Plug 'preservim/nerdcommenter' "         Comments for different languages
call plug#end()

" Enable colorscheme and true colors
colorscheme onehalfdark
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" NERDTree custom actions
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDTree colors
function! NERDTreeHighlightFile(extension, fg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' guibg=NONE guifg='. a:fg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('pug', '#AE403F')
call NERDTreeHighlightFile('md', '#689FB6')
call NERDTreeHighlightFile('yml', '#F09F17')
call NERDTreeHighlightFile('config', '#666666')
call NERDTreeHighlightFile('json', '#D4843E')
call NERDTreeHighlightFile('html', '#AE403F')
call NERDTreeHighlightFile('sass', '#689FB6')
call NERDTreeHighlightFile('css', '#689FB6')
call NERDTreeHighlightFile('js', '#F16529')
call NERDTreeHighlightFile('php', '#834F79')
call NERDTreeHighlightFile('Dockerfile', '#44788E')
call NERDTreeHighlightFile('vue', '#42B883')

" Editor color settings
highlight TabLineFill guibg=#1e1f2a ctermbg=236
highlight Normal guibg=NONE ctermbg=NONE
highlight LineNr guibg=NONE ctermbg=NONE
highlight SignColumn guibg=NONE ctermbg=NONE
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow
highlight ColorColumn guibg=#1e1f2a ctermbg=236
highlight EndOfBuffer guifg=#000000

" Various plugin configuration
let g:multi_cursor_use_default_mapping   = 0
let g:NERDTreeShowHidden                 = 1
let g:NERDTreeWinSize                    = 19
let g:NERDTreeWinPos                     = "right"
let g:NERDTreeIgnore                     = ['^node_modules$','^.git$']
let g:NERDTreeMinimalUI                  = 1
let g:gitgutter_async                    = 0
let g:lightline                          = {'colorscheme': 'onehalfdark'}
let g:NERDTreeDirArrowExpandable         = '►'
let g:NERDTreeDirArrowCollapsible        = '▼'
let g:ale_completion_tsserver_autoimport = 1
let g:vimwiki_list                       = [{'path': '~/vimwiki/', 'syntax': 'markdown'}]
let g:NERDCreateDefaultMappings          = 0
let g:multi_cursor_next_key              = '<C-d>'
let g:multi_cursor_start_word_key        = '<C-d>'
let g:multi_cursor_quit_key              = '<Esc>'
let g:ft                                 = ''

" Hack to migrate yank to windows clipboard
let s:clip = '/c/Windows/System32/clip.exe' 
if executable(s:clip)
  augroup WSLYank
    autocmd!
    autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
  augroup END
end

" NERDComenter support for *.vue files
function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction

function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction

" Maps to make vim more like sublime/vscode hotkeys
map <silent> <C-b> :NERDTreeToggle<CR>
imap <silent> <C-b> <Esc>:NERDTreeToggle<CR>
map <Space> i
nmap 1 <Plug>BufTabLine.Go(1)
nmap 2 <Plug>BufTabLine.Go(2)
nmap 3 <Plug>BufTabLine.Go(3)
nmap 4 <Plug>BufTabLine.Go(4)
nmap 5 <Plug>BufTabLine.Go(5)
map <C-n> :bnext<CR>
map <C-p> :Files<CR>
map <C-f> :Ag<CR>
map <C-q> :qa<CR>
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>
vmap <C-_> <plug>NERDCommenterToggle
nmap <C-_> <plug>NERDCommenterToggle
vmap <C-?> <plug>NERDCommenterSexy
inoremap " ""<left>
inoremap ' ''<left>
inoremap ` ``<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left><space><left><space>
inoremap < <><left>
nnoremap <silent> <leader>q :Bdelete<CR>
nnoremap <silent> <leader>n :set relativenumber!<CR>
nnoremap <silent> <leader><backspace> :set nowrap!<CR>
command! Q :q
nnoremap <c-z> :u<CR>
inoremap <c-z> <Esc>:u<CR>i

" Custom settings
set tabstop=2
set shiftwidth=2
set expandtab
set syntax=on
set mouse=a
set showmatch
set autoindent
set smartindent
set number
set smarttab
set noswapfile
set t_Co=256
set laststatus=2
set noshowmode
set list lcs=trail:·,space:·,tab:-→
set colorcolumn=80,100
set ttyfast
set lazyredraw
set ttyscroll=3
set regexpengine=1
set nocompatible
set nowrap
set encoding=UTF-8
set splitbelow
set splitright
set foldmethod=indent
set foldlevelstart=80
filetype plugin on

