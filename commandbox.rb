class Commandbox < Formula
  desc "CFML embedded server, package manager, and app scaffolding tools"
  homepage "https://www.ortussolutions.com/products/commandbox"
  url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.8.0/commandbox-bin-5.8.0.zip"
  sha256 "d6acc9d93cbe72e247f7d1a4e51fe561c918951b555370f882fe312c98c45a69"
  license "LGPL-3.0-or-later"

  head do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/6.0.0-alpha/commandbox-bin-6.0.0-alpha.zip?build=00717"
    sha256 "e71af86ed75565518ffeb20525df32fc0f3517ce279ed4a269f584473664a063"
  end

  livecheck do
    url :homepage
    regex(/Download CommandBox v?(\d+(?:\.\d+)+)/i)
  end

  bottle do
    sha256 cellar: :any_skip_relocation, all: "45b01d0263bf8842d6b060ed23202a77ab6b33d2a3c1c2a89be80eb4c50324ba"
  end

  # not yet compatible with Java 17 on ARM
  depends_on "openjdk@11"

  resource "apidocs" do
    url "https://downloads.ortussolutions.com/ortussolutions/commandbox/5.8.0/commandbox-apidocs-5.8.0.zip"
    sha256 "7000c9d605bb0c0e459b8975d9cd00ce005972d47bc8d8074c0af7b93696088f"
  end

  def install
    (libexec/"bin").install "box"
    (bin/"box").write_env_script libexec/"bin/box", Language::Java.java_home_env("11")
    doc.install resource("apidocs")
  end

  test do
    system "#{bin}/box", "--commandbox_home=~/", "version"
    system "#{bin}/box", "--commandbox_home=~/", "help"
  end
end
