class Lightzone < Formula
  desc "Open-source professional-level digital darkroom software"
  homepage "http://lightzoneproject.org/"
  url "https://github.com/ktgw0316/LightZone/archive/4.2.1.tar.gz"
  sha256 "00319c1c41f4929484af3147985960d7aafe352fbd4477de9fe8edf210ad5df7"
  head "https://github.com/ktgw0316/LightZone.git"

  depends_on :java => "11"
  depends_on "ant" => :build
  depends_on "pkg-config" => :build
  depends_on "git" => :build
  depends_on "libomp" => :build
  depends_on "rsync" => :build
  depends_on "autoconf" => :build
  depends_on "lensfun"
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
