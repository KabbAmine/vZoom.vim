# vZoom - <small>Quickly maximize & unmaximize the current window</small>

![Badge version](https://img.shields.io/badge/version-0.1-blue.svg?style=flat-square "Badge for version")
![License version](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square "Badge for license")

## Usage

Define your mapping:

```vim
nmap gsz <Plug>(vzoom)
```

Then use it to maximize/unmaximize your current window.

![vZoom demo](.img/demo.gif "vZoom usage demo")

Even quicker, just leave the maximized window and it will get its initial size back.

## Commands

You can enable/disable automatic zoom with:

```vim
:VZoomAutoToggle
```

## Installation

Copy the distributed files into Vim runtime directory which is usually `~/.vim/`, or `$HOME/vimfiles` on Windows.

Or in a better way, use a vim plugin manager:

e.g with [Vim-plug](https://github.com/junegunn/vim-plug) plus lazyloading:

```vim
Plug 'KabbAmine/vZoom.vim', {'on': ['<Plug>(vzoom)', 'VZoomAutoToggle']}
```

## Notes

Thanks to Bram Moolenaar for creating the best piece of software in the world :heart:

Thanks to you if you're using vZoom.

## License

MIT
