class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "http://downloads.ortussolutions.com/ortussolutions/commandbox/3.8.0/commandbox-bin-3.8.0.zip"
  sha256 "e184e380713b6e4e94c1266bf4abc352da2e5c7b19bdb9d5ce5f36665d1c58ec"

  devel do
    url "http://integration.stg.ortussolutions.com/artifacts/ortussolutions/commandbox/3.9.0-SNAPSHOT/commandbox-bin-3.9.0-SNAPSHOT.zip?build=00813"
    sha256 "948eb490f258227dd672d161fbf8f88a921b2610bc77aa9c33dfcdc035e85096"
  end

  bottle :unneeded

  depends_on :java => "1.7+"

  resource "apidocs" do
    url "http://downloads.ortussolutions.com/ortussolutions/commandbox/3.8.0/commandbox-apidocs-3.8.0.zip"
    sha256 "9ece5b114694bb61c4301769f3e3ce79490cb223f786a179df8a52913af628bd"
  end

  def install
    bin.install "box"
    doc.install resource("apidocs")
  end

  test do
    system "#{bin}/box", "--commandbox_home=~/", "version"
    system "#{bin}/box", "--commandbox_home=~/", "help"
  end
end
