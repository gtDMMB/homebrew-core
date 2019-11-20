require_relative "../LocalUtils/github_download_strategy.rb"
require "utils/github.rb"

class Rstructvizdev < Formula
  desc "Graphical RNA secondary structure comparison multi-tool"
  homepage "https://github.com/gtDMMB/RNAStructViz/wiki"
  version "v1.9.7-testing"
  revision 1
  
  @@ReleaseTagType = "<UNKNOWN-DATA>"
  @@IsDevelSnapshot = false
  
  depends_on "gtDMMB/core/fltkwithcairo" => :build
  depends_on "gtDMMB/core/viennarna"     => :build
  depends_on "pkg-config"
  depends_on "curl"
  depends_on "coreutils"
  depends_on "openssl"
  depends_on "boost" => ["with-c++17"]
  
  # Build RNAStructViz from the latest tagged release:
  head "https://github.com/gtDMMB/RNAStructViz", :using => :git, :tag => Rnastructvizdev.version, :branch => "master"
  head do
    url "https://github.com/gtDMMB/RNAStructViz.git"
    Rnastructvizdev.class_variable_set(@@ReleaseTagType, "[TAGGED]" + Rnastructvizdev.version)
  end
  
  # Build RNAStructViz from the latest commit sources, rather than the latest tagged release:
  devel "https://github.com/gtDMMB/RNAStructViz", :using => :git, :branch => "master"
  devel do
    url "https://github.com/gtDMMB/RNAStructViz.git"
    Rnastructvizdev.class_variable_set(@@ReleaseTagType, "[DEVELOPMENT-SNAPSHOT]")
    Rnastructvizdev.class_variable_set(@@IsDevelSnapshot, true)
  end

  def install
    inreplace "scripts/BuildTargetInfo.in", /##__GIT_RELEASE_TYPE__##/, Rnastructvizdev.class_variable_get(@@ReleaseTagType)
    system "make"
    if Rnastructvizdev.class_variable_get(@@IsDevelSnapshot)
      Dir.chdir("src")
      system "cp", "RNAStructViz", "RNAStructViz-dev"
      bin.install "RNAStructViz-dev"
      Dir.chdir("..")
    else
      bin.install "src/RNAStructViz"
    end
    prefix.install Dir["sample-structures"]
  end
  
  def caveats
    "Run the application by typing RNAStructViz at your terminal.\n" + 
    "Visit https://github.com/gtDMMB/RNAStructViz/wiki/FirstRunInstructions for more information on " + 
    "running RNAStructViz for the first time."
  end

  test do
    system "false"
  end

end

__END__
# Room for a patch after the `__END__`
# Read about how to get a patch in here:
#    https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
# In short, `brew install --interactive --git <formula>` and make your edits.
# Then `git diff >> path/to/your/formula.rb`
# Note, that HOMEBREW_PREFIX will be replaced in the path before it is
# applied. A patch can consit of several hunks.
