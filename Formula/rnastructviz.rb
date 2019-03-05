class Rnastructviz < Formula
  desc "CT file viewer and graphical RNA structure comparison tool"
  homepage "https://github.com/gtDMMB/RNAStructViz/wiki"
  url "https://github.com/gtDMMB/RNAStructViz/archive/v1.4.1-testing.tar.gz"
  sha256 "5b1b60a7541271f8409d7a88fad9cd9d33e6dca5b0aa263a86716edbb0cbf8e9"
  version "v1.4.2-testing"
  revision 1

  depends_on "gtDMMB/core/fltkwithcairo"
  depends_on "pkg-config"
  depends_on "git"
  depends_on "curl"
  depends_on "coreutils"
  
  option :universal
  option "with-clang", "Use the *clang* compiler instead of the default gcc"

  def install
    makeExportPrefix = ""
    makeExportPrefix << "STRUCTVIZ_COMPILER=clang++" if build.with? "clang"
    system "git", "clone", "https://github.com/gtDMMB/RNAStructViz.git"
    Dir.chdir("RNAStructViz")
    system "make", "clean"
    system makeExportPrefix, "make"
    system "make", "install", "INSTALL_PREFIX=#{prefix}"
  end

  test do
    system "false"
  end
end
