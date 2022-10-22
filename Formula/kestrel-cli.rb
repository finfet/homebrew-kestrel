class KestrelCli < Formula
  desc "File encryption done right"
  homepage "https://getkestrel.com"
  url "https://getkestrel.com/releases/v0.10.0/kestrel-0.10.0.tar.gz"
  sha256 "3e5a73c10972eee34253438045f9019d4547445a808a8bb51c8d2e18bc95a843"
  license "BSD-3-Clause"
  version "0.10.0"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release"
    bin.install "target/release/kestrel"
    man1.install "docs/man/kestrel.1"
    bash_completion.install "completion/kestrel.bash-completion"
    doc.install "LICENSE.txt"
    doc.install "THIRD-PARTY-LICENSE.txt"
  end

  test do
    assert_equal "v0.10.0", shell_output("#{bin}/kestrel --version").chomp
  end
end
