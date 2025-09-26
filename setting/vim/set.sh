# this script will help you to install vim and set it quickly

#install
echo " ====================> liangji start install vim"
sudo apt-get install vim
echo -e " ====================> liangji finish install\n\n\n"

#set vimrc
echo " ====================> liangji start setting vim"
sudo cp ./vimrc /etc/vim/vimrc
source /etc/vim/vimrc
echo -e " ====================> liangji finish setting vim \n\n\n"


# install some good plugin
mkdir ~/.vim
rm -rf ~/.vim/*

#add ctags into vim
#usage:
#ctags -R .
#找到光标的变量的定义ctrl ] 
#回到原来的位置 ctrl t/o
echo " ====================> liangji start installing vim(ctags)"
sudo apt-get install universal-ctags
whatis ctags
echo -e " ====================> liangji finish installing\n\n\n"


#add NERDTree into vim
#usage:
#:NERDTree
echo " ====================> liangji start installing vim(NERDTree)"
unzip ./nerdtree.zip -d ~/.vim
#if wanna start NERDTree auto, see vimrc directly
echo -e " ====================> liangji finish installing\n\n\n"











#set ai 
#
