class Fltkwithcairo < Formula
  desc "Latest non-stable branch of FLTK *with* Cairo and Apple-specific support enabled"
  homepage "https://www.fltk.org/software.php"
  url "https://github.com/gtDMMB/homebrew-core/raw/master/LocalPatches/fltk-1.3.8-source-patched.tar.bz2"
  version "fltk-1.3.8-source-patched"
  sha256 "158ea9857623d73a3d9303c455266f055043dfd746e344f316a69fd2d4a5802d"
  revision 14

  # To maintainers: If this brew package becomes deprecated, replace the @12 with @MORE_RECENT_VERSION
  #                 throughout this formula.
  depends_on "cairo"
  depends_on "jpeg"
  depends_on "libffi"
  depends_on "libpng"
  depends_on "llvm@12"
  depends_on :macos
  depends_on "wget"

  def install
    macos_cc = "clang"
    macos_cxx = "clang++"
    macos_base_cflags = ""
    macos_ld = "ld"
    macos_base_ldflags = ""
    if MacOS.version >= :catalina
      llvm_path = "$(brew --prefix llvm@12)" + "/"
      macos_base_cflags = "-stdlib=libc++ -nostdinc++ -I" + llvm_path + "include/c++/v1 "
      macos_base_ldflags = "-L" + llvm_path + "lib -Wl,-rpath," + llvm_path + "lib "
    end
    archcmd = "uname -m"
    sysarch = `#{archcmd}`.tr("\n", "")
    compiler_flags = " -g -DBUILD_SHARED_LIBS -D__APPLE__ -D__APPLE_QUARTZ__"
    swversion = `#{"sw_vers"}`.tr("\n", "");
    cflags_x86_64 = " -march=skylake-avx512 -Wa,-march=skylake-avx512 -march=native -m64 "
    cflags_other = " -mprefer-vector-width=256 -march=native -Wa,-march=native -m64 "
    cflags = cflags_other
    if sysarch == "x86_64"
      cflags = cflags_x86_64
    end
    if MacOS.version >= :mojave
      compiler_flags += " -DROTATE "
    end
    include_flags = " -I /usr/local/opt/cairo/include/cairo"
    config_env_vars = [
      "CC=" + macos_cc + compiler_flags + " -arch " + sysarch + include_flags + macos_base_cflags,
      "CXX=" + macos_cxx + compiler_flags + " -arch " + sysarch + include_flags + macos_base_cflags,
      "CFLAGS=" + cflags,
      "LDFLAGS=" + macos_base_ldflags,
    ]
    config_args = [
      "--prefix=#{prefix}",
      "--enable-cairo",
      "--disable-debug",
      "--enable-threads",
      "--enable-shared",
    ]
    system "make", "clean"
    system "./configure", *config_args, *config_env_vars
    system "/bin/bash -c \'PATH=\"/usr/local/bin:$PATH\" make install\'"
  end

  test do
    system "false"
  end
end
