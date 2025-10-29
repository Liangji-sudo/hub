sudo apt-get install tmux

sudo cp .tmux.conf ~/.tmux.conf

tmux source ~/.tmux.conf

#usage:
#start: tmux
#查看当前会话
#tmux ls
#
#新建一个会话
#tmux new -s first
#
#退出当前会话，后台执行
#tmux detach
#
#接入重连一个会话
#tmux attach -t first
#
#彻底杀死一个会话
#tmux kill-session -t first
#
#切换会话
#tmux switch -t second
#
#重命名会话
#tmux rename-session -t 0 new_name
#
#划分窗格
#tmux split-window
#tmux split-window -h
#
#新建窗口
#ctrl b  c
#
#上下一个窗口
#ctrl b  p
#ctrl b  n
#ctrl b  [number]
