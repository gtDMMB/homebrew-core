class Fltkwithcairo < Formula
  desc "Latest non-stable branch of FLTK *with* Cairo and Apple-specific support enabled"
  homepage "https://www.fltk.org/software.php?VERSION=1.4.x"
  url "https://www.fltk.org/pub/fltk/snapshots/fltk-1.4.x-20191115-ee9ada96.tar.gz"
  version "fltk-1.4.x-20191115-ee9ada96"
  sha256 "cfff34dd75a17fb41c49d06724e74ef6bdf83b01556f430037b9314f2910b2fa"
  revision 2

  depends_on "wget"
  depends_on "libffi"
  depends_on "cairo"
  depends_on "jpeg"
  depends_on "libpng"
  
  def install
    archcmd = "uname -m"
    sysarch = `#{archcmd}`.tr("\n", "")
    compiler_flags = " -g -DBUILD_SHARED_LIBS -D__APPLE__"
    swversion = `#{"sw_vers"}`.tr("\n", "");
    if swversion[3..4].ord >= 14
      compiler_flags += " -DROTATE";
    end
    include_flags = " -I /usr/local/opt/cairo/include/cairo"
    config_args = [
      "--prefix=#{prefix}",
      "--enable-cairo",
      "--enable-cairoext",
      #"--disable-x11",
      "--enable-debug",
      "--enable-threads",
      "CC=clang" + compiler_flags + " -arch " + sysarch + include_flags,
      "CXX=clang++" + compiler_flags + " -arch " + sysarch + include_flags,
      "CFLAGS=-march=skylake-avx512 -Wa,-march=skylake-avx512 -march=native" # -m64"
    ]
    system "make", "clean"
    system "./configure", *config_args
    system "make", "install"
  end

  test do
    system "false"
  end
end
