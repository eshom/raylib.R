[![R-CMD-check](https://github.com/eshom/raylib.R/actions/workflows/R_CMD_check_workflow.yml/badge.svg)](https://github.com/eshom/raylib.R/blob/master/.github/workflows/R_CMD_check_workflow.yml)

# Raylib.R

R bindings for raylib.

raylib is a simple and easy-to-use library to enjoy videogames programming.

raylib is highly inspired by Borland BGI graphics lib
and by XNA framework and it's specially well suited for prototyping,
tooling, graphical applications, embedded systems and education.

_NOTE for ADVENTURERS: raylib is a programming library to enjoy videogames programming;
no fancy interface, no visual helpers, no debug button...
just coding in the most pure spartan-programmers way._

Source: [https://www.raylib.com](https://www.raylib.com)

## How to install
The package uses a modified version of raylib 4.0.0 in order to comply with CRAN package policies.
The modified source code is included in the package.

To compile the source pacakge, the following dependencies are required:

**Ubuntu**
```sh
sudo apt install libasound2-dev mesa-common-dev libx11-dev libxrandr-dev libxi-dev xorg-dev libgl1-mesa-dev libglu1-mesa-dev
```

**Fedora**
```sh
sudo dnf install alsa-lib-devel mesa-libGL-devel libX11-devel libXrandr-devel libXi-devel libXcursor-devel libXinerama-devel
```

To install from Github run in R:

```r
remotes::install_github("eshom/raylib.R")
```

**Bindings are still very early in development.**
