class Rnastructviz < Formula
  desc "Graphical RNA secondary structure comparison multi-tool"
  homepage "https://github.com/gtDMMB/RNAStructViz/wiki"
  url "https://github.com/gtDMMB/RNAStructViz/archive/refs/tags/v2.4.16-stable.tar.gz"
  sha256 "679aacf8ddd9768593498758e72815f082c8bd88cef622c907951d6dc2dfb443"
  version "v2.4.16-stable"
  revision 9
  
  #bottle :unneeded
  
  depends_on "gtDMMB/core/fltkwithcairo"
  depends_on "gtDMMB/core/viennarna"
  depends_on "pkg-config"
  depends_on "curl"
  depends_on "coreutils"
  depends_on "grep"
  depends_on "gnu-sed"
  depends_on "openssl@1.1"
  depends_on "boost"

  # To maintainers: If this brew package becomes deprecated, replace the @12 with @MORE_RECENT_VERSION
  #                 throughout this formula.
  depends_on "llvm@12"
  depends_on :macos

  def install
    if MacOS.version >= :catalina
      llvm_path = "/usr/local/opt/llvm@12/"
      rsv_env = "STRUCTVIZ_COMPILER=\"" + llvm_path + "bin/clang++ -nostdinc++ -I" + llvm_path + "include/c++/v1\""
      # Add `brew` to the path (used in the RNAStructViz Makefile): 
      path_env = "PATH=\"/usr/local/bin:$PATH\" "
      system "/bin/bash -c '" + path_env + rsv_env + " make'"
    else
      system "CFLAGS=\"\" CXXFLAGS=\"\" LDFLAGS=\"\" make"
    end
    system "mv", "macos-application/RNAStructViz.app", "macos-application/RNAStructViz"
    system "cp", "src/RNAStructViz", "macos-application/RNAStructViz/Contents/MacOS/"
    system "cp", "-R", "macos-application/RNAStructViz", "macos-application/RNAStructViz.app"
    bin.install "src/RNAStructViz"
    prefix.install Dir["sample-structures"]
    prefix.install "macos-application/RNAStructViz.app"
  end
  
  def caveats; <<~EOS
    See RNAStructViz WIKI docs https://github.com/gtDMMB/RNAStructViz/wiki/FirstRunInstructions. 
    If your brew environment is configured correctly, you can now run `RNAStructViz` at your terminal.
  EOS
  end

  test do
    system "false"
  end
end
