" 设置 tab 默认4个空格
set ts=4
set expandtab
set autoindent

" 设置语法高亮
syntax on

" 设定配色方案
"colorscheme molokai  没有配色方案 molokai

" 显示行号
set number

" 开启时使用只能自动缩进
set smartindent

" 突出显示当前行
set cursorline

" 打开状态栏标尺
set ruler

" 设定<<和>>命令移动时宽度为4
set shiftwidth=4

" 使得按退格键时可以一次删掉4个空格
set softtabstop=4


" 启动时加载当前工作目录中的vim配置文件


" transfer/read and write one block of text between vim sessions
" Usage:
" `from' session:
" ma
" move to end-of-block
" xw
"
" `to' session:
" move to where I want block inserted
" xr
"
if has("unix")
  nmap xr :r $HOME/.vimxfer<CR>
  nmap xw :'a,.w! $HOME/.vimxfer<CR>
  vmap xr c<esc>:r $HOME/.vimxfer<CR>
  vmap xw :w! $HOME/.vimxfer<CR>
else
  nmap xr :r c:/.vimxfer<CR>
  nmap xw :'a,.w! c:/.vimxfer<CR>
  vmap xr c<esc>:r c:/.vimxfer<cr>
  vmap xw :w! c:/.vimxfer<CR>
endif
