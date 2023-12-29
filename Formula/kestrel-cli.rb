class KestrelCli < Formula
  desc "File encryption done right"
  homepage "https://getkestrel.com"
  license "BSD-3-Clause"
  url "https://getkestrel.com/releases/v#{version}/kestrel-#{version}.tar.gz"
  version "1.0.0"
  sha256 "83fc5dc6a487cefc1ef3c9d07b60193c1292b5988afe05d9ed11c98e68a871da"

  bottle do
    root_url "https://bottles.getkestrel.com"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "6dfdb9b5bf14e8df3a76642c280eccab2f18a6a07879bb0d32a941c86b234bf0"
  end

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
