# Teleprompt

## Requirements

This script requires [FFmpeg](https://github.com/FFmpeg/FFmpeg). The easiest way to install FFmpeg on a Mac is using brew:

```
brew install ffmpeg
```

To install FFmpeg another way or for other platforms, see the documentation at https://ffmpeg.org/download.html

## Using it

1. Put the `teleprompt.sh` script wherever you like. Ideally somewhere in your `$PATH` so that you can call it from anywhere.
1. Run the script: `./teleprompt.sh`
1. The script will display available video devices to monitor, enter the number for the one you would like to mirror.
1. The script will launch FFplay with the device horizontally mirrored.

Note that the first time you run the script, you will have to update the Privacy & Security settings on your Mac in order to allow FFplay to read video input. To do this:

1. Open System Settings
1. Select Privacy & Security
1. Select the Screen Recording section
1. Toggle the setting for Terminal to enabled

## Contributing

There's no official FOSS license on this because I'm lazy and none of this is really innovative. If you want to use this project, go for it! I really dont care what you do with it. If you want to contribute PRs, that's cool... but I'm also lazy, so I might be extremely slow in reviewing and/or merging.
