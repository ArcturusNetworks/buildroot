Arcturus uCS32V234 SoM
======================

This tutorial describes how to use the predefined Buildroot
configuration for the Arcturus uCS32V234 SoM platform.

Additional information about the uCS32V234 System on Module can be found at
https://www.arcturusnetworks.com/products/ucs32v234
and product support for registered users at
https://www.arcturusnetworks.com/support

Building
--------

Return to the top directory <buildrootdir> and execute the following commands.

  make arcturus_ucs32v_som_uclibc_defconfig
  or
  make arcturus_ucs32v_som_glibc_defconfig

  make

Result of the build
-------------------

After building, you should obtain this tree:

    output/images/
    +-- br2-ucs32v.its
    +-- Image
    +-- part0-000000.itb
    +-- rootfs.cpio
    +-- rootfs.cpio.gz
    +-- rootfs.tar
    +-- s32v234sbc.dtb
    +-- u-boot.s32

Flashing
--------

You'll need to program the image created by buildroot into the SD/MMC card
on your HOST PC.

1. Card has to be partitioned before "programming":

It should looks something like next:

# fdisk -l /dev/sde
Disk /dev/sde: 14.7 GiB, 15802040320 bytes, 30863360 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x00000000

Device     Boot Start      End  Sectors  Size Id Type
/dev/sde1        8192    24575    16384    8M  c W95 FAT32 (LBA)
/dev/sde2       24576 30863359 30838784 14.7G 83 Linux

Note: /dev/sde2 size is dependant of your SD card size.

2. Create mount points of the card partions on the Host PC
   (if it's not exist):

# su
# mkdirs /run/media/system
# mkdirs /run/media/rootfs

3. insert card to "program".

4. If partitions were auto mounted, then unmount them:

# umount /run/media/system
# umount /run/media/rootfs

5. format partitions:

# mkfs.msdos -n system /dev/sde1
# mkfs.ext4 -t ext4 -F -L rootfs /dev/sde2


6. mount partitions:

# mount /dev/sde1 /run/media/system
# mount /dev/sde2 /run/media/rootfs

7. copy/extract images into partitions

# cd /run/media/system; cp <SRC_PATH>/Image .; cp <SRC_PATH>/s32v234sbc.dtb .; sync
# cd /run/media/rootfs; tar -xf <SRC_PATH>/rootfs.tar; sync

8. program u-boot.s32 into the SD card:

# dd if=<SRC_PATH>/u-boot.s32 of=/dev/sde bs=512 seek=8 conv=fsync
# sync

9. card is ready - unmount partitions as described in #4, remove the card.


NOTE: The memory card device could be different on different PC.
      In this document /dev/sde is used as an example.


Good Luck !
