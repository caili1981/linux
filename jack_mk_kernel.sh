echo "the working release is:"
echo "change the release version\n"
sub_ver=`awk -F. '{if (NR==5) {print $2+1}}' Makefile`
awk -F. '{if (NR==5) {print "EXTRAVERSION = ."$2+1} else {print $0}}' Makefile  > tmp
mv -f tmp Makefile
sed -n "1, 5"p Makefile
echo "SUB_VERSION="$sub_ver

echo "1. start build\n"
make
if [ $? -eq 0 ]; then
    echo "2. module install\n"
    make modules_install
    echo "3. make install\n"
    make install
    echo "4. build image\n"
    mkinitramfs -o /boot/initrd.img-4.19.1.$sub_ver
    echo "5. compress image\n"
    update-initramfs -c -k 4.19.1.$sub_ver
    echo "6. update grub\n"
    update-grub2
    exit 0
else
    echo "Error found\n"
fi


