class Rnastructviz < Formula
  desc "CT file viewer and RNA structure comparison tool"
  homepage "https://github.com/gtDMMB/RNAStructViz"
  url "https://github.com/gtDMMB/RNAStructViz/releases/download/v1.1-with-cairo/RNAStructViz-source-v3.tar.gz"
  version "1.1-with-cairo"
  sha256 "98739e2c83969d9cb96e5c01a3b6fe1709321ceb488ea19ce5c5724f7634663f"

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
