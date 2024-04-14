# Switching to arch

## Basic

Burn a ARCH ISO to a usb. Boot into said usb from BIOS.

**Network problem**:

If necessary connect to a network using wlan. **BUT** I highly recommend
connecting your phone via usb to your computer and sharing internet via that.
Linux should automatically detect LAN connection. You can set up NetworkManager
later via a tui.

Create and format the linux partition. Then use archinstall to finish the
installation process.

After installation use os-prober to allow grub to find the Windows installation
as well.
<https://www.youtube.com/watch?v=2SnjJEuaMH8&t=773&ab_channel=SandipSky>

## Stuff to do

tlpui ufw install vcpkg packages

### ZSH

Install oh-my-zsh <https://github.com/ohmyzsh/ohmyzsh> Have fun with
powerlevel10k
