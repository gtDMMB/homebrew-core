class Rnastructviz < Formula
  desc "CT file viewer and graphical RNA structure comparison tool"
  homepage "https://github.com/gtDMMB/RNAStructViz/wiki"
  url "https://github.com/gtDMMB/RNAStructViz/archive/v1.3.7-production.tar.gz"
  sha256 "f32c53c1fea71398ad6b2ab67910672da93cadb78e03add39e0d56095ca9c1a9"
  version "v1.3.7-production"
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
