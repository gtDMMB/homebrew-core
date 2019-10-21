class Rnastructviz < Formula
  desc "Graphical RNA secondary structure comparison tool"
  homepage "https://github.com/gtDMMB/RNAStructViz/wiki"
  url "https://github.com/gtDMMB/RNAStructViz/archive/v1.7.3-testing.tar.gz"
  sha256 "a4ee6c6bbc9a1c1b97891d9a8cb72beee34123af8fa50e94b653404066e30b13"
  version "v1.7.3-testing"
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
