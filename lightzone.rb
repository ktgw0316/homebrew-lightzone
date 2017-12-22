class Lightzone < Formula
  desc "Open-source professional-level digital darkroom software"
  homepage "http://lightzoneproject.org/"
  url "https://github.com/ktgw0316/LightZone/archive/4.1.8.tar.gz"
  sha256 "2a0162698a165ab78a815fc1fed87f9ad99e0f9b99c6ccac10c398dbbb4e21e1"
  head "https://github.com/ktgw0316/LightZone.git"

  depends_on :java => "1.6+"
  depends_on "ant" => :build
  depends_on "pkg-config" => :build
  depends_on "git" => :build
  depends_on "llvm" => :build
  depends_on "rsync" => :build
  depends_on "autoconf" => :build
  depends_on "libtiff"
  depends_on "libjpeg-turbo"
  depends_on "libxml2"
  depends_on "little-cms2"

  def install
    ENV.deparallelize
    system "ant", "-f", "macosx/build.xml", "build-bundle"
    prefix.install "macosx/release/LightZone.app"
    bin.install_symlink prefix/"LightZone.app/Contents/bin/lightzone"
  end

  test do
    system "false"
  end
end
