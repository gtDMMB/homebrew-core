class Rnastructviz < Formula
  desc "Graphical RNA secondary structure comparison tool"
  homepage "https://github.com/gtDMMB/RNAStructViz/wiki"
  url "https://github.com/gtDMMB/RNAStructViz/archive/v1.7.6-testing.tar.gz"
  sha256 "15c96371fece9e478dedf5ca630cb0bc05fa12c0dc7db47789e81b0713a9bff8"
  version "v1.7.6-testing"
  revision 2
  
  depends_on "gtDMMB/core/fltkwithcairo"
  depends_on "gtDMMB/core/viennarna"
  depends_on "pkg-config"
  depends_on "curl"
  depends_on "coreutils"
  depends_on "openssl"

  def install
    system "make"
    #system "CXX=g++-8 make"
    bin.install "src/RNAStructViz"
    prefix.install Dir["sample_structures"]
  end

  test do
    system "false"
  end
end
