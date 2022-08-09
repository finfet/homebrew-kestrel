class KestrelCli < Formula
  desc "File encryption done right"
  homepage "https://getkestrel.com"
  url "https://kestrel-assets.s3.us-west-2.amazonaws.com/v0.10.0/kestrel-macos-v0.10.0-arm64.tar.gz"
  sha256 "5deac28cac4e4beebba18ca8869e2e6c48ffffefc057c9e6440238f6cc524769"
  license "BSD-3-Clause"
  version "0.10.0"

  resource "binary" do
    checksums = {
      "macos-arm64" => "5deac28cac4e4beebba18ca8869e2e6c48ffffefc057c9e6440238f6cc524769",
      "macos-amd64" => "4820143a9de8e3b450a3a2270fe9cdaa004912307febee8459868e8d2d00ae08",
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

    url "https://kestrel-assets.s3.us-west-2.amazonaws.com/v#{prog_version}/kestrel-#{os}-v#{prog_version}-#{arch}.tar.gz"
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
    doc.install "THIRD-PARTY-LICENSE.txt"
  end

  test do
    assert_equal "v0.10.0", shell_output("#{bin}/kestrel --version").chomp
  end
end
