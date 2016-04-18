class Halide < Formula
  desc "The Halide image processing language"
  homepage "http://halide-lang.org"
  url "https://github.com/halide/Halide/releases/download/release_2016_03_02/halide-mac-64-trunk-65bbac2967ebd59994e613431fd5236baf8a5829.tgz"
  version "2016.03.02"
  sha256 "df1bb22350891ba2d71e21f59863abb622cf437284bd64726bad91cf1d2e83f8"

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
