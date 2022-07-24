class KestrelCli < Formula
  desc "File encryption done right"
  homepage "https://getkestrel.com"
  url "https://storage.googleapis.com/kestrel-assets/kestrel-macos-v0.10.0-arm64.tar.gz"
  sha256 "650839679ac2db0777eecff0a5172a6732f87503bfac07fc675d18bebd1b2028"
  license "BSD-3-Clause"
  version "0.10.0"

  resource "binary" do
    checksums = {
      "macos-arm64" => "650839679ac2db0777eecff0a5172a6732f87503bfac07fc675d18bebd1b2028",
      "macos-amd64" => "37aba44cb587e97d9127f5a7f4bf46db5dfe1ac65758f367437e69187a04905c",
    }

    arch = "arm64"
    os = "macos"
    prog_version = "0.10.0"

    on_intel do
      arch = "amd64"
    end

    on_linux do
      raise "Homebrew linux is not yet supported. Try the native linux releases."
    end

    url "https://storage.googleapis.com/kestrel-assets/kestrel-#{os}-v#{prog_version}-#{arch}.tar.gz"
    version prog_version
    sha256 checksums["#{os}-#{arch}"]
  end

  def install
    resource("binary").stage {
      bin.install "kestrel"
    }
    man1.install "man/kestrel.1"
    bash_completion.install "completion/kestrel.bash-completion"
    doc.install "LICENSE.txt"
    doc.install "THIRD-PARY-LICENSE.txt"
  end

  test do
    assert_equal "v0.10.0", shell_output("#{bin}/kestrel --version").chomp
  end
end
