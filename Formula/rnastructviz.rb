class Rnastructviz < Formula
  desc "Graphical RNA secondary structure comparison multi-tool"
  homepage "https://github.com/gtDMMB/RNAStructViz/wiki"
  url "https://github.com/gtDMMB/RNAStructViz/archive/refs/tags/v2.4.14-v2-stable.tar.gz"
  sha256 "f202cf22de32fcd97e005b580789a8380ab900cdeda22a59433e554554da60c3"
  version "v2.4.14-stable"
  revision 7
  
  bottle :unneeded
  
  depends_on "gtDMMB/core/fltkwithcairo"
  depends_on "gtDMMB/core/viennarna"
  depends_on "pkg-config"
  depends_on "curl"
  depends_on "coreutils"
  depends_on "grep"
  depends_on "gnu-sed"
  depends_on "openssl@1.1"
  depends_on "boost"

  def install
    system "CFLAGS=\"\" CXXFLAGS=\"\" LDFLAGS=\"\" make"
    system "mv", "macos-application/RNAStructViz.app", "macos-application/RNAStructViz"
    system "cp", "src/RNAStructViz", "macos-application/RNAStructViz/Contents/MacOS/"
    system "cp", "-R", "macos-application/RNAStructViz", "macos-application/RNAStructViz.app"
    bin.install "src/RNAStructViz"
    prefix.install Dir["sample-structures"]
    prefix.install "macos-application/RNAStructViz.app"
  end
  
  def caveats; <<~EOS
    See RNAStructViz WIKI docs https://github.com/gtDMMB/RNAStructViz/wiki/FirstRunInstructions. 
    If your brew environment is configured correctly, you can now run `RNAStructViz` at your terminal.
  EOS
  end

  test do
    system "false"
  end
end
