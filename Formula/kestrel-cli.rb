class KestrelCli < Formula
  desc "File encryption done right"
  homepage "https://getkestrel.com"
  url "https://getkestrel.com/releases/v1.0.0/kestrel-1.0.0.tar.gz"
  sha256 "83fc5dc6a487cefc1ef3c9d07b60193c1292b5988afe05d9ed11c98e68a871da"
  license "BSD-3-Clause"

  bottle do
    root_url "https://bottles.getkestrel.com"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "c6e3ffcd2bd4ded0b9d5b186b81d161227e6aba1599c2b0e2461eb487ec91a5a"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "33f940feef3e90ef9199eac450789b0a5c5727e8f131552268fb146458540953"
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
