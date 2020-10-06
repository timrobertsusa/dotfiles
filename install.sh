printf "Start of Script File \n" > DotfilesLog.txt

printf "PWD= $PWD \n" >> DotfilesLog.txt

printf "$DOGVAR \n">> DotfilesLog.txt

printf "Local Workspace = $localWorkspaceFolder \n" >> DotfilesLog.txt
printf "Container Workspace = $containerWorkspaceFolder \n" >> DotfilesLog.txt


## copy git files to Codespace Project Home directory
##  cp ~/dotfiles/.gitignore $PWD
##  cp ~/dotfiles/.gitconfig $PWD


## Update to the latest PowerShell
curl -sSL https://raw.githubusercontent.com/PowerShell/PowerShell/master/tools/install-powershell.sh | bash

pwsh ~/dotfiles/powerlineinstaller.ps1

mkdir -p /root/.config/powershell/ && cp ~/dotfiles/mypwshprofile.ps1 /root/.config/powershell/Microsoft.Powershell_profile.ps1
cp ~/dotfiles/mypwshprofile.ps1 /root/.config/powershell/profile.ps1
printf "PWSH Powerline Complete \n" >> DotfilesLog.txt
## For powerline bash
cd ~
wget https://golang.org/dl/go1.15.2.linux-amd64.tar.gz
tar xvf go1.15.2.linux-amd64.tar.gz
mv go /usr/local
md go 
mkdir go
rm go1.15.2.linux-amd64.tar.gz
printf "Go Downloaded \n" >> DotfilesLog.txt
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH 
printf "Go PATHS SET \n" >> DotfilesLog.txt 
cd ~
go get -u github.com/justjanne/powerline-go
echo 'function _update_ps1() {
    PS1="$($GOPATH/bin/powerline-go -error $?)"
}
if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi' >>/root/.bashrc
printf "End of bash powerline Script File \n" >> DotfilesLog.txt
printf "End of Script File \n" >> DotfilesLog.txt
