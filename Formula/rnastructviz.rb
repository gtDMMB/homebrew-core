class Rnastructviz < Formula
  desc "Graphical RNA secondary structure comparison tool"
  homepage "https://github.com/gtDMMB/RNAStructViz/wiki"
  url "https://github.com/gtDMMB/RNAStructViz/archive/v1.7.2-testing.tar.gz"
  sha256 "c5dad49e9085d931cde3fef88fbb9b9ea6a3a00c9c9f9f34f5711019509b438e"
  version "v1.7.2-testing"
  revision 1

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
