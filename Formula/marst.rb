class Marst < Formula
  desc "Algol-to-C translator"
  homepage "https://www.gnu.org/software/marst"
  url "http://ftpmirror.gnu.org/marst/marst-2.7.tar.gz"
  sha256 "3ee7b9d1cbe3cd9fb5f622717da7bb5506f1a6da3b30f812e2384b87bce4da50"

  bottle do
    cellar :any
    revision 1
    sha256 "c1a70d467ff3117c2a31bd52a659fbff2293f6f17b11cd4b370e9e8220a483c8" => :el_capitan
    sha256 "6d8834fc64e1da37fce2ed9cae3c9f0e0dbfcb41f213c55c8413c2a522ed8811" => :yosemite
    sha256 "7fddf8023d17c4bfcb6fc4141c6202b3e856ee2ecd684236daef058592b79335" => :mavericks
  end

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    (testpath/"hello.alg").write('begin outstring(1, "Hello, world!\n") end')
    system "#{bin}/marst -o hello.c hello.alg"
    system "#{ENV.cc} hello.c -lalgol -lm -o hello"
    system "./hello"
  end
end
