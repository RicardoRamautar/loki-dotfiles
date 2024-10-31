# Installation & Setup
### Step 1. Install kitty
```bash
sudo apt install kitty
```

### Step 2. create a `kitty.conf` file
```bash
mkdir -d ~/.config/kitty/
touch ~/.config/kitty/kitty.conf
```

### Step 3. Copy the contents of my `kitty.conf` into yours

### Step 4. Ensure you have the proper fonts installed
In my `kitty.conf`, I am using two fonts:
- **JetBrainsMono Nerd Font Mono**
- **Symbols Nerd Font**

*JetBrainsMono Nerd Font Mono* is the standard font in my kitty terminal. *Symbols Nerd Font* is used to display glyphs and icons such as those used in my bash prompt. You can find these fonts [here](https://www.nerdfonts.com/font-downloads). 

After downloading the appropriate zip files, unzip them and move the `.ttf` files to your `/usr/local/share/fonts/` folder:
```bash
unzip JetBrainsMono.zip -d JetBrainsMono
sudo mv JetBrainsMono/*.ttf /usr/local/share/fonts/
```
Then refresh your font cash and check whether the fonts are installed properly:
```bash
fc-cache -fv
fc-list | grep "JetBrainsMono"
```

Do the same for SymbolsNerdFont.

### Step 5. Close kitty

Close all instances you have open of kitty. When opening up the kitty terminal again, it should look something like mine. However, note that the backgrund blur, rounded corners, and lack of stats bar are due to the window manager and compositor that I am using. However, you can copy my bash prompt if you want.

### Step 6. Copy my bash prompt
Inside this repo there is a file `bash_prompts/simple.sh`. This file sets the `PS1` environment variable, which is your bash prompt. To copy this bash prompt, download my `simple.sh` file into your `~/.config/` folder (or whatever folder you prefer). Next, inside your `~/.bashrc`, comment out all instances (includin if-else statements) which define the `PS1` environment variable. Lastly, source the `simple.sh` file inside your `~/.bashrc` file by adding the following line:
```bash
source ~/.config/simple.sh
```
Now, source your `~/.bashrc` file and the bash prompts should show up properly.