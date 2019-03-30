class Rnastructviz < Formula
  desc "CT file viewer and graphical RNA structure comparison tool"
  homepage "https://github.com/gtDMMB/RNAStructViz/wiki"
  url "https://github.com/gtDMMB/RNAStructViz/archive/v1.5.0-testing.tar.gz"
  sha256 "d4e73ab4a2e93241c280df73745273186a34bae80b64cffaa0d5b13f5c72a1e2"
  version "v1.5.0-testing"
  revision 3

  depends_on "gtDMMB/core/fltkwithcairo"
  depends_on "gtDMMB/core/viennarna"
  depends_on "pkg-config"
  depends_on "curl"
  depends_on "coreutils"
  
  #bottle do
  #  root_url "https://homebrew.bintray.com/bottles-core"
  #  cellar :any
  #  sha256 "ea3c8cf3270c5dcc38eb9480cb5475c6f87b9d1ebdd7c9fa10aded6279d166a7" => :mojave
  #end
  
  #option :universal
  option "with-clang", "Use the *clang* compiler instead of the default gcc"

  def install
    makeExportPrefix = ""
    makeExportPrefix << "STRUCTVIZ_COMPILER=clang++" if build.with? "clang"
    #system "git", "clone", "https://github.com/gtDMMB/RNAStructViz.git"
    #Dir.chdir("RNAStructViz")
    #system "git", "reset", "--hard", version
    system "make", "clean"
    if makeExportPrefix != ""
      system makeExportPrefix, "make"
    elsif
      system "make", "install", "INSTALL_PREFIX=#{prefix}"
    end
  end

  test do
    system "false"
  end
end
