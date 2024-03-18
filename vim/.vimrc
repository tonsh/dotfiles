syntax on           " 语法高亮
set ruler           " 标尺信息
set autoindent      " 自动缩进
set number          " 显示行号
set cursorline      " 高亮光标所在行
set cursorcolumn    " 高亮光标所在列
set shiftwidth=4    " 自动缩进的空白长度为4个空格
set tabstop=4       " TAB 制表符的空白长度
set softtabstop=4   " 删除4个空格
set expandtab       " 将制表符转换为（4个）空格
set ic              " 搜索时忽略大小写
set hlsearch        " 高亮显示搜索结果
set nobackup        " 关闭自动备份（不生成临时文件）
set autochdir       " 自动切换目录

" 恢复文件关闭之前光标的位置
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
