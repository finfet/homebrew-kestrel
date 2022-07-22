class KestrelCli < Formula
  desc "File encryption done right"
  homepage "https://getkestrel.com"
  url "https://storage.googleapis.com/kestrel-assets/kestrel-0.10.0.tar.gz"
  sha256 "78756bf6de69b92174d5e003084bb0b8e3f495d794ad86c12f2b6be8c82a961d"
  license "BSD-3-Clause"

  bottle do
    root_url "https://storage.googleapis.com/kestrel-assets"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "481adff64025cec409a1d2010ca399f19942763e40413cb299d18bb8098cff21"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release"
    out_dir = Dir["target/release"].first
    bin.install "#{out_dir}/kestrel"
    man1.install "docs/man/kestrel.1"
    bash_completion.install "completion/kestrel.bash-completion"
  end

  test do
    assert_equal "v0.10.0", shell_output("#{bin}/kestrel --version").chomp
  end
end
