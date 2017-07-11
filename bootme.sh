#!/bin/bash
./refind-install
sudo cp -r refind/* /refind-bin-one
sudo mkdir /Volumes/ESP
sudo mount -t msdos /dev/disk0s1 /Volumes/ESP
sudo mkdir -p /Volumes/ESP/efi/refind
sudo cp -r refind/* /Volumes/ESP/efi/refind/
sudo mv /Volumes/ESP/efi/refind/refind.conf-sample /Volumes/ESP/efi/refind/refind.conf
sudo bless --mount /Volumes/ESP --setBoot --file /Volumes/ESP/efi/refind/refind_x64.efi --shortform
diskutil unmount disk0s1
sudo reboot
