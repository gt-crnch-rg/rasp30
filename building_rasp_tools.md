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

## Scilab Installation - Challenges and Bugs
RASP depends on Scilab which is not easily built from source due to dependencies on third-party libraries including HDf5 and the Java 8 JDK. If you want to try and build these third-party libraries from scratch, there is a script to allow you to do this [here](https://github.com/scilab/scilab-prerequirements) and the main Github repository can be found [here](https://github.com/scilab/scilab).

This [AskUbuntu page](https://askubuntu.com/questions/1052962/scilab-5-5-2-on-ubuntu-18-04) seems to have the best advice, which is to pull the 16.04 versions of certain dependencies and then install Scilab 5.5.2 from the same repo. 

1) 

Then note you need to add the correct LD_LIBRARY_PATH to your bashrc
```
#Scilab will look for libjava.so and libjvm.so from Java 8
export LD_LIBRARY_PATH=/usr/lib/jvm/java-8-openjdk-amd64/jre/lib/amd64/:/usr/lib/jvm/java-8-openjdk-amd64/jre/lib/amd64/server/
```

# Adding RASP tools and Scilab to an Ubuntu 18.04 VM

1) Install needed dependencies for running these tools

```
#Install dependencies needed for Scilab and the RASP tools
[root@remotevm]$ apt install build-essential default-jdk binutils-msp430 msp430mcu 
#To run scilab in standalone mode
[root@remotevm]$ apt install libgfortran3
```

2) Pull the Scilab 5.5.2 64 bit 

3) Test that Scilab loads correctly

```

export PATH=$PATH:/opt/scilab/5.5.2/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/scilab/5.5.2/lib/
```


# Adding RASP tools and Scilab to an Ubuntu 18.04 WSL instance


