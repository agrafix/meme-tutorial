# meme-tutorial

## Setup

### Install libgd

* On Mac: `brew install gd`
* On Ubuntu: `sudo apt-get install libgd-dev`

### Clone the repo and setup Haskell

```bash
git clone https://github.com/agrafix/meme-tutorial.git
cd meme-tutorial
stack setup
stack build --fast
```

## Running

Note that this will not work for the stubs provided in the `master` branch as there's no implementation.

### Commandline

```bash
stack exec -- memegen in.jpg Hello World out.jpg
```

### Web Server

```bash
stack exec -- meme-tutorial-server 8080
```
