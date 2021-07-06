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

One of the key issues with Scilab is that the binaries for 5.5.x seem to crash on Ubuntu 18. It is speculated in [this bug report](http://bugzilla.scilab.org/show_bug.cgi?id=15194) that the issue is a mismatch with the expected java libraries and the included ones with the tarball. You can get around this bug by compiling from source or installing older versions of the tools. 

In this second vein, this [AskUbuntu page](https://askubuntu.com/questions/1052962/scilab-5-5-2-on-ubuntu-18-04) seems to have the best advice, which is to pull the 16.04 versions of certain dependencies and then install Scilab 5.5.2 from the same repo. 


1) Install needed dependencies for running these tools
```
#Install dependencies needed for Scilab and the RASP tools
[root@remotevm]$ apt install build-essential default-jdk binutils-msp430 msp430mcu 
#To run scilab in standalone mode
[root@remotevm]$ apt install libgfortran3
```

2) Run the script from [this locally hosted script file](https://github.com/gt-crnch-rg/rasp30/blob/master/scilab_ubuntu1804_install.sh) to follow the post suggestions. This will install Scilab and dependencies from 16.04 sources. 

Then note you need to add the correct LD_LIBRARY_PATH to your bashrc. Scilab will look for libjava.so and libjvm.so from Java 8.
```
export LD_LIBRARY_PATH=/usr/lib/jvm/java-8-openjdk-amd64/jre/lib/amd64/:/usr/lib/jvm/java-8-openjdk-amd64/jre/lib/amd64/server/
```
3) Test that scilab runs without segfault. 

```
scilab    
Caught handled GLException: X11GLXDrawableFactory - Could not initialize shared resources for X11GraphicsDevice[type .x11, connection :50.0, unitID 0, handle 0x0, owner false, ResourceToolkitLock[obj 0x37f48d6d, isOwner false, <5e47f130, c337bf5>[count 0, qsz 0, owner <NULL>]]] on thread main-SharedResourceRunner
    [0]: jogamp.opengl.x11.glx.X11GLXDrawableFactory$SharedResourceImplementation.createSharedResource(X11GLXDrawableFactory.java:306)
  
    [11]: java.lang.Thread.run(Thread.java:748)

    (scilab-bin:18670): GLib-GObject-WARNING **: 21:49:59.554: invalid cast from 'GtkToplevelAccessible' to 'JawToplevel'
```

# Adding RASP tools and Scilab to an Ubuntu 18.04 VM


# Adding RASP tools and Scilab to an Ubuntu 18.04 WSL instance


