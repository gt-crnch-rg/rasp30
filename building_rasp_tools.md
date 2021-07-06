Note that we use `/opt/scilab/5.5.2` and `/opt/rasp30` as the standard paths for our installation of Scilab and the FPAA tools. 

# Initial assumptions
For a standard remote VM (ie, not local WSL install), this installation assumes that a standard Linux desktop is available, and a tool like VNC or X2go (NoMX) is installed on the VM already. We typically install xubuntu desktop and x2go using the following strings:

```
#Add support for an XFCE desktop if it doesn't exist. You can also use `ubuntu-gnome-desktop` if you prefer gnome. Autocutsel is used for copy-paste with x2go or VNC. 
[root@remotevm]$ apt install xfce4 xfce4-terminal autocutsel

#Install x2go for remote GUI access. 
[root@remotevm]$ apt-get install x2goserver x2goserver-xsession
```
Note that X forwarding will work but is likely to be somewhat slow on a remote VM. For some references on why we use VNC/NoMX instead of SSH forwarding, please see these links:
* A brief 2009 [post](http://www.linuxtechie.net/2009/11/vnc-vs-x11-forwarding.html)
* Ars Technica 2010 [post](https://arstechnica.com/civis/viewtopic.php?t=1155637)

# Adding RASP tools and Scilab to an Ubuntu 18.04 VM

1) Install needed dependencies for running these tools

```
#Install dependencies needed for Scilab and the RASP tools
[root@remotevm]$ apt install build-essential default-jdk binutils-msp430 msp430mcu 
#To run scilab in standalone mode
[root@remotevm]$ apt install libgfortran3
```

2) Pull the Scilab 5.5.2 64 bit binary zipfile and untar it to you scilab directory.

```
export SCILAB_DIR=/opt/scilab/5.5.2
wget --no-check-certificate https://www.scilab.org/download/5.5.2/scilab-5.5.2.bin.linux-x86_64.tar.gz
tar xvzf scilab-5.5.2.bin.linux-x86_64.tar.gz -C $SCILAB_DIR
```

3) Test that Scilab loads correctly

```

export PATH=$PATH:/opt/scilab/5.5.2/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/scilab/5.5.2/lib/
```


# Adding RASP tools and Scilab to an Ubuntu 18.04 WSL instance


