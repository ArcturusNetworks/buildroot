Arcturus uCLS1012A SoM
======================

This tutorial describes how to use the predefined Buildroot
configuration for the Arcturus uCLS101A SoM platform.

Additional information about the uCLS1012A System on Module can be found at
https://www.arcturusnetworks.com/products/ucls1012a
and product support for registered users at
https://www.arcturusnetworks.com/support

Building
--------

Return to the top directory <buildrootdir> and execute the following commands.

  make arcturus_ucls1012a_som_defconfig
       or
  make arcturus_ucls1012a_som120_defconfig

  make

Result of the build
-------------------

After building, you should obtain this tree:

    output/images/
    +-- Image.gz
    +-- part0-000000.itb
    +-- rootfs.cpio
    +-- rootfs.cpio.gz
    +-- rootfs.cramfs
    +-- rootfs.jffs2
    +-- rootfs.squashfs
    +-- rootfs.tar
    +-- u-boot.bin
    +-- u-boot-firmware.bin
    +-- ucls1012a-som.dtb

Flashing
--------

You'll need to program the image created by buildroot into the SPI NOR flash.

1. Reboot your module and via the serial console press <escape> to enter the B$
u-boot shell.
   From the shell you will need to update four environment variables replacing the
   IPv4 IP Address with ones that will work with your network and tftp server.

   B$ setenv ipaddr 192.168.1.81
   B$ setenv serverip 192.168.1.80
   B$ setenv gatewayip 192.168.1.1
   B$ setenv netmask 255.255.255.0
   B$ saveenv

2. Enable tftp server to serve the <buildrootdir>/output/images/ folder.

3. Program the new U-Boot binary and/or u-boot firmware (optional)
    If you don't feel confident upgrading your bootloader then don't do it,
    it's unnecessary most of the time.

    B$ tftp u-boot.bin
    B$ run program_uboot

    B$ tftp u-boot-firmware.bin
    B$ run program_uboot_firmware


4.1. For all-in-one Kernel+DTB+Ramdisk.

    B$ tftp part0-000000.itb

    B$ run program0
    B$ setenv pactive 0
            or
    B$ run program1
    B$ setenv pactive 1

    B$ saveenv

4.2. For separated Kernel+DTB and Ramdisk.

    B$ tftp part0-000000.itb
    B$ run program0

    B$ tftp rootfs.cramfs
            or
    B$ tftp rootfs.jffs2
            or
    B$ tftp rootfs.squashfs

    B$ run program1

5. Booting your new system

    Reboot your system by reset command
    B$ reset

        or

    B$ run bootcmd

Good Luck !
