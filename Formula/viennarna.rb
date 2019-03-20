class Viennarna < Formula
  desc "ViennaRNA and RNAlib: Prediction and comparison of RNA secondary structures"
  homepage "https://www.tbi.univie.ac.at/RNA/"
  url "https://www.tbi.univie.ac.at/RNA/download/sourcecode/2_4_x/ViennaRNA-2.4.11.tar.gz"
  sha256 "0a8acfc3445da2dbdb42bd306ecdaf44e26ab40ca58987b6917c3899ef9bf310"
  version "2.4.11"
  revision 12

  fails_with :clang # needs OpenMP

  depends_on "gcc" if OS.mac? # for OpenMP
  #depends_on "python@2"
  depends_on "pkg-config"
  depends_on "mpfr"
  depends_on "wget"
  depends_on "autoconf"

  def install
    #system "autoreconf", "-v"
    #system "make", "clean"
    system "wget", "https://www.tbi.univie.ac.at/RNA/download/sourcecode/2_4_x/ViennaRNA-2.4.11.tar.gz"
    system "tar", "xvzf", "ViennaRNA-2.4.11.tar.gz"
    Dir.chdir("ViennaRNA-2.4.11")
    system "./configure", "-v",
      "--disable-debug",
      "--disable-dependency-tracking",
      "--disable-openmp",
      "--enable-static-executables",
      "--without-python", 
      "--without-python3", 
      "--without-perl",
      "--prefix=#{prefix}",
      "CC=gcc", 
      "CXX=g++"
    system "make"
    #ENV.deparallelize
    system "make", "install"
  end
end
