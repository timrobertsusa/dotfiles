printf "Start of Script File \n" > ~/dotfiles/DotfilesLog.txt 

printf "PWD= $PWD \n" >> ~/dotfiles/DotfilesLog.txt 

printf "DOGVAR= $DOGVAR \n">> ~/dotfiles/DotfilesLog.txt 

printf "Local Workspace = $localWorkspaceFolder \n" >> ~/dotfiles/DotfilesLog.txt 
printf "Container Workspace = $containerWorkspaceFolder \n" >> ~/dotfiles/DotfilesLog.txt 


## copy git files to Codespace Project Home directory
##  cp ~/dotfiles/.gitignore $PWD
##  cp ~/dotfiles/.gitconfig $PWD


## Update to the latest PowerShell
curl -sSL https://raw.githubusercontent.com/PowerShell/PowerShell/master/tools/install-powershell.sh | bash

pwsh cmdprmt.ps1

mkdir -p /root/.config/powershell/ && cp ~/dotfiles/myprofile.ps1 /root/.config/powershell/Microsoft.PowerShell_profile.ps1

printf "Start of bash powerline \n" >> ~/dotfiles/DotfilesLog.txt 

cd ~
wget https://golang.org/dl/go1.15.2.linux-amd64.tar.gz
tar xvf go1.15.2.linux-amd64.tar.gz
mv go /usr/local
mkdir go

rm go1.15.2.linux-amd64.tar.gz

printf "wget, tar, etc  complete \n" >> ~/dotfiles/DotfilesLog.txt 
	
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH 

printf "GOROOT = $GOROOT \n" >> ~/dotfiles/DotfilesLog.txt 
printf "GOPATH =  $GOPATH \n" >> ~/dotfiles/DotfilesLog.txt 
printf "PATH =  $PATH \n" >> ~/dotfiles/DotfilesLog.txt 

printf "export complete  \n" >> ~/dotfiles/DotfilesLog.txt 

cd ~
go get -u github.com/justjanne/powerline-go

printf "powerline complete  \n" >> ~/dotfiles/DotfilesLog.txt 

echo 'export GOROOT=/usr/local/go' >>/root/.bashrc
echo 'export GOPATH=$HOME/go' >>/root/.bashrc
echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH' >>/root/.bashrc

printf "GOROOT = $GOROOT \n" >> ~/dotfiles/DotfilesLog.txt 
printf "GOPATH =  $GOPATH \n" >> ~/dotfiles/DotfilesLog.txt 
printf "PATH =  $PATH \n" >> ~/dotfiles/DotfilesLog.txt 

echo 'function _update_ps1() {
    PS1="$($GOPATH/bin/powerline-go -error $?)"
}
if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi' >>/root/.bashrc


printf "bashrc complete  \n" >> ~/dotfiles/DotfilesLog.txt 

printf "End of Script File \n" >> ~/dotfiles/DotfilesLog.txt 
