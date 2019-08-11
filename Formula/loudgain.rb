class Loudgain < Formula
  desc "ReplayGain 2.0 loudness normalizer based on the EBU R128/ITU BS.1770 standard (-18 LUFS, FLAC, Ogg, MP2, MP3, MP4, M4A, AAC, ALAC, Opus)"
  homepage "https://github.com/Moonbase59/loudgain"
  url "https://github.com/Moonbase59/loudgain/archive/v0.5.3.tar.gz"
  sha256 "2b3258cd48820e2eb579e2357831d40520cb4104bda008d8dfd8188cf2b34db3"
  head "https://github.com/Moonbase59/loudgain.git"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "ffmpeg"
  # libtag (=taglib) should be built from HEAD or at least
  # commit 79bc9ccf8ea5606da2a86e1bfb5439e73a146272
  # because it hasn't seen a new version since 2016.
  # Before, it had a nasty bug that could clobber .ogg files!
  # Use: brew install --HEAD libtag
  # You might need 'brew unlink libtag' before.
  depends_on "libtag"
  depends_on "libebur128"

  def install
    mkdir "build" do
      system "cmake", "-G", "Unix Makefiles", "..", *std_cmake_args
      system "make"
      system "make", "install"
    end
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
    assert_match /^loudgain\s+0\.5\.3.*/,
      shell_output("#{bin}/loudgain -v").strip
  end
end
