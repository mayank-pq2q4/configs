#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

style="$($HOME/.config/rofi/applets/applets/style.sh)"

dir="$HOME/.config/rofi/applets/applets/configs/$style"
rofi_command="rofi -theme $dir/quicklinks.rasi"

# Error msg
msg() {
	rofi -theme "$HOME/.config/rofi/applets/styles/message.rasi" -e "$1"
}

# Browser
if [[ -f /usr/bin/google-chrome-stable ]]; then
	app="google-chrome-stable"
elif [[ -f /usr/bin/chromium ]]; then
	app="chromium"
elif [[ -f /usr/bin/midori ]]; then
	app="midori"
else
	msg "No suitable web browser found!"
	exit 1
fi

# Links
google=""
outlook=""
whatsapp="🗨"
github=""
cloud="☁"
youtube=""

# Variable passed to rofi
options="$google\n$outlook\n$whatsapp\n$github\n$cloud\n$youtube"

chosen="$(echo -e "$options" | $rofi_command -p "Open In  :  $app" -dmenu -selected-row 0)"
case $chosen in
    $google)
        $app https://www.google.com &
        ;;
    $outlook)
        $app https://outlook.office.com/mail/ &
        ;;
    $whatsapp)
        $app https://web.whatsapp.com/ &
        ;;
    $github)
        $app https://www.github.com &
        ;;
    $cloud)
        $app https://cloud.digitalocean.com/projects/d4bbd80e-7d6d-4f3b-b9cc-b15ea6ee423e/resources?i=9eea38 &
        ;;
    $youtube)
        $app https://www.youtube.com &
        ;;
esac

