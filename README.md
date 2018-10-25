# Homebrew FLTKWithCairo Tap

The [RNAStructViz](https://github.com/gtDMMB/RNAStructViz/tree/with-cairo) 
application requires a build of the most recent FLTK *1.4.x* library 
**with Cairo support** to run on the most recent Mac OSX *Mojave*. 
Since [brew]() by policy does not allow non-stable, or development, 
branches of software to be integrated into their full 
[formula base](https://formulae.brew.sh/formula/), 
we have created this 
[tap](https://github.com/Homebrew/brew/blob/master/docs/How-to-Create-and-Maintain-a-Tap.md) 
for the convenience of our users. 

## Installing FLTK 1.4.x with Cairo support in Homebrew

To install our tap of FLTK 1.4.x with Cairo support, run the following 
commands in your Mac OSX terminal:
```
$ brew install --build-from-source gtDMMB/core/fltkwithcairo
```



