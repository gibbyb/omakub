git clone https://github.com/Antynea/grub-btrfs ../packages/grub-btrfs/
mv ../configs/grub-btrfs/config ./grub-btrfs/config
cd ../packages/grub-btrfs
sudo make install
sudo grub2-mkconfig -o /etc/grub2-efi.cfg
sudo systemctl enable --now grub-btrfsd
echo -e "\nIn order to make GRUB-BTRFS work with Timeshift,"
echo -e "we must make a change to it's systemctl file.\n"
echo -e "\nReplace the line:"
echo -e "\n\t\"ExecStart=/usr/bin/grub-btrfsd /.snapshots --syslog\""
echo -e "with:"
echo -e "\n\t\"ExecStart=/usr/bin/grub-btrfsd --syslog --timeshift-auto\"\n"
echo -e "Copy the line above now and press enter to open the file."
read -p "Replace the line, then save & close nvim to continue."
sudo systemctl edit --full grub-btrfsd
sudo systemctl restart grub-btrfsd
