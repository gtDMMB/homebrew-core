cask 'rnastructviz' do
  name "RNAStructViz"
  version "v2.0.1-testing"
  homepage "https://github.com/gtDMMB/RNAStructViz/wiki"
  url "https://github.com/gtDMMB/RNAStructViz/archive/v2.0.1-testing.tar.gz"
  sha256 "7efd9423fddd911506415c6a458f5437fb1e14f04f7156c68f018acd4605df88"
  caveats "See RNAStructViz WIKI docs https://github.com/gtDMMB/RNAStructViz/wiki/FirstRunInstructions ... "
  
  depends_on "gtDMMB/core/rnastructviz"
  
  app "macos-application/RNAStructViz.app"
  
  def install
    system "mv", "macos-application/RNAStructViz.app", "macos-application/RNAStructViz"
    system "cp", "/usr/local/opt/rnastructviz/bin/RNAStructViz", "macos-application/RNAStructViz/Contents/MacOS/"
    system "mv", "macos-application/RNAStructViz", "macos-application/RNAStructViz.app"
  end
end
