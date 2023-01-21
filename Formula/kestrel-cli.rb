class KestrelCli < Formula
  desc "File encryption done right"
  homepage "https://getkestrel.com"
  license "BSD-3-Clause"
  version "0.10.1"
  url "https://github.com/finfet/kestrel/archive/v#{version}.tar.gz"
  sha256 "1f69fb546bb87431ea3cde80accee1909f40dab2cd2b82f2f1bbf11eb5baf21c"

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
