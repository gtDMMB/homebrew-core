class Rnastructviz < Formula
  desc "Graphical RNA secondary structure comparison multi-tool"
  homepage "https://github.com/gtDMMB/RNAStructViz/wiki"
  url "https://github.com/gtDMMB/RNAStructViz/archive/v2.0.0-testing.tar.gz"
  sha256 "305b36ef14902d70435789d9c256901e4bbc5effab813d153a7bb7b67fc2bd04"
  version "v2.0.0-testing"
  revision 1
  
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
    bin.install "src/RNAStructViz"
    prefix.install Dir["sample-structures"]
  end

  test do
    system "false"
  end
end
