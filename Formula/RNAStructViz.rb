class Rnastructviz < Formula
  desc "CT file viewer and RNA structure comparison tool"
  homepage "https://github.com/gtDMMB/RNAStructViz"
  url "https://github.com/gtDMMB/RNAStructViz/releases/download/v1.1-with-cairo/RNAStructViz-source-v2.tar.gz"
  version "1.1-with-cairo"
  sha256 "802a809406cf41c28f86b8e602e1a950fd3af12f866ab907b9cc7a1619f7ac9b"

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
