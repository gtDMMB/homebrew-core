class Rnastructviz < Formula
  desc "Graphical RNA secondary structure comparison tool"
  homepage "https://github.com/gtDMMB/RNAStructViz/wiki"
  url "https://github.com/gtDMMB/RNAStructViz/archive/v1.8.1-testing.tar.gz"
  sha256 "ac7943e95d394860de5036a714a6da7af40e05bfa4bbe35cb3f779f11e4c8565"
  version "v1.8.1-testing"
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
    prefix.install Dir["sample_structures"]
  end

  test do
    system "false"
  end
end
