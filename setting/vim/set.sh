# this script will help you to install vim and set it quickly

#install
echo " ====================> install vim"
sudo apt-get install vim
echo -e " ====================> finish\n\n\n"

#set vimrc
echo " ====================> set vim"
sudo cp ./vimrc /etc/vim/vimrc
source /etc/vim/vimrc
echo -e " ====================> finish \n\n\n"


# install some good plugin
echo " ====================> install vim_plug"
mkdir ~/.vim
rm -rf ~/.vim/*
mkdir ~/.vim/plugged ~/.vim/plugin ~/.vim/syntax ~/.vim/colors ~/.vim/doc ~/.vim/autoload

# install vim-plug
cp vim_plug/plug.vim ~/.vim/autoload/ 
echo -e " ====================> finish \n\n\n"


#add ctags into vim
#usage:
#ctags -R .
#找到光标的变量的定义ctrl ] 
#回到原来的位置 ctrl t/o
echo " ====================> install vim(ctags)"
sudo apt-get install universal-ctags
whatis ctags
echo -e " ====================> finish\n\n\n"


#add NERDTree into vim
#usage:
#:NERDTree
echo " ====================> install vim(NERDTree)"
#unzip ./nerdtree.zip -d ~/.vim
cp ./nerdtree/doc/* ~/.vim/doc/
cp -rf ./nerdtree/nerdtree_plugin ~/.vim/
cp ./nerdtree/plugin/* ~/.vim/plugin
cp ./nerdtree/syntax/* ~/.vim/syntax
#if wanna start NERDTree auto, see vimrc directly
echo -e " ====================> finish\n\n\n"

#add Taglist into vim
#usage:
#:Tlist
echo " ====================> install vim(Tlist)"
cp ./taglist/taglist.txt ~/.vim/doc
cp ./taglist/taglist.vim ~/.vim/plugin
echo -e " ====================> finish\n\n\n"


#add winmanager
echo " ====================> install vim(winmanager)"
cp ./winmanager/doc/* ~/.vim/doc
cp ./winmanager/plugin/* ~/.vim/plugin
echo -e " ====================> finish\n\n\n"











#set ai 
#
