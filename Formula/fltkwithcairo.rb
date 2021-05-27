class Fltkwithcairo < Formula
  desc "Latest non-stable branch of FLTK *with* Cairo and Apple-specific support enabled"
  homepage "https://www.fltk.org/software.php?VERSION=1.4.x"
  url "https://github.com/gtDMMB/homebrew-core/raw/master/LocalPatches/fltk-1.4.x-20210514-cbee4880.tar.gz"
  version "fltk-1.4.x-20210514-cbee4880"
  #sha256 "158798350391552af635c73b99e085367d1a8f58525503bfab94134583e8e15c"
  revision 5

  depends_on "wget"
  depends_on "libffi"
  depends_on "cairo"
  depends_on "jpeg"
  depends_on "libpng"
  
  def install
    archcmd = "uname -m"
    sysarch = `#{archcmd}`.tr("\n", "")
    compiler_flags = " -g -DBUILD_SHARED_LIBS -D__APPLE__ -D__APPLE_QUARTZ__"
    swversion = `#{"sw_vers"}`.tr("\n", "");
    if swversion[3..4].ord >= 14
      compiler_flags += " -DROTATE";
    end
    include_flags = " -I /usr/local/opt/cairo/include/cairo"
    config_args = [
      "--prefix=#{prefix}",
      "--enable-cairo",
      "--disable-debug",
      "--enable-threads",
      "CC=clang" + compiler_flags + " -arch " + sysarch + include_flags,
      "CXX=clang++" + compiler_flags + " -arch " + sysarch + include_flags,
      "CFLAGS=-mprefer-vector-width=256 -march=native -Wa,-march=native -m64"
      #"CFLAGS=-march=skylake-avx512 -Wa,-march=skylake-avx512 -march=native -m64"
    ]
    system "make", "clean"
    system "./configure", *config_args
    system "make", "install"
  end

  test do
    system "false"
  end
end
