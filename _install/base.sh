lsblk --noheadings --output NAME,SIZE
echo ""

read -p "Root file system partition: " fs_root_part_input
read -p "Home directory partition. If not needed stay empty: " home_dir_part_input
read -p "EFI System Partition: " esp_input
read -p "Swap partition. If not needed stay empty: " swap_part_input

fs_root_mount=/mnt
home_dir_mount=$fs_root_mount/home
esp_mount=$fs_root_mount/boot/efi

log_mount() {
  echo "Mounting $1 -> $2"
  mount $1 $2
}

fs_root_part=/dev/$fs_root_part_input
log_mount $fs_root_part $fs_root_mount

if [ $home_dir_part_input ]; then
  home_dir_part=/dev/$home_dir_part_input
  mkdir $home_dir_mount
  log_mount $home_dir_part $home_dir_mount
fi

esp=/dev/$esp_input
# mkdir $esp_mount
log_mount $esp $esp_mount

if [ $swap_part_input ]; then
  swap_part=/dev/$swap_part_input
  echo "Enable swap on $swap_part"
  # mkswap $swap_part
  # swapon $swap_part
fi

pacstrap -K /mnt base linux linux-firmware vim man-db dhcpcd
genfstab -U /mnt >> /mnt/etc/fstab