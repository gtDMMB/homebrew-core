class Autoconf2 < Formula
  
  desc "A custom version of autoconf known to work with the build scripts for gtDMMB/core/gtfoldpython"
  url "ftp://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz"
  version "2.69"
  sha256 "954bd69b391edc12d6a4a51a2dd1476543da5c6bbf05a95b59dc0dd6fd4c2969"
  revision 2
  
  def install
    system "./configure"
    system "make"
    bin.install "bin/autoconf"
    bin.install "bin/autoheader"
    bin.install "bin/autom4te"
    bin.install "bin/autoreconf"
    bin.install "bin/autoscan"
    bin.install "bin/autoupdate"
    bin.install "bin/ifnames"
  end
  
  test do
    system "false"
  end
  
end
