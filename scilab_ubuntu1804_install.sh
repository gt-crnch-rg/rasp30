#!/bin/bash
# This script uses the instructions from this post to pull Scilab 
# Post: https://askubuntu.com/questions/1052962/scilab-5-5-2-on-ubuntu-18-04
# Related Scilab bug: http://bugzilla.scilab.org/show_bug.cgi?id=15194

wget http://archive.ubuntu.com/ubuntu/pool/universe/s/scilab/scilab_5.5.2-2ubuntu3_all.deb
wget http://archive.ubuntu.com/ubuntu/pool/universe/s/scilab/scilab-cli_5.5.2-2ubuntu3_all.deb
wget http://archive.ubuntu.com/ubuntu/pool/universe/s/scilab/scilab-data_5.5.2-2ubuntu3_all.deb
wget http://archive.ubuntu.com/ubuntu/pool/universe/s/scilab/scilab-doc_5.5.2-2ubuntu3_all.deb
wget http://archive.ubuntu.com/ubuntu/pool/universe/s/scilab/scilab-full-bin_5.5.2-2ubuntu3_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/universe/s/scilab/scilab-include_5.5.2-2ubuntu3_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/universe/s/scilab/scilab-minimal-bin_5.5.2-2ubuntu3_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/universe/s/scilab/scilab-test_5.5.2-2ubuntu3_all.deb
# scilab dependencies
wget http://security.ubuntu.com/ubuntu/pool/universe/h/hdf5/libhdf5-10_1.8.16+docs-4ubuntu1.1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/s/suitesparse/libsuitesparseconfig4.4.6_4.4.6-1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/s/suitesparse/libamd2.4.1_4.4.6-1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/universe/libm/libmatio/libmatio2_1.5.3-1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/s/suitesparse/libcamd2.4.1_4.4.6-1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/s/suitesparse/libccolamd2.9.1_4.4.6-1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/s/suitesparse/libcolamd2.9.1_4.4.6-1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/s/suitesparse/libcholmod3.0.6_4.4.6-1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/s/suitesparse/libumfpack5.7.1_4.4.6-1_amd64.deb

sudo apt-get update
sudo apt-get install libcurl3
sudo apt-get install ./libhdf5-10_1.8.16+docs-4ubuntu1.1_amd64.deb \
        ./libsuitesparseconfig4.4.6_4.4.6-1_amd64.deb \
        ./libamd2.4.1_4.4.6-1_amd64.deb \
        ./libmatio2_1.5.3-1_amd64.deb \
        ./libcamd2.4.1_4.4.6-1_amd64.deb \
        ./libccolamd2.9.1_4.4.6-1_amd64.deb \
        ./libcolamd2.9.1_4.4.6-1_amd64.deb \
        ./libcholmod3.0.6_4.4.6-1_amd64.deb \
        ./libumfpack5.7.1_4.4.6-1_amd64.deb \
        ./scilab*.deb

## Next, you want to pin these older versions of the Scilab files so they don't get upgraded
cat <<EOF | sudo tee /etc/apt/preferences.d/pin-scilab
Package: libamd2.4.1
Pin: version 4.4.6-1
Pin-Priority: 1337

Package: libcamd2.4.1
Pin: version 4.4.6-1
Pin-Priority: 1337

Package: libccolamd2.9.1
Pin: version 4.4.6-1
Pin-Priority: 1337

Package: libcholmod3.0.6
Pin: version 4.4.6-1
Pin-Priority: 1337

Package: libcolamd2.9.1
Pin: version 4.4.6-1
Pin-Priority: 1337

Package: libhdf5-10
Pin: version 1.8.16+docs-4ubuntu1.1
Pin-Priority: 1337

Package: libmatio2
Pin: version 1.5.3-1
Pin-Priority: 1337

Package: libsuitesparseconfig4.4.6
Pin: version 4.4.6-1
Pin-Priority: 1337

Package: libumfpack5.7.1
Pin: version 4.4.6-1
Pin-Priority: 1337

Package: scilab
Pin: version 5.5.2-2ubuntu3
Pin-Priority: 1337

Package: scilab-cli
Pin: version 5.5.2-2ubuntu3
Pin-Priority: 1337

Package: scilab-data
Pin: version 5.5.2-2ubuntu3
Pin-Priority: 1337

Package: scilab-doc
Pin: version 5.5.2-2ubuntu3
Pin-Priority: 1337

Package: scilab-full-bin
Pin: version 5.5.2-2ubuntu3
Pin-Priority: 1337

Package: scilab-include
Pin: version 5.5.2-2ubuntu3
Pin-Priority: 1337

Package: scilab-minimal-bin
Pin: version 5.5.2-2ubuntu3
Pin-Priority: 1337

Package: scilab-test
Pin: version 5.5.2-2ubuntu3
Pin-Priority: 1337
EOF       
