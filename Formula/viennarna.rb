class Viennarna < Formula
  desc "ViennaRNA and RNAlib: Prediction and comparison of RNA secondary structures"
  homepage "https://www.tbi.univie.ac.at/RNA/"
  url "https://www.tbi.univie.ac.at/RNA/download/sourcecode/2_4_x/ViennaRNA-2.4.14.tar.gz"
  #sha256 "ba9cfc8a48e457fc891628f3229a3924de31714460dc4a4dec081868f802cc28"
  version "2.4.14"
  revision 2

  depends_on "pkg-config"
  depends_on "mpfr"
  depends_on "wget"
  depends_on "gsl"
  depends_on "gcc@8"
  
  def install
    system "wget", "https://www.tbi.univie.ac.at/RNA/download/sourcecode/2_4_x/ViennaRNA-2.4.14.tar.gz"
    system "tar", "xvzf", "ViennaRNA-2.4.14.tar.gz"
    Dir.chdir("ViennaRNA-2.4.14")
    system "./configure", "-v",
      "--disable-debug",
      "--disable-dependency-tracking",
      "--without-python", 
      "--without-python3", 
      "--without-perl",
      "--disable-openmp",
      "--prefix=#{prefix}",
      #"CC=/usr/bin/gcc", 
      #"CXX=/usr/bin/g++",
      "CC=gcc-8",
      "CXX=g++-8",
      "CFLAGS=-march=skylake-avx512 -Wa,-march=skylake-avx512 -march=native" # -m64"
    system "make"
    ENV.deparallelize
    system "make", "install"
  end
end
