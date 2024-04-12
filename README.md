# Suckless programs
## With patches and 0x85c's customizations

These are [suckless](https://suckless.org/) programs with my selection of patches applied, as patches sometimes don't work with newer versions, or when multiple patches are applied, I have done the work to make these patches work with the latest vesion (at the time of writing) and resolve conflicts between patches. Either make clean all the programs, or directly apply the patches yourself from the upstream suckless repo, using the same version.

### [dmenu](https://tools.suckless.org/dmenu/)

  - tag: 5.3 (commit: 7be720cc88ed2294338f7182600df10f21c575ce) *- latest as of 2024-04-13*
  - patches
    - localpaths (my own patch)
      - patches/dmenu-localpaths-5.3-0x85c.diff
    - [center](https://tools.suckless.org/dmenu/patches/center/)
      - patches/dmenu-center-5.3-0x85c.diff

#### Building this project:

```
git clone git@github.com:0x85C/suckless.git && cd ./dmenu
make clean all
```

#### Building project from upstream without this repo (not necessary):

```
git clone https://git.suckless.org/dmenu && cd ./dmenu
git checkout 5.3
mkdir ./patches # <-- copy .diff files here from ./patches directory
git apply patches/dmenu-localpaths-5.3-0x85c.diff
git apply patches/dmenu-center-5.3-0x85c.diff
make clean all
```

#### i3 config

```
# start dmenu (a program launcher) - with center patch, and dracula color scheme
bindsym $mod+d exec --no-startup-id ~/suckless/dmenu/dmenu_run -i -c -l 10 -nb '#282a36' -nf '#f8f8f2' -sb '#6272a4' -sf '#f8f8f2'
```

#### Screenshot

![dmenu screenshot](./dmenu/screenshots/dmenu_screenhot.png)
