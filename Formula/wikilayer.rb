class Wikilayer < Formula
  desc "Personal wiki server"
  homepage "https://wikilayer.org"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/wikilayer/homebrew-tap/releases/download/v1.0.0/wikilayer_1.0.0_darwin_arm64.tar.gz"
      sha256 "d8e02396799118e3bf1889d9aa1e25ae917bdd60a2fee4000aa6d62c6afc3ca8"
    end

    on_intel do
      url "https://github.com/wikilayer/homebrew-tap/releases/download/v1.0.0/wikilayer_1.0.0_darwin_amd64.tar.gz"
      sha256 "833aa08c97a67d2835e9842c76dd929110a02fdb20694ff73209ec81420dc587"
    end
  end

  depends_on :macos
  depends_on "postgresql@16"

  def install
    bin.install "wikilayer"
    pkgshare.install "LICENSE"
  end

  service do
    run [opt_bin/"wikilayer", "standalone",
         "-data-dir", var/"wikilayer",
         "-postgres-bin", Formula["postgresql@16"].opt_bin,
         "-addr", "127.0.0.1:8081"]
    keep_alive true
    log_path var/"log/wikilayer.log"
    error_log_path var/"log/wikilayer.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wikilayer version")
  end
end
