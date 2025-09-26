# this script will help you to install vim and set it quickly

#install
echo " ====================> liangji start install vim"
sudo apt-get install vim
echo " ====================> liangji finish install"

#set vimrc
echo " ====================> liangji start setting vim"
sudo cp ./vimrc /etc/vim/vimrc
echo " ====================> liangji finish setting vim"



# install some good plugin
mkdir ~/.vim

#add ctags into vim
#usage:
#ctags -R .
#找到光标的变量的定义ctrl ] 
#回到原来的位置 ctrl t/o
echo " ====================> liangji start installing vim(ctags)"
sudo apt-get install universal-ctags
whatis ctags
echo " ====================> liangji finish installing"


#set ai 
#
