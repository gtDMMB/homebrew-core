class Fltkwithcairo < Formula
  desc "Latest non-stable branch of FLTK *with* Cairo and Apple-specific support enabled"
  homepage "http://www.fltk.org/"
  url "https://www.fltk.org/pub/fltk/snapshots/fltk-1.4.x-20191025-4f8e692f.tar.gz"
  version "fltk-1.4.x-20191025-4f8e692f"
  sha256 "718a6469326c4b826c21434e3fe52b3aa911f57a93e8a935b0827c828a71e53b"
  revision 1

  depends_on "wget"
  depends_on "libffi"
  depends_on "cairo"
  depends_on "jpeg"
  depends_on "libpng"
  depends_on "gcc@8"
  
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
      "--enable-threads",
      #"CC=clang" + compiler_flags + " -arch " + sysarch + include_flags,
      #"CXX=clang++" + compiler_flags + " -arch " + sysarch + include_flags,
      "CC=gcc-8" + compiler_flags + " -arch " + sysarch + include_flags,
      "CXX=g++-8" + compiler_flags + " -arch " + sysarch + include_flags,
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
