class KestrelCli < Formula
  desc "File encryption done right"
  homepage "https://getkestrel.com"
  license "BSD-3-Clause"
  version "1.0.0"
  url "https://getkestrel.com/releases/v#{version}/kestrel-#{version}.tar.gz"
  sha256 "83fc5dc6a487cefc1ef3c9d07b60193c1292b5988afe05d9ed11c98e68a871da"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "src/cli")
    man1.install "docs/man/kestrel.1"
    bash_completion.install "completion/kestrel.bash-completion"
    doc.install "LICENSE.txt"
    doc.install "THIRD-PARTY-LICENSE.txt"
  end

  test do
    assert_equal "v#{version}", shell_output("#{bin}/kestrel --version").chomp
  end
end
