class KestrelCli < Formula
  desc "File encryption done right"
  homepage "https://getkestrel.com"
  license "BSD-3-Clause"
  version "0.10.0"

  if OS.mac?
    on_intel do
      url "https://getkestrel.com/releases/v#{version}/kestrel-macos-v#{version}-amd64.tar.gz"
      sha256 "4820143a9de8e3b450a3a2270fe9cdaa004912307febee8459868e8d2d00ae08"
    end

    on_arm do
      url "https://getkestrel.com/releases/v#{version}/kestrel-macos-v#{version}-arm64.tar.gz"
      sha256 "5deac28cac4e4beebba18ca8869e2e6c48ffffefc057c9e6440238f6cc524769"
    end
  elsif OS.linux?
    on_intel do
      url "https://getkestrel.com/releases/v#{version}/kestrel-linux-v#{version}-amd64.tar.gz"
      sha256 "8bd29d970d166a4159d44d4d17935ef6394721787e838a1eb02e65a072b341bb"
    end

    on_arm do
      url "https://getkestrel.com/releases/v#{version}/kestrel-linux-v#{version}-arm64.tar.gz"
      sha256 "38e189e8a4b1ce5f1c5c3cbd9b53210a2bfb5a561714da938962b7880a645732"
    end
  end

  def install
    bin.install "kestrel"
    man1.install "man/kestrel.1"
    bash_completion.install "completion/kestrel.bash-completion"
    doc.install "LICENSE.txt"
    doc.install "THIRD-PARTY-LICENSE.txt"
  end

  test do
    assert_equal "v#{version}", shell_output("#{bin}/kestrel --version").chomp
  end
end
