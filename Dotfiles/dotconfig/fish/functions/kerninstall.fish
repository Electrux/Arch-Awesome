function kerninstall
	make -j8 && sudo make -j8 modules_install && sudo cp -v arch/x86_64/boot/bzImage /boot/vmlinuz-linux-custom && sudo mkinitcpio -p linux-custom && sudo cp System.map /boot/System.map && sudo dkms autoinstall -k (file -bL arch/x86_64/boot/bzImage | grep -o 'version [^ ]*' | cut -d ' ' -f2)
end
