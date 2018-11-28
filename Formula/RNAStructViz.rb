class Rnastructviz < Formula
  desc "CT file viewer and RNA structure comparison tool"
  homepage "https://github.com/gtDMMB/RNAStructViz"
  url "https://api.github.com/repos/gtDMMB/RNAStructViz/tarball/v1.2-snapshot-beta"
  version "v1.2-snapshot-beta"
  revision 1

  depends_on "gtDMMB/core/fltkwithcairo"
  depends_on "pkg-config"
  depends_on "git"
  depends_on "curl"
  depends_on "coreutils"

  def install
    latestRevCommitSHA = "f49a506e7b6b420cbe67a65e1538f5a0162ff850"
    system "git", "clone", "https://github.com/gtDMMB/RNAStructViz.git"
    Dir.chdir("RNAStructViz")
    system "git", "fetch", "origin", latestRevCommitSHA
    system "git", "reset", "--hard", "FETCH_HEAD"
    system "git", "checkout", "with-cairo"
    system "make", "clean"
    system "make"
    system "make", "install", "INSTALL_PREFIX=#{prefix}"
  end

  test do
    system "false"
  end
end
