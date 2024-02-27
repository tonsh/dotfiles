#!/bin/bash

DOTFILES_DIR=$HOME/.dotfiles
BACKUP_DIR=$DOTFILES_DIR/backup

# 重置 .zshrc 文件
function reset() {
  echo "Resetting .zshrc..."

  # 检查备份 .zshrc 文件是否为空
  if [ ! -s $BACKUP_DIR/.zshrc ]; then
    # TODO 删除原文件中的 Dotfiles 注释间的内容，写入备份文件
    echo "$BACKUP_DIR/.zshrc file is empty or does not exist."
    exit
  fi

  cat $BACKUP_DIR/.zshrc > $HOME/.zshrc
  echo “.zshrc has been reset.”
}

# 备份 .zshrc 文件
function backup() {
  # 检查 .zshrc 原文件是否为空
  if [ ! -s $HOME/.zshrc ]; then
    echo "$HOME/.zshrc file is empty or does not exist."
    exit
  fi

  # 创建备份目录
  if [ ! -d $BACKUP_DIR ]; then
    echo "Creating backup directory..."
    mkdir -p $BACKUP_DIR
  fi

  # 备份 .zshrc 文件
  if [ ! -f $BACKUP_DIR/.zshrc ]; then
    cat $HOME/.zshrc > $BACKUP_DIR/.zshrc
  fi
}

# 重写 .zshrc 文件
function rewrite() {
  echo "Rewriting .zshrc..."

  # 重写前先备份原文件
  echo "Backing up .zshrc..."
  backup
  
  cat $BACKUP_DIR/.zshrc shell/.aliases > $HOME/.zshrc
  source $HOME/.zshrc
  echo ".zshrc has been rewritten."
}

# 如果没有参数，重写 .zshrc 文件
if [ $# -eq 0 ]; then
  rewrite
fi

# 定义长选项
longopts="reset,rewrite"
parsed_options=$(getopt -n "$0" -o "" -l "$longopts" -- "$@")

# 检查 getopt 的退出状态
if [ $? -ne 0 ]; then
    exit 1
fi

while true; do
  case "$1" in
    --reset)
      reset
      shift
      ;;
    --rewrite)
      rewrite
      shift
      ;;
    --)
      shift
      break
      ;;
    *)
      break
      ;;
  esac
done
