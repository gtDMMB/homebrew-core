class Gtfoldpython3 < Formula
  
  desc "Python3 interface (C bindings and wrapper library) around GTFold"
  homepage "https://github.com/gtDMMB/GTFoldPython"
  url "https://github.com/gtDMMB/GTFoldPython/archive/refs/tags/v1.2.2-public-beta.tar.gz"
  version "v1.2.2-public-beta"
  sha256 "dc46a0c1826118260e35cd4ff60918efdc77e8a464679a4f2470455f84795eaf"
  revision 5

  depends_on "llvm@12"
  depends_on "coreutils"
  depends_on "gnu-sed"
  depends_on "numpy"
  depends_on "python@3"
  depends_on "shtool"
  depends_on "pkg-config"
  depends_on "libtool"
  depends_on "autoconf-archive"
  depends_on "binutils"
  depends_on "gtDMMB/core/autoconf2"
  depends_on "gtDMMB/core/automake2"
  depends_on :macos

  def install
    Dir.chdir("Python")
    system "make", "clean"
    system "make"
    system "rm Lib/*.o"
    prefix.install Dir["Lib"]
    prefix.install Dir["PythonLibrarySrc"]
    prefix.install "BuildScripts/InstallSetupBash.sh"
    prefix.install "Makefile"
    prefix.install Dir["Testing"]
  end
  
  def caveats; <<~EOS
                                                  
       _|_|_|   _|_|_|_|_|   _|_|_|_|   _|_|_|    
     _|             _|       _|         _|    _|  
     _|  _|_|       _|       _|_|_|     _|_|_|    
     _|    _|       _|       _|         _|        
       _|_|_|       _|       _|         _|        
                                             
    Thank you for using GTFoldPython (GTFP)! 
    >> For help or to find more documentation consult: 
       https://github.com/gtDMMB/GTFoldPython/wiki
    >> If you run into problems installing or running this 
       software, be sure to let the developers know by 
       posting a new issue about it on GitHub:
       https://github.com/gtDMMB/GTFoldPython/issues
    >> Before you can use GTFP, there are a couple of steps 
       you will need to complete for yourself ... 
       Run each of the following commands at your MacOS terminal:
       $ chsh -s /bin/bash
       $ cd $(brew --prefix gtfoldpython3)
       $ make bash-configure
       $ cd ~
    >> Thats it ==> Enjoy! :)
  EOS
  end
  
  test do
    system "false"
  end
  
end
