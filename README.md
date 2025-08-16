# Darren's system install/recovery repo

Latest incarnation is Arch based.

## Usage

* Start with a fresh install of Manjaro, or something with a Gnome desktop

run `wget -qO- https://raw.githubusercontent.com/dmlogic/dotfiles/refs/heads/main/install.sh | bash`

* `cd ~/.local/share/dotfiles`
* Create a `.env` file and populate
* If restoring, have a mounted drive in the expected format
* Check the contents of `provision.sh` and comment anything not required
* Run `./provision.sh`

## Restore planning

This stuff should be backed up anyway, but if planning a re-install, use
`backup.sh` to create everything in the expected location.

## Roadmap

* Finish the install by initiating the `gh auth login` process

## Thanks to

@dhh and the Omakub and Omarchy projects
