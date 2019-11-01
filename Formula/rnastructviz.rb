class Rnastructviz < Formula
  desc "Graphical RNA secondary structure comparison tool"
  homepage "https://github.com/gtDMMB/RNAStructViz/wiki"
  url "https://github.com/gtDMMB/RNAStructViz/archive/v1.7.8-testing.tar.gz"
  sha256 "1eae84f6fbc1b6aa7a26f9d5a0e7a1cf5d16b4e20156dd3e18ea195358ba0412"
  version "v1.7.8-testing"
  revision 5
  
  depends_on "gtDMMB/core/fltkwithcairo"
  depends_on "gtDMMB/core/viennarna"
  depends_on "pkg-config"
  depends_on "curl"
  depends_on "coreutils"
  depends_on "openssl"
  depends_on "llvm@8"

  def install
    system "make"
    bin.install "src/RNAStructViz"
    prefix.install Dir["sample_structures"]
  end

  test do
    system "false"
  end
end
