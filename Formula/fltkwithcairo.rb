class Fltkwithcairo < Formula
  desc "Latest non-stable branch of FLTK *with* Cairo support enabled"
  homepage "http://www.fltk.org/"
  url "https://www.fltk.org/pub/fltk/snapshots/fltk-1.4.x-20190329-7a3af40e.tar.gz"
  version "1.4.x-20190329-7a3af40e"
  sha256 "b55dbf3268c3daa2dbaed60b44e14960bb5ae0ef7155b5d05b348edc35ae08cd"
  revision 5

  depends_on "wget"
  depends_on "libffi"
  depends_on "cairo"
  depends_on "jpeg"
  depends_on "libpng"

  #bottle do
  #  root_url "https://homebrew.bintray.com/bottles-core"
  #  sha256 "4b379d7121c831032bf837b4d640694daff77186e01a41483a26c672b15ecc22" => :mojave
  #end
  
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
      "CC=clang" + compiler_flags + " -arch " + sysarch + include_flags,
      "CXX=clang++" + compiler_flags + " -arch " + sysarch + include_flags,
      "CFLAGS=-march=skylake-avx512 -Wa,-march=skylake-avx512 -march=native" # -m64"
    ]
    #system "wget", "https://raw.githubusercontent.com/gtDMMB/homebrew-core/master/LocalPatches/cairomojaveV4.patch"
    #system "wget", "https://raw.githubusercontent.com/gtDMMB/homebrew-core/master/LocalPatches/cairomojaveV6.patch"
    system "make", "clean"
    system "./configure", *config_args
    #system "patch", "-p0", "src/Fl_cocoa.mm", "cairomojaveV4.patch"
    #system "patch", "-p0", "cairo/Fl_Cairo.cxx", "cairomojaveV6.patch"
    system "make", "install"
  end

  test do
    system "false"
  end
end
