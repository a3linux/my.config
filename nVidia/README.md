nVidia driver installation notes
=====================================

My workstation failed with unknown CRASH with nouveau and have no choice.

Go back to nVidia after many years again.

## Install steps and notes

0. It is coming from this wonderful page,
   [Fedora nVidia Guide(manually installation with DKMS)][https://www.if-not-true-then-false.com/2015/fedora-nvidia-guide/]

1. Download nVidia installer, for latest kernel 4.10.5, download the patched one.

2. packages kernel-devel kernel-headers gcc dkms acpid

3. Disable nouveau and build initramfs. NOTICE to backup the vouveau initramfs so that you can back to nouveau
    more detail steps go the above page or print it.

4. Go to runlevel 3 bufore install nVidia driver

5. Post installation
    dnf install vdpauinfo libva-vdpau-driver libva-utils


## Result screenshoot
![Screenshot][F25 + Kernel 4.10.5 - nVidia.png]
