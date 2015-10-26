class Halide < Formula
  desc "The Halide image processing language"
  homepage "http://halide-lang.org"
  url "https://github.com/halide/Halide/releases/download/release_2015_10_22/halide-mac-64-trunk-c815789464d4d0dc790ac13b084a4da44459983f.tgz"
  version "2015.10.22"
  sha256 "f5e4bcc860d7c08992fbfcd7aba5fdf1af60851ca1d35d72e40d8dcbd3a64515"

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
