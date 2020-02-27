class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "https://downloads.ortussolutions.com/ortussolutions/commandbox/4.8.0/commandbox-bin-4.8.0.zip"
  sha256 "43ddb16d221b5e9e7165349195c3b1c3714b28710ba21d88d4cb6ad650213861"

  devel do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.0.0-RC.1/commandbox-bin-5.0.0-RC.1.zip?build=00126"
    sha256 "1ee6a2d6f90a77b1a83a0dd449b708741014d71546f92914cc1d99e7fe2c9a2d"
  end

  bottle :unneeded

  depends_on java: '>= 8'

  resource "apidocs" do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/4.8.0/commandbox-apidocs-4.8.0.zip"
    sha256 "b9e2c734adfd59f122932271ccc9956b288f7d2a496853c370f61033868b7203"
  end

  def install
    libexec.install "box"
    doc.install resource("apidocs")
  end

  test do
    system "#{bin}/box", "--commandbox_home=~/", "version"
    system "#{bin}/box", "--commandbox_home=~/", "help"
  end
end
