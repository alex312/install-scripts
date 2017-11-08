set nocompatible 	" 去除VI一致性, 必须添加
filetype off		" 必须添加

" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim


"===============================================================
call vundle#begin()
" 另一种选择，制定vundle安装插件的路径
" call vundle#begin('~/some/path/here')

"让vundle管理插件版本，必须
Plugin 'VundleVim/Vundle.vim'

" 以下范例用来支持不同格式的插件安装.
" 请将安装插件的命令放在vundle#begin和vundle#end之间

" Github上的插件
"Plugin 'tpope/vim-fugitive'
Plugin 'godlygeek/tabular'

" 来自 http://vim-scripts.org/vim/scripts.html的插件
" Plugin '插件名称 实际上是 Plugin 'vim-scripts/插件仓库名' 只是此处的用户名可以省略
"Plugin 'L9'

" 由Git支持但不再github上的插件仓库 Plugin 'git clone 后面的地址'
"Plugin 'git://git.wincent.com/command-t.git

" 本地的Git仓库(例如自己的插件) Plugin 'file:///本地插件仓库绝对路径'
"Plugin 'file:///home/gmarik/path/to/plugin'

" 插件在仓库的子目录中.
" 正确制定路径用以设置runtimepath. 以下列范例插件在sparkup/vim目录下
"Plugin 'rstacruz/sparkup', {rtp':'vim/'}

" 安装L9,如果已经安装过这个插件, 可以利用以下格式避免命名冲突
"Plugin 'ascenator/L9', {'name': 'newL9'}

" 你的所有插件都需要在下面这行之前
call vundle#end()		"必须
"=============================================================
filetype plugin indent on	"必须 加载vim自带和插件相应的语法和文件类型相关脚本
" 忽视插件改变缩进，可以使用以下代替
"filetype plugin on
"
" 常用命令
" :PluginList		- 列出所有已配置的插件
" :PluginInstall	- 安装插件,追加`!`用以跟新或使用 :PluginUpdate
" :PluginSearch foo 	- 搜索 foo; 追加`!` 清除本地缓存
" :PluginClean		- 清除未使用插件，需要确认;追加`!`自动批准移除未使用插件
"
" 查阅 :h vundle 获取更多细节和viki以及FaQ
" 将以自己的非插件片段放在这行之后
