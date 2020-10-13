if [ -f ~/dotfiles/DotfilesLog.txt ] 
then
    rm ~/dotfiles/DotfilesLog.txt 
fi

function Log_Writer () {
	printf "$(date +%Y-%m-%d_%H:%M:%N): $1  \n" >> ~/dotfiles/DotfilesLog.txt
}

Log_Writer "Start of Script File"
Log_Writer "DOGVAR = $DOGVAR"

 ## Update to the latest PowerShell
 # powershell is included - no need to install - an option
	#curl -sSL https://raw.githubusercontent.com/PowerShell/PowerShell/master/tools/install-powershell.sh | bash

## update PWSH profile and powerline fonts and modules for command prompt- installing modules needed
# posh-git, oh-my-posh, PSReadLine

	#jv: 
	#pwsh ~/dotfiles/cmdprmt.ps1
	#tr:
	pwsh ~/dotfiles/powerlineinstaller.ps1

#Setup for Startup powerdshell - profile
#jv: 
	#mkdir -p ~/.config/powershell/ && cp ~/dotfiles/myprofile.ps1 ~/.config/powershell/Microsoft.PowerShell_profile.ps1
#tr:
	mkdir -p ~/.config/powershell/ && cp ~/dotfiles/mypwshprofile.ps1 ~/.config/powershell/Microsoft.PowerShell_profile.ps1

Log_Writer "Powershell install, profile and command prompt complete"

Log_Writer "Start of bash powerline"

cd ~
#use the apt installer, no apt update required--unless needed for optional go version
apt-get install golang-go --assume-yes

Log_Writer "Install Go Complete" 
	
# export GOROOT=/usr/local/go
# export GOPATH=$HOME/go
# #jv:
	# _GOPATH=$(go env GOPATH)
	# _GOROOT=$(go env GOROOT)
	# echo 'export GOROOT=$_GOROOT' >>/root/.bashrc
	# echo 'export GOPATH=$_GOPATH' >>/root/.bashrc

#export GOROOT=go env GOROOT
#export GOPATH=$HOME/go
#export PATH=$PATH:$GOROOT/bin:$GOPATH 

Log_Writer "export GO paths complete"

cd ~
go get -u github.com/justjanne/powerline-go

Log_Writer "bash powerline font complete " 

echo 'export GOROOT=go env GOROOT' >>/root/.bashrc
echo 'export GOPATH=$HOME/go' >>/root/.bashrc
echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH' >>/root/.bashrc

Log_Writer "GOROOT = $GOROOT "
Log_Writer "GOPATH =  $GOPATH "
Log_Writer "PATH =  $PATH "


echo 'function _update_ps1() {
   PS1="$($GOPATH/bin/powerline-go -error $?)"
}
if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
   PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi' >>/root/.bashrc

Log_Writer "bashrc complete"

Log_Writer "End of Script File"
