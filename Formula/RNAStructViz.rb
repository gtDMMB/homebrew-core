class Rnastructviz < Formula
  desc "CT file viewer and RNA structure comparison tool"
  homepage "https://github.com/gtDMMB/RNAStructViz"
  url "https://api.github.com/repos/gtDMMB/RNAStructViz/tarball/v1.2-snapshot-beta"
  sha256 "7724b875c2b9ec70f9677be18bc1fe496ec25cd72707171595b12b16a8ceafb2"
  version "v1.2-snapshot-beta"
  revision 2

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
    system "make", "clean"
    system "git", "fetch", "origin", "with-cairo"
    system "git", "reset", "--hard", "FETCH_HEAD"
    system "make"
    Dir.chdir("src/")
    system "mv", "RNAStructViz", "RNAStructViz-unstable-latest"
    system "sed", "-i", "mkout",
           "s/BINARY_OUTPUT=RNAStructViz/BINARY_OUTPUT=RNAStructViz-unstable-latest/", "Makefile"
    Dir.chdir("../")    
    system "make", "install", "INSTALL_PREFIX=#{prefix}"
  end

  test do
    system "false"
  end
end
