# rasp30

This repository provides some alternate methods for building and using the RASP tools for programming the Field Programmable Analog Array (FPAA) developed by Dr. Jennifer Hasler's group at Georgia Tech. While we investigated using the tools with the latest Scilab 6.x branch, enough changes were required that we recommend using the "legacy" version of Scilab 5.5.2 as the basis of your build. 

The primary difference between this repo and the main RASP repository is that it makes some changes for a shared user environment on a remotely accessible virtual machine platform. Note that the RASP functionality follows very closely with the main RASP branch and will hopefully be merged back in the near future. 

# RASP Links and Original Instructions
There is a VirtualBox image for RASP30 tools that can be found [from Dr. Hasler's site here](http://hasler.ece.gatech.edu/FPAAtool/index.html). Please click on the [OVA file for Virtual Box](http://hasler.ece.gatech.edu/FPAAtool/class.ova) and also check the [documentation](http://hasler.ece.gatech.edu/FPAAtool/VM_FPAA_setup01.pdf) for the VM. The password for the VM is `reverse`.

# Credits 
Many thanks for James Wood and Ben Chuang from the Rogues Gallery VIP class who investigated the initial porting of this toolset to our infrastructure! Of course, most of the credit goes to the students and researchers in Dr. Hasler's lab who have developed the main RASP tools.
