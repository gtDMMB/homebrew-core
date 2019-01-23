class Rnastructviz < Formula
  desc "CT file viewer and RNA structure comparison tool"
  homepage "https://github.com/gtDMMB/RNAStructViz"
  url "https://github.com/gtDMMB/RNAStructViz/archive/v1.3-production.tar.gz"
  sha256 "5b68367474b77a8af8b675ef1831a0e920a42476051e646d5021055ad50e2a24"
  version "v1.3-production"
  revision 2

  depends_on "gtDMMB/core/fltkwithcairo"
  depends_on "pkg-config"
  depends_on "git"
  depends_on "curl"
  depends_on "coreutils"

  def install
    system "git", "clone", "https://github.com/gtDMMB/RNAStructViz.git"
    Dir.chdir("RNAStructViz")
    system "make", "clean"
    system "make"
    system "make", "install", "INSTALL_PREFIX=#{prefix}"
  end

  test do
    system "false"
  end
end
