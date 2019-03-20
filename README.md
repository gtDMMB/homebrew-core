# Welcome to the gtDMMB Local Homebrew packages repository!

We maintain several custom *Homebrew* taps as packages in our repository here 
for the convenience of our users on recent Mac OSX platforms:
* **FLTKWithCairo**: [Tap Bottle Stats](https://bintray.com/homebrew/bottles/fltkwithcairo/#statistics) | [Formula](https://github.com/gtDMMB/homebrew-core/blob/master/Formula/fltkwithcairo.rb)
* **ViennaRNA**: [Tap Bottle Stats](https://bintray.com/homebrew/bottles/viennarna/#statistics) | [Formula](https://github.com/gtDMMB/homebrew-core/blob/master/Formula/viennarna.rb)
* **RNAStructViz**: [Tap Bottle Stats](https://bintray.com/homebrew/bottles/rnastructviz/#statistics) | [Formula](https://github.com/gtDMMB/homebrew-core/blob/master/Formula/rnastructviz.rb)

# Installation of our packages

To add our tap repository into your ``brew`` search path, run the following command:
```
$ brew tap gtDMMB/homebrew-core
```
To install the existing packages *from source* (i.e., rebuild any binary packages locally) run the 
following command
```
$ brew install --build-from-source gtDMMB/core/<pkg-name>
```
where *&lt;pkg-name&gt;* is one of ``{fltkwithcairo,viennarna,rnastructviz}``. 
Note that rebuilding from source can be a time consuming process depending on the speed of your Mac system.

Similarly, to install the pre-packaged binary *bottle* versions of our packages, run the following command:
```
$ brew install gtDMMB/core/<pkg-name>
```
If you run into any significant issues *with our packages* -- and not the ``brew`` utility itself, consider posting a [new issue](https://github.com/gtDMMB/RNAStructViz/issues) to this repository for help resolving the issue with our local packages offered by the [gtDMMB group](https://github.com/gtDMMB).

# Special package instructions

## The Homebrew FLTKWithCairo tap package

The [RNAStructViz](https://github.com/gtDMMB/RNAStructViz/tree/with-cairo) 
application requires a build of the most recent FLTK *1.4.x* library 
**with Cairo support** to run on the most recent Mac OSX *Mojave*. 
Since [brew](homewbrew.sh) by policy does not allow non-stable, or development, 
branches of software to be integrated into their full 
[formula base](https://formulae.brew.sh/formula/), 
we have created this 
[tap](https://github.com/Homebrew/brew/blob/master/docs/How-to-Create-and-Maintain-a-Tap.md) 
for the convenience of our users. 

### Installing FLTK 1.4.x with Cairo support in Homebrew

To install our tap of FLTK 1.4.x with Cairo support *from source*, run the following 
commands in your Mac OSX terminal:
```
$ brew install --build-from-source gtDMMB/core/fltkwithcairo
```



