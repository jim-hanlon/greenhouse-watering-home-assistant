# Home Assistant Greenhouse Control


## Installation

### Install Base OS

Refer to [How to install Ubuntu Desktop on Raspberry Pi](https://ubuntu.com/tutorials/how-to-install-ubuntu-desktop-on-raspberry-pi-4#1-overview).

⚠️‼️ **The following code examples are asssumed to run as `root` unless otherwise specified.**

1. Install [RPI Imager](https://downloads.raspberrypi.org/imager).

1. Burn [Raspberry  Pi OS Lite (64-bit)](https://downloads.raspberrypi.org/raspios_lite_arm64/images/raspios_lite_arm64-2022-09-26/2022-09-22-raspios-bullseye-arm64-lite.img.xz)

1. Boot OS and complete OS installation.

   * hostname: home-assistant
 
   The unix user credentials are:

   * username: home-assistant
   * password: PASSWORD (see KeyChain)

1. Update `bash` profile

    > echo -e "\n. \${HOME}/home-assistant/home-assistant.include.sh\n" >> "${HOME}/.bashrc"

1. Create `home-assistant` SSH directory:

    > mkdir ~home-assistant/.ssh<br/>
    > chown home-assistant:home-assistant ~homeassistant/.ssh<br/>
    > chmod 700 ~home-assistant/.ssh<br/>

1. Copy GitHub SSH key to `~home-assistant/.ssh` using sneakernet. A key to access GitHub is required to push chnges back to the GitHub server.

1. In `.profile`, start `ssh-agent` and register the github key.

    > eval $(ssh-agent)<br/>
    > ssh-add ${HOME}/.ssh/*rsa<br/>

1. Copy github SSH keys to `~home-assistant/.ssh` using sneakernet. A key to access github is required to push changes back to the github server.

    > cp github.rsa ~home-assistant/.ssh/<br/>

1. Append SSH keys to `~home-assistant/.ssh/authorized_keys`:

    > for f in ~home-assistant/.ssh/*rsa.pub; do<br/>
    > &nbsp;&nbsp;&nbsp;&nbsp;(cat "${f}" && echo) >> ~homeassistant/.ssh/authorized_keys<br/>
    > done<br/>

1. Set permissions on `~/.ssh`:

    > chown -R home-assistant:home-assistant ~/.ssh<br/>
    > chmod -R 600 ~home-assistant/.ssh/*<br/>

1. **[FIXME]** Install `screen`:

    > **[TBD]**<br/>
    > apt install screen<br/>
    > &nbsp;&nbsp;&nbsp;&nbsp;etc<br/>
    > install .screenrc<br/>
    > **[TBD]**

1. **[FIXME]** Disable `rpi_hwmon_driver` at boot:

    > **[TBD]**

### Install Applications

⚠️‼️ **The following code examples are asssumed to run as `root` unless otherwise specified.**

1. Install [Docker](https://docs.docker.com/engine/install/ubuntu/).

    > apt update<br/>
    > apt upgrade -y<br/>
    > curl -sSL https://get.docker.com | sh<br/>
    > usermod -aG docker homeassistant<br/>
    > shutdown -r now<br/>

    &nbsp;⫶<br/>

    > docker ps<br/>
    > docker run hello-world<br/>

1. Install [`git`](https://git-scm.com/)

    > apt install -y git<br/>
    > git config --global user.email "*you@example.com*"<br/>
    > git config --global user.name "*Your Name*"<br/>

1. Install `SQLite3` (useful for looking at Home Assistant's database)

    > apt install -y sqlite3<br/>

### Running Home Assistant

⚠️‼️ **The following code examples are asssumed to run as `home-assistant` unless otherwise specified.**

1. Clone `home-assistant` repository

    > cd ~home-assistant<br/>
    > git clone --config core.sshCommand="ssh -i ~/.ssh/github.rsa" \ <br/>
    &nbsp;&nbsp;&nbsp;&nbsp;git@github.com:jim-hanlon/home-assistant.git<br/>
    
### Running 

1. Using `docker compose`:

    > docker compose up -d<br/>
    
1. After a couple of minutes of initialization, the web application should be available at `http://HOSTNAME:8123`

