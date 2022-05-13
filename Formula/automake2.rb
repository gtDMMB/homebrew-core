class Automake2 < Formula
  
  desc "A custom version of automake known to work with the build scripts for gtDMMB/core/gtfoldpython"
  url "ftp://ftp.gnu.org/gnu/automake/automake-1.16.2.tar.gz"
  version "1.16.2"
  sha256 "b2f361094b410b4acbf4efba7337bdb786335ca09eb2518635a09fb7319ca5c1"
  revision 1
  
  def install
    system "./configure"
    system "make"
    bin.install "bin/automake"
    bin.install "bin/aclocal"
    bin.install "bin/aclocal-1.16"
    bin.install "bin/automake-1.16"
  end
  
  test do
    system "false"
  end
  
end
