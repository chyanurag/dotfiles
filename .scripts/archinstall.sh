#/bin/sh
edited=true # set this true to let the script know you have set the variables
proot=""
pswap=""
newuser=""
newpass=""
rootpass=""
hostname=""
packages="base base-devel linux linux-firmware linux-headers intel-ucode sudo git networkmanager dhcpcd bluez bluez-utils wpa_supplicant neofetch nodejs npm python go neovim libreoffice zip p7zip unrar xorg xorg-xinit i3"
if ! $edited; then
    echo "Please edit all the values in the script manually to continue"
    exit
fi
ls /sys/firmware/efi/efivars > /dev/null && echo "system booted in efi mode" || exit
pacman -Sy
pacamn -S --noconfirm --needed archlinux-keyring curl ca-certificates zsh
timedatectl set-timezone Asia/Kolkata
timedatctl set-ntp true
timedatectl status
mkfs.ext4 $proot
mkswap $pswap
swapon $pswap
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
reflector --country India --save /etc/pacman.d/mirrorlist
mkdir /mnt
mount $proot /mnt
pacstrap /mnt $packages
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
echo "Enter root user password"
echo "root:$rootpass" | chpasswd
useradd -m -s /usr/bin/zsh $newuser
usermod -aG wheel,storage,power $newuser
echo "%wheel ALL=(ALL:ALL) ALL" > /etc/sudoers
echo "%wheel ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers
echo "$newuser:$newpass" | chpasswd
echo "en_US.UTF-8 UTF-8 " > /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
echo $hostname > /etc/hostname
echo -e "127.0.0.1\tlocalhost\n::1\tlocalhost\n127.0.0.1\t$hostname.localdomain\tlocalhost\n" > /etc/hosts
ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
hwclock --systohc
pacman -S --noconfirm --needed efibootmgr grub dosfstools mtools os-prober
mkdir /boot/efi
mount /dev/sda1 /boot/efi
grub-install --target=x86_64-efi --bootloader-id=Arch --recheck
grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable networkmanager dhcpcd
exit
umount -lR /mnt
echo "Arch linux is now successfully installed"
