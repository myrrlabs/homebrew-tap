class Myrr < Formula
  desc "Myrr protocol server — machine-to-machine data at the same URL"
  homepage "https://myrrlabs.com"
  license "MIT"
  head "https://github.com/myrrlabs/myrr.git", branch: "master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/myrrlabs/myrr/releases/download/v0.1.0/myrr-aarch64-apple-darwin.tar.gz"
      sha256 ""
    else
      url "https://github.com/myrrlabs/myrr/releases/download/v0.1.0/myrr-x86_64-apple-darwin.tar.gz"
      sha256 ""
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/myrrlabs/myrr/releases/download/v0.1.0/myrr-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    else
      url "https://github.com/myrrlabs/myrr/releases/download/v0.1.0/myrr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
  end

  def install
    bin.install "myrr-\#{Hardware::CPU.arch}-\#{OS.kernel_name.downcase}" => "myrr"
  end

  test do
    assert_match "myrr", shell_output("\#{bin}/myrr --help")
  end
end
