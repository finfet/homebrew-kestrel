class KestrelCli < Formula
  desc "File encryption done right"
  homepage "https://getkestrel.com"
  url "https://getkestrel.com/releases/v1.0.3/kestrel-1.0.3.tar.gz"
  sha256 "18a0b671efd85d7928dd3bb27f5065ec22175888e2553089f61a5c7aba0e1f5f"
  license "BSD-3-Clause"

  bottle do
    root_url "https://bottles.getkestrel.com"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9cce71f3e6e0c5a3b5ca5aaaf93d6394685e03bbfcecca688971824413847a3b"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "9d83a904a278b5a88dcbcf4fb940677d00abbed69ff575087b79d64828c54794"
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
