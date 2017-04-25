class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "http://downloads.ortussolutions.com/ortussolutions/commandbox/3.6.0/commandbox-bin-3.6.0.zip"
  sha256 "6da683c02caba95316d9fdb2060db139049cf4aca6ee7600fe914a5527038766"

  devel do
    url "http://integration.stg.ortussolutions.com/artifacts/ortussolutions/commandbox/3.7.0-SNAPSHOT/commandbox-bin-3.7.0-SNAPSHOT.zip?build=00666"
    sha256 "f5b35e9d4be8a8ac3a45bf8b434a3780d354b37ad3c08136b335cd0403165050"
  end

  bottle :unneeded

  depends_on :java => "1.7+"

  resource "apidocs" do
    url "http://downloads.ortussolutions.com/ortussolutions/commandbox/3.6.0/commandbox-apidocs-3.6.0.zip"
    sha256 "da0c3de4bf13056817eacf705bb68a16bf85df3524f40a0f6cdc2dddb729544b"
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
