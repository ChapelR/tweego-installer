# Tweego Installer for Windows

An Inno Setup script and binary that installs Tweego for you, along with all current, full release built-in story formats, sets up all the environment variables, and lets you get on with your day.

## Installing Tweego

Download the binary from the releases page and run it. You'll be asked if you want to add Tweego to your PATH; leave this checked. (If you want to add Tweego to your path manuallly why are you here?)

To install additional story formats, navigate to `Program Files\Tweego\story-formats\`. Create a folder here with a name corresponding to what you want to call the format, e.g. `chapbook` or `paloma`. Then download the `format.js` file from the web and place it here.

## Using Tweego

This is simply an installer for Tweego, it does not add anything else to it. To use Tweego, you'll need to run it from the command line. Refer to its docs here: http://www.motoslave.net/tweego/docs/

The easiest way to get started is to create a folder, say `my-twine-project`. Open this folder, then create another one called, say, `src`. Put all your source code files (twee, js, css, html, etc) in here, then, while in the `my-twine-project` folder, press `Alt+D` type in `cmd` and press enter. In the command window, type `tweego -f [format] -o index.html src`, replacing `[format]` with the format you want to use (`tweego --list-formats` to view your installed options). This will compile everything in `src` to a file named `index.html`.

You can place the above command in a text file, then save it and change its `.txt` extension to `.bat` if you want. This will allow you to run the command by double-clicking on the file.

There's also a million other ways to do it, including using your IDE, using the watch options, using Node or other build tools, and a bunch of other options for compiling. This is just a basic explanation to get you started.

## Uninstalling

In the `Program Files\Tweego\` directory, there should be a file named `unins000.exe`. Run this program to remove Tweego. Changes to your path variables should revert.