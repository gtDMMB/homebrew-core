class Rnastructviz < Formula
  desc "CT file viewer and RNA structure comparison tool"
  homepage "https://github.com/gtDMMB/RNAStructViz"
  url "https://github.com/gtDMMB/RNAStructViz/releases/download/v1.1-with-cairo/RNAStructViz-source.tar.gz"
  version "1.1-with-cairo"
  sha256 "2064315389d62021b62c1d354df4dbf58f15811ae0a904081fd4f4562841ba98"

  depends_on "gtDMMB/core/fltkwithcairo"
  depends_on "pkg-config"
  depends_on "git"
  depends_on "coreutils"

  def install
    system "make", "clean"
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
