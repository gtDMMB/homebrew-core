class Rnastructviz < Formula
  desc "Graphical RNA secondary structure comparison multi-tool"
  homepage "https://github.com/gtDMMB/RNAStructViz/wiki"
  url "https://github.com/gtDMMB/RNAStructViz/archive/v1.9.2-testing.tar.gz"
  sha256 "36883689888968b85468a5d25a51cef270b0ec47f0e141efe486a5b7a5adfd52"
  version "v1.9.2-testing"
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
