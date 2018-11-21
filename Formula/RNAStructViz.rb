class Rnastructviz < Formula
  ## Usage: getLatestReleaseURL("https://api.github.com/repos/gtDMMB/RNAStructViz/releases/latest")
  #def self.getLatestReleaseURL(gitHubJSONURL)
  #  getCmd = "curl -s -m 20 -X GET " + gitHubJSONURL + "| " + 
  #           "sed -n 's/\"tarball_url\": \"\(.*\)\",.*$/\1/p' | " + 
  #           "sed -e 's/ //g'"
  #  latestReleaseURL = `#{getCmd}`.tr("\n", "")
  #  return latestReleaseURL
  #end

  desc "CT file viewer and RNA structure comparison tool"
  homepage "https://github.com/gtDMMB/RNAStructViz"
  url "https://api.github.com/repos/gtDMMB/RNAStructViz/tarball/v1.1-with-cairo-beta"
  version "1.1-with-cairo-beta"
  revision 2

  depends_on "gtDMMB/core/fltkwithcairo"
  depends_on "pkg-config"
  depends_on "git"
  depends_on "curl"
  depends_on "coreutils"

  def install
    system "git", "clone", "https://github.com/gtDMMB/RNAStructViz.git"
    Dir.chdir("RNAStructViz")
    system "git", "fetch", "origin", "f49a506e7b6b420cbe67a65e1538f5a0162ff850"
    system "git", "reset", "--hard", "FETCH_HEAD"
    system "git", "checkout", "with-cairo"
    system "make", "clean"
    system "make"
    system "make", "install", "INSTALL_PREFIX=#{prefix}"
  end

  test do
    system "false"
  end
end
