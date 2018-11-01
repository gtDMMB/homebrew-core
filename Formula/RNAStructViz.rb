class Rnastructviz < Formula
  desc "CT file viewer and RNA structure comparison tool"
  homepage "https://github.com/gtDMMB/RNAStructViz"
  url "https://github.com/gtDMMB/RNAStructViz/releases/download/v1.1-with-cairo/RNAStructViz-source-v4.tar.gz"
  version "1.1-v4-with-cairo"
  sha256 "f98141151dc15abc954e514d3e76a477408e648a9dc38ec75419ea270cacdd40"

  depends_on "gtDMMB/core/fltkwithcairo"
  depends_on "pkg-config"
  depends_on "git"
  depends_on "coreutils"

  def install
    system "make", "clean"
    system "make"
    system "make", "install", "INSTALL_PREFIX=#{prefix}"
  end

  test do
    system "false"
  end
end
