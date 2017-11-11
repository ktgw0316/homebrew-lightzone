class Lightzone < Formula
  desc "Open-source professional-level digital darkroom software"
  homepage "http://lightzoneproject.org/"
  url "https://github.com/Aries85/LightZone/archive/4.1.7.tar.gz"
  version "4.1.7"
  sha256 ""
  head "https://github.com/Aries85/LightZone.git"

  depends_on :java => "1.6+"
  # depends_on :xcode => :build
  depends_on "ant" => :build
  depends_on "pkg-config" => :build
  depends_on "git" => :build
  depends_on "rsync" => :build
  depends_on "autoconf" => :build
  depends_on "libtiff"
  depends_on "libxml2"
  depends_on "little-cms2"

  def install
    system "ant", "-f", "macosx/build.xml", "build-bundle"
    prefix.install "macosx/release/LightZone.app"
    bin.install_symlink prefix/"LightZone.app/Contents/bin/lightzone"
  end

  test do
    system "false"
  end
end
