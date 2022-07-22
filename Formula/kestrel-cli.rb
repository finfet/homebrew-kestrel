class KestrelCli < Formula
  desc "File encryption done right"
  homepage "https://getkestrel.com"
  url "https://storage.googleapis.com/kestrel-assets/kestrel-macos-v0.10.0-all.tar.gz"
  sha256 "8e638e46c7ee24f7f45919a400dd91cea4608e8e1a1a0d4be8a250fe0234cf0e"
  license "BSD-3-Clause"
  version "0.10.0"

  def install
    # Determine which binary to install based on the current architecture
    arch = `arch`.strip
    if arch == "x86_64"
      bin.install "bin/amd64/kestrel"
    elsif arch == "arm64"
      bin.install "bin/arm64/kestrel"
    else
      raise "Could not find valid architecture"
    end
    man1.install "docs/man/kestrel.1"
    bash_completion.install "completion/kestrel.bash-completion"
  end

  test do
    assert_equal "v0.10.0", shell_output("#{bin}/kestrel --version").chomp
  end
end
