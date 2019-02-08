class Rnastructviz < Formula
  desc "CT file viewer and graphical RNA structure comparison tool"
  homepage "https://github.com/gtDMMB/RNAStructViz/wiki"
  url "https://github.com/gtDMMB/RNAStructViz/archive/v1.3.3-production.tar.gz"
  sha256 "4a6cf96300c57dc04cf76970b7454030a983153c60fcbc3593f3fb941f15bace"
  version "v1.3.3-production"
  revision 1

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
