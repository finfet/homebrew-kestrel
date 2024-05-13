class KestrelCli < Formula
  desc "File encryption done right"
  homepage "https://getkestrel.com"
  url "https://getkestrel.com/releases/v1.0.1/kestrel-1.0.1.tar.gz"
  sha256 "c722cdf36c8a38606952c5891184bbc2bcc9cd89aa047eab2fc66c5419faf840"
  license "BSD-3-Clause"

  bottle do
    root_url "https://bottles.getkestrel.com"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "43945b36e68d7abb7750011fc7a0aaf54e6e5b9ba2f008d7cb0049924193b3a2"
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
