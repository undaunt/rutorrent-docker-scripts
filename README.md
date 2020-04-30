# ruTorrent Docker Mods
 
This set of scripts is designed to work with the [linuxserver/docker-rutorrent](https://github.com/linuxserver/docker-rutorrent) image or, optionally, the [horjulf/docker-rutorrent-autodl](https://github.com/horjulf/docker-rutorrent-autodl) image which is based off the linuxserver image.
 
## Usage
 
As per the linuxserver image customization guidance located [here](https://blog.linuxserver.io/2019/09/14/customizing-our-containers/), custom scripts and services can be added to, respectively, the /config/custom-cont-init.d/ or /config/custom-services.d/ locations to add extra functionality to any of their base images. Simply pull these scripts down and put them into the rutorrent docker config folder.

## Contents

`00-remove-folders.sh`
This script deletes the optional folders **completed** and **incoming** which are always created by running the container, as noted in the [documentation](https://docs.linuxserver.io/images/docker-rutorrent) even when the folders are no longer specified as required within rtorrent.rc.

`10-themes.sh`
This script installs (or updates) the popular themes [club-QuickBox](https://github.com/QuickBox/club-QuickBox) and [MaterialDesign](https://github.com/phlooo/ruTorrent-MaterialDesign)

`20-install-utils.sh`
This script installs several prerequisites for both the [filemanager](https://github.com/nelu/rutorrent-filemanager) and [ratiocolor](https://github.com/Gyran/rutorrent-ratiocolor) plugins, including svn.

`30-filemanager.sh`
This script installs the [filemanager](https://github.com/nelu/rutorrent-filemanager) plugin and, on first run, sets default configuration to filemanager/conf.php.

`40-ratiocolor.sh`
This script installs the [ratiocolor](https://github.com/Gyran/rutorrent-ratiocolor) plugin and, on first run, swaps the colors changes from the background to the font color itself, which looks better on dark themes such as club-QuickBox and MaterialDesign. If using a light theme, comment out line 16.
