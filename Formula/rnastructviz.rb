class Rnastructviz < Formula
  desc "Graphical RNA secondary structure comparison multi-tool"
  homepage "https://github.com/gtDMMB/RNAStructViz/wiki"
  url "https://github.com/gtDMMB/RNAStructViz/archive/v1.9.4-testing.tar.gz"
  sha256 "a201c6c4e7d6697ce1d0e242b7792ff7284099427955ac33f12676a141aab8ca"
  version "v1.9.4-testing"
  revision 1
  
  depends_on "gtDMMB/core/fltkwithcairo"
  depends_on "gtDMMB/core/viennarna"
  depends_on "pkg-config"
  depends_on "curl"
  depends_on "coreutils"
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
