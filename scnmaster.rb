require "formula"

class Scnmaster < Formula
  homepage "http://shortcutoslo.no"
  url "https://github.com/santonsen/homebrew-scnmaster/raw/master/dist/scnmaster_0.0.5/scnmaster_0.0.5.tar.gz"
  sha1 "1cba61d5b29e1761b0ffdb73377339670abd7188"

  depends_on "ffmpeg"

  resource "pexpect" do
    url "https://pypi.python.org/packages/source/p/pexpect/pexpect-3.3.tar.gz"
    sha1 "1cba61d5b29e1761b0ffdb73377339670abd7188"
  end

  def install
    resource("pexpect").stage { system "python", *Language::Python.setup_install_args(libexec/"vendor") }

    system "make", "prefix=#{prefix}",
                   "install"
  end
end
