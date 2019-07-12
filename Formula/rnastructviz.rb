class Rnastructviz < Formula
  desc "Graphical RNA secondary structure comparison tool"
  homepage "https://github.com/gtDMMB/RNAStructViz/wiki"
  url "https://github.com/gtDMMB/RNAStructViz/archive/v1.6.7-testing.tar.gz"
  sha256 "64d131ddd476a66bf06c438e7d2dc860a6b12f6db958c41ba93988e03ac7c7a0"
  version "v1.6.7-testing"
  revision 5

  depends_on "gtDMMB/core/fltkwithcairo"
  depends_on "gtDMMB/core/viennarna"
  depends_on "pkg-config"
  depends_on "curl"
  depends_on "coreutils"

  def install
    system "make"
    bin.install "src/RNAStructViz"
    prefix.install Dir["sample_structures"]
  end

  test do
    system "false"
  end
end
