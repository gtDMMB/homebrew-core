class Fltkwithcairo < Formula
  desc "Latest non-stable branch of FLTK *with* Cairo and Apple-specific support enabled"
  homepage "https://www.fltk.org/software.php?VERSION=1.4.x"
  url "https://github.com/gtDMMB/homebrew-core/raw/master/LocalPatches/fltk-1.4.x-20200124-59295b52.tar.bz2"
  version "fltk-1.4.x-20200124-59295b52"
  sha256 "363997fa7b7e30c962530c3b7e1f0db4fa067996054326a2a6e02d557482bd42"
  revision 9

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
    cflags_x86_64 = "-march=skylake-avx512 -Wa,-march=skylake-avx512 -march=native -m64"
    cflags_other = "-mprefer-vector-width=256 -march=native -Wa,-march=native -m64"
    cflags = cflags_other
    if sysarch == "x86_64"
      cflags = cflags_x86_64
    end
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
      "CFLAGS=" + cflags
    ]
    system "make", "clean"
    system "./configure", *config_args
    system "make", "install"
  end

  test do
    system "false"
  end
end
