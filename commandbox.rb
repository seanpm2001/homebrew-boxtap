class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "https://downloads.ortussolutions.com/ortussolutions/commandbox/4.4.0/commandbox-bin-4.4.0.zip"
  sha256 "07cbbf12f70a05a3ac364909754402f2f788da56b6d31ad216df2d79caf643f2"

  devel do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/4.5.0-alpha/commandbox-bin-4.5.0-alpha.zip?build=00144"
    sha256 "89dfb92d56f42a3f178a8d506a41853af18bd81b3c7ed7ea8bd2a15d79f0c753"
  end

  bottle :unneeded

  depends_on :java => "1.8"

  resource "apidocs" do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/4.4.0/commandbox-apidocs-4.4.0.zip"
    sha256 "d55c0f18fd9f401dfaa86d1dc0633aa4f224f1de999c244fcd3a424462d6b1b6"
  end

  def install
    libexec.install "box"
    (bin/"box").write_env_script libexec/"box", Language::Java.java_home_env("1.8")
    doc.install resource("apidocs")
  end

  test do
    system "#{bin}/box", "--commandbox_home=~/", "version"
    system "#{bin}/box", "--commandbox_home=~/", "help"
  end
end
