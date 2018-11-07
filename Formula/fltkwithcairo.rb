class Fltkwithcairo < Formula
  desc "Latest non-stable branch of FLTK *with* Cairo support enabled"
  homepage "http://www.fltk.org/"
  url "http://fltk.org/pub/fltk/snapshots/fltk-1.4.x-r13107.tar.bz2"
  version "1.4.x-r13107"
  sha256 "5193a66ae1f07d477d7c26f78f3b6389594e870fd3f71dbc572ed8fcf776daf6"

  depends_on "wget"
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
      "--enable-threads",
      "CC=clang" + compiler_flags + " -arch " + sysarch + include_flags,
      "CXX=clang++" + compiler_flags + " -arch " + sysarch + include_flags,
    ]
    system "wget", "https://raw.githubusercontent.com/gtDMMB/homebrew-core/master/LocalPatches/cairomojaveV4.patch"
    system "make", "clean"
    system "./configure", *config_args
    system "patch", "-p0", "src/Fl_cocoa.mm", "cairomojaveV4.patch"
    system "make", "install"
  end

  test do
    system "false"
  end
end
