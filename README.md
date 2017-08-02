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

## Running the Web Server

```bash
stack exec -- meme-tutorial-server 8080
```
