sudo apt update
sudo apt install software-properties-common apt-transport-https
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install code

# extension: Chinese(Simplified)
#ctrl + shift + p  -> language -> configure display language-> chinese


#markdown all in one
#markdown kroki
#quickmark linter
#markdown pdf
