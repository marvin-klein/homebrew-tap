class Ices0 < Formula
  desc "Enhanced source client for broadcasting to an Icecast/Shoutcast server in MP3 format"
  homepage "https://github.com/Moonbase59/ices0"
  url "https://github.com/Moonbase59/ices0/archive/v0.4.10.tar.gz"
  sha256 "cffc837bbace63778d31971336cd99e80d50f0bb6c72269f1c9ee65778a161b0"
  head "https://github.com/Moonbase59/ices0.git"

  # building
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  
  # input/output
  depends on "libshout"
  depends on "lame"
  depends on "libogg"
  depends on "libvorbis"
  depends on "flac"
  depends on "faad2"
  depends on "mp4v2"
  depends on "libxml2"
  
  # scripting
  depends on "python2" => :recommended
  depends on "perl" => :recommended

  def install
    system "aclocal"
    system "autoreconf", "-fi"
    system "automake", "--add-missing"
    system "./configure"
    system "make"
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # For Homebrew/homebrew-core this will need to be a test that verifies
    # the functionality of the software. Run the test with `brew test loudgain`.
    # Options passed to `brew install` such as `--HEAD` also need to be
    # provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    #assert_match /^loudgain\s+#{version}.*/,
    assert_match /^ices\s+0\.4\.10.*/,
      shell_output("#{bin}/ices -V").strip
  end
end
