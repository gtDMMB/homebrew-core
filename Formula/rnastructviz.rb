class Rnastructviz < Formula
  desc "CT file viewer and graphical RNA structure comparison tool"
  homepage "https://github.com/gtDMMB/RNAStructViz/wiki"
  url "https://github.com/gtDMMB/RNAStructViz/archive/v1.5.1-testing.tar.gz"
  sha256 "b6bf6d31f039630335322b0884af27b352ddb547b6a21c551649fa05422404e1"
  version "v1.5.1-testing"
  revision 2

  depends_on "gtDMMB/core/fltkwithcairo"
  depends_on "gtDMMB/core/viennarna"
  depends_on "pkg-config"
  depends_on "curl"
  depends_on "coreutils"
  
  bottle do
    root_url "https://homebrew.bintray.com/bottles-core"
    cellar :any
    sha256 "1a5341c3d05288676cda1b9bcd5199d12cb033bb3142e40fed7712f01f28eadd" => :mojave
  end
  
  option "with-clang", "Use the *clang* compiler instead of the default gcc"

  def install
    makeExportPrefix = ""
    makeExportPrefix << "STRUCTVIZ_COMPILER=clang++" if build.with? "clang"
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
