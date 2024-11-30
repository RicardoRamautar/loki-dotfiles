# Installation
I installed the latest stable release of i3 for Ubuntu according to the [i3wm repository](https://i3wm.org/docs/repositories.html). To install i3 I ran the following commands:
```bash
/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2024.03.04_all.deb keyring.deb SHA256:f9bb4340b5ce0ded29b7e014ee9ce788006e9bbfe31e96c09b2118ab91fca734

sudo apt install ./keyring.deb

echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list

sudo apt update

sudo apt install i3
```

Running these commands installed the following i3 version:
> i3 version 4.23 (2023-10-29) © 2009 Michael Stapelberg and contributors

# Configuration file
i3 is pretty bare-bones I therefore installed the following tools to make it more enjoyable.

## Picom - Compositor
i3 is a window manager, which does not include a compositor. You will therefore need to install a compositor, such as Picom.

#### Picom integration in i3 config
```
exec_always --no-startup-id picom --config ~/.config/picom/new_picom.conf &
```
- `exec_always`: Always (re)start picom when i3 is (re)started.
- `--no-startup-id`: Do not assign startup id to picom process.
- `picom --config ~/.config/picom/new_picom.conf &`: Start Picom with config `~/.config/picom/new_picom.conf` as background process.

### Installation
Unfortunately, you will need to build from source. Luckily however, it is pretty easy and all the steps are described in the git repo which can be found [here](https://github.com/yshui/picom/tree/stable/12). 

> Note that I cloned the `stable/12` branch. Make sure you do the same if you want the same as me.


## Introgen - Wallpapers
I use nitrogen to set my wallpaper. You can install it from the apt package manager:
```bash
sudo apt-get install nitrogen
```
Once installed, type the following command in your terminal:
```bash
nitrogen <path-to-wallpaper>
```
, where `<path-to-wallpaper>` is the path to the folder that contains your wallpapers. You should then see the following screen:
![nitrogen screen](images/nitrogen.png)
In the image above, you see two images. These are the wallpapers that I have in my wallpapers folder. All the way at the bottom you see: "zoomed fill" and "screen 1". This means that this selected wallpaper will be zoomed to fit screen 1 and will be applied to screen 1. Now, if you have another monitor selected, you can press the "screen 1" button which should open the toggel to select your other monitor. This allows you to set the wallpaper for your monitor as well.

BEFORE YOU CLOSE IT, DON'T FOGET TO PRESS "Apply"! <br>
Once you have done this, your background should be applied after refreshing i3 by pressing the  `$mod + Shift + r` keybinding.

#### Nitrogen integration in i3 config
```
exec_always --no-startup-id nitrogen --restore
```
- `exec_always`: Always (re)start picom when i3 is (re)started.
- `--no-startup-id`: Do not assign startup id to picom process.
- `nitrogen --restore`: Apply the preferences set in nitrogen

## Rofi - App Launcher
Rofi is the app launcher that I use. You can install it with the following command:
```bash
apt install rofi
```
Next, you need to set a theme for rofi. [rofi-themese-collection](https://github.com/newmanls/rofi-themes-collection) makes this very easy to do. Just follow the steps described in the repo.

Assuming you are using my i3 config file, you will now be able to open the rofi app launch with the keybinding: `$mod + Enter`. But you can change it by changing:
```
bindsym $mod+Return exec rofi -show drun
```

## Polybar
Instead of the i3 bar, I use polybar, which can be installed using the following command:
```
sudo apt install polybar
```
Next, you will need to create a config file inside the `~/.config/polybar/config` file. I start polybar inside my i3 config using a bash script that removes any existing polybar that is running and starts a new one:
```
exec_always --no-startup-id ~/.config/polybar/start_polybar.sh
```

# Basic usage
In i3, performing basic things like connecting monitors or bluetooth devices might be differente then you are used to. Here, I describe how you can perform these basic things.


## [Add multiple monitors](https://i3wm.org/docs/userguide.html#multi_monitor)
#### Adding a monitor

You can connect a monitor this way using `xrandr`. This package is usually included in the package named `x11-server-utils` and can therefore be installed using the following command:
```bash
sudo apt-get install x11-xserver-utils
```

When typing the `xrandr` command, you get a list of connected and disconnected displays. I for example get:
```bash
╰─❱  xrandr
Screen 0: minimum 320 x 200, current 3440 x 1600, maximum 16384 x 16384
eDP-1 connected primary 2560x1600+0+0 (normal left inverted right x axis y axis) 345mm x 215mm
   2560x1600    240.00*+  60.00 + 144.00    60.00  
   2560x1440     60.00  
   2048x1536     60.00  
   1920x1440     60.00  
        .           .
        .           .
        .           .
HDMI-1-0 disconnected (normal left inverted right x axis y axis)
DP-1-0 disconnected (normal left inverted right x axis y axis)
DP-1-1 disconnected (normal left inverted right x axis y axis)
DP-1-2 connected 3440x1440+0+0 (normal left inverted right x axis y axis) 797mm x 334mm
   3440x1440     59.97*+  74.98    29.99  
   2560x1080     59.98    59.94    50.00  
   1920x1080     60.00    59.94    50.00  
   1720x1440     59.94  
   1680x1050     59.95  
   1440x900      59.89  
   1280x1024     75.02    60.02  
   1280x720      60.00    59.94    50.00  
   1024x768      99.97    75.03    70.07    60.00  
   800x600       99.66    75.00    72.19    60.32    56.25  
   720x576       50.00  
   720x480       59.94  
   640x480       99.77    75.00    72.81    59.94    59.93  
DP-1-3 disconnected (normal left inverted right x axis y axis)
DP-1-4 disconnected (normal left inverted right x axis y axis)
```
Each display is assigned a unique identifier. In my case, I have two:
- `eDP-1`: laptop screen with a resolution of "2560x1600"
- `DP-1-2`: connected monitor with a resolution of "3440x1440"

I set my monitor (`DP-1-2`) as an extended screen to the right of my laptop screen to be used as the primary screen using the following command:
```bash
xrandr --output DP-1-2 --auto --right-of eDP-1 --primary
```
Your monitor should now extend your laptop screen and a workspace should be created and assigned to your monitor screen. 

#### Setting wallpaper for monitor
It might be possible that your background wallpaper is not set up properly for you monitor. I am using `nitrogen` to set my wallpaper. To set your wallpaper using nitrogen type the following command:
```bash
nitrogen <path-to-wallpapers>
```
This should open up a window where you see your wallpapers. At the bottom, you can select your screen and how you want the selected wallpaper to be visualized. To make sure these settings are used when starting up i3, set the following line in your i3 configuration file:
```bash
exec --no-startup-id nitrogen --restore
```

> Note that you might need to refresh i3 when connecting a monitor. For this, press  `$mod + Shift + r`


## Connecting bluetooth devices
Step 1. Start up the `bluetoothctl` command-line tool:
```bash
bluetoothctl
```

Step 2. Inside the command tool that you just started, activate your bluetooth adapter:
```bash
power on
```

Step 3. Find bluetooth devices
```bash
scan on
```

Step 4. Pair with a bluetooth device using their ip-address:
```bash
pair XX:XX:XX:XX:XX:XX
```

Step 5. Connect to a bluetooth device:
```bash
connect XX:XX:XX:XX:XX:XX
```

Step 6. Exit the command tool:
```bash
exit
```


