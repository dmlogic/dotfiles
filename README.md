# Darren's system install/recovery repo

Latest incarnation is Arch based.

## Usage

* Start with a fresh install of Manjaro, or something with a Gnome desktop
* Get access to this repo
* Clone
* Create a .env file and populate
* If restoring, have a mounted drive in the expected format
* Check the contents of `provision.sh` and comment anything not required
* Run `./provision.sh`

## Restore planning

This stuff should be backed up anyway, but if planning a re-install, use
`backup.sh` to create everything in the expected location.

## Roadmap

* Make this installable via a browser
* Copy it all to ~/.local/share and make it run from there including perms
* Get the web2app scripts working
* Finish the install by initiating the `gh auth login process`
* Document rsync back from usb drive
* Use it a few times and verify it works

## Thanks to

@dhh and the Omakub and Omarchy projects
