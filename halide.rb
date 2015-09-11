class Halide < Formula
  desc "The Halide image processing language"
  homepage "http://halide-lang.org"
  url "https://github.com/halide/Halide/releases/download/release_2015_08_05/halide_Darwin_64_trunk_clang_d5ef0199bfdd2112c90c0ab253f5c3d7f7748e41_2015_08_05.tgz"
  version "2015.08.05"
  sha256 "5ad3a5ebb684db269946acb9ef0f572ab6947d6d347bcc7ab2c886ed1861efb7"

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
