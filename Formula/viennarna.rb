class Viennarna < Formula
  desc "ViennaRNA and RNAlib: Prediction and comparison of RNA secondary structures"
  homepage "https://www.tbi.univie.ac.at/RNA/"
  url "https://www.tbi.univie.ac.at/RNA/download/sourcecode/2_4_x/ViennaRNA-2.4.11.tar.gz"
  sha256 "0a8acfc3445da2dbdb42bd306ecdaf44e26ab40ca58987b6917c3899ef9bf310"
  version "2.4.11"
  revision 18

  depends_on "pkg-config"
  depends_on "mpfr"
  depends_on "wget"
  depends_on "gsl"

  bottle do
    root_url "https://homebrew.bintray.com/bottles-core"
    cellar :any
    sha256 "4a09dda7db4153746874f81519fbd00769ef82c830a097466389d2ddb6834622" => :mojave
  end
  
  def install
    system "wget", "https://www.tbi.univie.ac.at/RNA/download/sourcecode/2_4_x/ViennaRNA-2.4.11.tar.gz"
    system "tar", "xvzf", "ViennaRNA-2.4.11.tar.gz"
    Dir.chdir("ViennaRNA-2.4.11")
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
