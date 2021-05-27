class Viennarna < Formula
  desc "ViennaRNA and RNAlib: Prediction and comparison of RNA secondary structures"
  homepage "https://www.tbi.univie.ac.at/RNA/"
  url "https://www.tbi.univie.ac.at/RNA/download/sourcecode/2_4_x/ViennaRNA-2.4.14.tar.gz"
  version "2.4.14"
  revision 24

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
    gsl_pkgconfig = "pkg-config gsl --cflags --libs"
    gsl_includes = `#{gsl_pkgconfig}`.tr("\n", "") + " "
    mpfr_pkgconfig = "pkg-config mpfr --cflags --libs"
    mpfr_includes = `#{mpfr_pkgconfig}`.tr("\n", "") + " "
    gmp_pkgconfig = "pkg-config gmp --cflags --libs"
    gmp_includes = `#{gmp_pkgconfig}`.tr("\n", "") + " "
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
      "--without-doc",
      "--without-tutorial",
      "--prefix=#{prefix}",
      "CC=/usr/bin/gcc " + gsl_includes + mpfr_includes + gmp_includes, 
      "CXX=/usr/bin/g++ " + gsl_includes + mpfr_includes + gmp_includes,
      "CFLAGS=" + cflags
    system "make"
    ENV.deparallelize
    system "make", "install"
  end
end
