### `transparent_clipping`
> Set it to `false`. Pop-up bars look weird when setting it to true. You see a part of the background around them instead of the window that is behind it.

When set to true, transparent windows clip or block out parts of overlapping windows.


# Installing picom from source
Install the dependencies:
```bash
sudo apt install libconfig-dev libdbus-1-dev libegl-dev libev-dev libgl-dev libepoxy-dev libpcre2-dev libpixman-1-dev libx11-xcb-dev libxcb1-dev libxcb-composite0-dev libxcb-damage0-dev libxcb-glx0-dev libxcb-image0-dev libxcb-present-dev libxcb-randr0-dev libxcb-render0-dev libxcb-render-util0-dev libxcb-shape0-dev libxcb-util-dev libxcb-xfixes0-dev meson ninja-build uthash-dev -y

sudo apt install cmake
```

```bash
mkdir -d ~/src/
cd ~/src/
git clone -b stable/12 https://github.com/yshui/picom.git
cd picom
meson setup --buildtype=release build
ninja -C build

LDFLAGS="-L/usr/local/lib" CPPFLAGS="-I/usr/local/include" meson setup --buildtype=release build
sudo ninja -C build install
```