class Rnastructviz < Formula
  desc "Graphical RNA secondary structure comparison multi-tool"
  homepage "https://github.com/gtDMMB/RNAStructViz/wiki"
  url "https://github.com/gtDMMB/RNAStructViz/archive/v1.9.7-testing.tar.gz"
  sha256 "35e1c62ecea87233a5700b5790373bba66bd6089ebc9a9321a9b3b9c7aa2b899"
  version "v1.9.7-testing"
  revision 2
  
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
