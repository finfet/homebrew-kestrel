class KestrelCli < Formula
  desc "File encryption done right"
  homepage "https://getkestrel.com"
  license "BSD-3-Clause"
  version "0.11.0"
  url "https://github.com/finfet/kestrel/archive/v#{version}.tar.gz"
  sha256 "904bbf37618816f3f1b18d4df4a097d7dda335ce055791533f05a07cc5dc3841"

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
