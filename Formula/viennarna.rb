class Viennarna < Formula
  desc "ViennaRNA and RNAlib: Prediction and comparison of RNA secondary structures"
  homepage "https://www.tbi.univie.ac.at/RNA/"
  url "https://www.tbi.univie.ac.at/RNA/download/sourcecode/2_4_x/ViennaRNA-2.4.11.tar.gz"
  sha256 "9913fc04a6f2ab380bd492301f9c5a07cfe1b6c9ca437261de03691c3d3d6837"
  version "2.4.11"
  revision 2

  fails_with :clang # needs OpenMP

  depends_on "gcc" if OS.mac? # for OpenMP
  depends_on "python@2"

  def install
    system "./configure",
      "--disable-debug",
      "--disable-dependency-tracking",
      "--with-python",
      "--prefix=#{prefix}"
    system "make"
    ENV.deparallelize
    system "make", "install"
  end
end
