class KestrelCli < Formula
  desc "File encryption done right"
  homepage "https://getkestrel.com"
  url "https://getkestrel.com/releases/v1.0.3/kestrel-1.0.3.tar.gz"
  sha256 "18a0b671efd85d7928dd3bb27f5065ec22175888e2553089f61a5c7aba0e1f5f"
  license "BSD-3-Clause"

  bottle do
    root_url "https://bottles.getkestrel.com"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "dc869819eafbd5945f368c1b60f9ba2cb60545e13478e48ad9f35e34faa76be1"
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
