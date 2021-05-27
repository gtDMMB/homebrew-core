class Viennarna < Formula
  desc "ViennaRNA and RNAlib: Prediction and comparison of RNA secondary structures"
  homepage "https://www.tbi.univie.ac.at/RNA/"
  url "https://github.com/gtDMMB/homebrew-core/raw/master/LocalPatches/ViennaRNA-2.4.14-smaller.tar.gz"
  sha256 "5b4aead3de5bec4804d42d814101aeec846d260dbdb782cfe4e1cc038fce0c54"
  version "2.4.14"
  revision 7

  depends_on "pkg-config"
  depends_on "mpfr"
  depends_on "wget"
  depends_on "gsl"
  
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
      "CC=/usr/bin/gcc", 
      "CXX=/usr/bin/g++",
      "CFLAGS=-march=skylake-avx512 -Wa,-march=skylake-avx512 -march=native -m64"
    system "make"
    ENV.deparallelize
    system "make", "install"
  end
end
