class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "https://downloads.ortussolutions.com/ortussolutions/commandbox/4.8.0/commandbox-bin-4.8.0.zip"
  sha256 "43ddb16d221b5e9e7165349195c3b1c3714b28710ba21d88d4cb6ad650213861"

  devel do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.0.0-RC.1/commandbox-bin-5.0.0-RC.1.zip?build=00127"
    sha256 "06139be40769e607053bcdead7e5758082e0866499db563cabc24f741cb020ef"
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
