class Rnastructviz < Formula
  desc "Graphical RNA secondary structure comparison multi-tool"
  homepage "https://github.com/gtDMMB/RNAStructViz/wiki"
  url "https://github.com/gtDMMB/RNAStructViz/archive/v2.1.2-testing.tar.gz"
  sha256 "f53911ade0a5eacf4de02f06f552b9fedb8527fbf5d93c198e4e9146dc1281aa"
  version "v2.1.2-testing"
  revision 1
  
  bottle :unneeded
  
  depends_on "gtDMMB/core/fltkwithcairo"
  depends_on "gtDMMB/core/viennarna"
  depends_on "pkg-config"
  depends_on "curl"
  depends_on "coreutils"
  depends_on "grep"
  depends_on "gnu-sed"
  depends_on "openssl"
  depends_on "boost"

  def install
    system "make"
    system "mv", "macos-application/RNAStructViz.app", "macos-application/RNAStructViz"
    system "cp", "src/RNAStructViz", "macos-application/RNAStructViz/Contents/MacOS/"
    system "cp", "-R", "macos-application/RNAStructViz", "macos-application/RNAStructViz.app"
    bin.install "src/RNAStructViz"
    prefix.install Dir["sample-structures"]
    prefix.install "macos-application/RNAStructViz.app"
  end
  
  def caveats; <<~EOS
    See RNAStructViz WIKI docs https://github.com/gtDMMB/RNAStructViz/wiki/FirstRunInstructions. 
    If your brew environment is configured correctly. you can now run RNAStructViz at your terminal.
  EOS
  end

  test do
    system "false"
  end
end
