#!/bin/sh

echo "uinput" | sudo tee /etc/modules-load.d/uinput.conf

echo 'KERNEL=="uinput", GROUP="input", TAG+="uaccess"' | sudo tee /etc/udev/rules.d/99-input.rules

sudo usermod -aG input ${USER}
