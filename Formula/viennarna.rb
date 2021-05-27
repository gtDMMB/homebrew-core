class Viennarna < Formula
  desc "ViennaRNA and RNAlib: Prediction and comparison of RNA secondary structures"
  homepage "https://www.tbi.univie.ac.at/RNA/"
  url "https://github.com/gtDMMB/homebrew-core/raw/master/LocalPatches/ViennaRNA-2.4.14-smaller.tar.gz"
  sha256 "2708a4899755ab8dad216b3644e32615535812e44b522696f51b839d66bae810"
  version "2.4.14"
  revision 13

  depends_on "pkg-config"
  depends_on "mpfr"
  depends_on "wget"
  depends_on "gsl"
  
  def install
    archcmd = "uname -m"
    sysarch = `#{archcmd}`.tr("\n", "")
    cflags_x86_64 = "-march=skylake-avx512 -Wa,-march=skylake-avx512 -march=native -m64"
    cflags_other = "-mprefer-vector-width=256 -march=native -Wa,-march=native -m64"
    cflags = cflags_other
    if sysarch == "x86_64"
      cflags = cflags_x86_64
    end
    system "wget", "https://github.com/gtDMMB/homebrew-core/raw/master/LocalPatches/ViennaRNA-2.4.14-smaller.tar.gz"
    system "tar", "xvzf", "ViennaRNA-2.4.14-smaller.tar.gz"
    
    Dir.chdir("ViennaRNA-2.4.14")
    system "./configure", "-v",
      "--disable-debug",
      "--disable-dependency-tracking",
      "--without-python", 
      "--without-python3", 
      "--without-perl",
      "--disable-openmp",
      "--without-doc",
      "--without-tutorial",
      "--prefix=#{prefix}",
      "CC=/usr/bin/gcc", 
      "CXX=/usr/bin/g++",
      "CFLAGS=" + cflags
    system "make"
    ENV.deparallelize
    system "make", "install"
  end
end
