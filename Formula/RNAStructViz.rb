class RNAStructViz < Formula
  desc "CT file viewer and RNA structure comparison tool"
  homepage "https://github.com/gtDMMB/RNAStructViz"
  url "https://github.com/gtDMMB/RNAStructViz/releases/download/v1.1-with-cairo/RNAStructViz-source.tar.gz"
  version "v1.1-with-cairo (prerelease)"
  sha256 "09ea8ae57aa5a5c0e017607d69e4beba0227181e431a9cbb54c1dfa5d082e3b3"

  depend_on "gtDMMB/core/fltkwithcairo"
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
