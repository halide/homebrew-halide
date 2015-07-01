class Halide < Formula
  desc "The Halide image processing language"
  homepage "http://halide-lang.org"
  url "https://github.com/halide/Halide/releases/download/release_2015_06_03/halide_Darwin_64_trunk_clang_fe99d863aeff6ac9a128d65b976cfe0caff50b77_2015_06_03.tgz"
  version "2015.06.03"
  sha256 "d2f866a4c4a3562416c5e1d3b86363e624042a4f758185f0d9b1c2754b251092"

  def install
    lib.install Dir['bin/libHalide*']
    include.install Dir['include/*']
    system "mkdir", "halide"
    system "mv", "tools", "halide/"
    system "mv", "tutorial", "halide/"
    share.install 'halide'
  end

  test do
    system "g++", "#{share}/halide/tutorial/lesson_01_basics.cpp", "-g", "-I", "#{include}", "-L", "#{lib}", "-lHalide", "-o", "lesson_01", "-std=c++11"
    system "./lesson_01"
  end
end
