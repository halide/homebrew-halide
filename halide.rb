class Halide < Formula
  desc "The Halide image processing language"
  homepage "http://halide-lang.org"
  url "https://github.com/halide/Halide/releases/download/release_2016_10_25/release_2016_10_25/halide-mac-64-trunk-aa5d5514f179bf0ffe1a2dead0c0eb7300b4069a.tgz"
  version "2016.10.25"
  sha256 "7cc502ebeabd1890f9ab12c186e59745c9f524ce74b325931103ef7a1136ca2a"

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
