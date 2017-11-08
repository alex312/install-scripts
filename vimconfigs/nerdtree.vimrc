" 打开vim时自动打开NERDTree
"autocmd vimenter * NERDTree

" 关闭vim时，如果打开的文件除了NERDTree没有其他文件时，它自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif

" 按下 F2 调出/隐藏 NERDTree
map <silent><F2> :NERDTreeToggle<CR>

" 将 NERDTree 的窗口设置在 vim 窗口的右侧(默认为左侧)
let NERDTreeWinPos="left"

" 当打开 NERDTree 窗口时, 自动显示Bookmarks
let NERDTreeShowBookmarks=1

" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1

" 是否显示隐藏文件
let NERDTreeShowHidden=1

" 设置宽度
let NERDTreeWinSize=31

" 在终端启动vim时,共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1

" 忽略以下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
