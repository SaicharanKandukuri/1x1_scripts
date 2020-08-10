### 1X1 MINI Scripts
## what is this
this is the repo where we keep & make mini scripts for termux to make it easier
## like what??
Script Like
- App installtion in rootfs
- Fixing some things in Termux based ToolLOA project
- Apply patches to ToolLOA Rootfs
- & Experimental scripts
### MiniScripts
## Code-oss Installer for termux (Beta)
[<img align="left" alt="Visual Studio Code" width="512px" src="https://upload.wikimedia.org/wikipedia/commons/9/9a/Visual_Studio_Code_1.35_icon.svg" />]
This code installs code-oss in Termux kali roots
## Requirements
- kali rootfs installed in termux with
- kali-fs as fs directory name
- start-kali.sh as start script..
## Installtion Command
Just copy paste code below In termux
```bash
apt install wget -y
wget -O code-oss-installer.sh https://bit.ly/1X1Code-ossTermux
chmod +x code-oss-installer.sh
./code-oss-installer.sh
```
