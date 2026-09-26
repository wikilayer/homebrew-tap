class Wikilayer < Formula
  desc "Personal wiki server"
  homepage "https://wikilayer.org"
  license "MIT"

  depends_on :macos
  depends_on "postgresql@16"

  on_macos do
    on_arm do
      url "https://github.com/wikilayer/homebrew-tap/releases/download/v1.0.1/wikilayer_1.0.1_darwin_arm64.tar.gz"
      sha256 "b857eb80e39a93ed5075659e40c6f8aa5ba1b24f5d79f2e995cb4f4bfedbff4b"
    end

    on_intel do
      url "https://github.com/wikilayer/homebrew-tap/releases/download/v1.0.1/wikilayer_1.0.1_darwin_amd64.tar.gz"
      sha256 "415cbb1720cea074829e9d85a1f7c4b26fe70c31c2faa74953d74fc09e3227c6"
    end
  end

  def install
    bin.install "wikilayer"
    pkgshare.install "LICENSE"
  end

  service do
    run [opt_bin/"wikilayer", "standalone",
         "-data-dir", var/"wikilayer",
         "-postgres-bin", formula_opt_bin("postgresql@16"),
         "-addr", "127.0.0.1:8081"]
    keep_alive true
    log_path var/"log/wikilayer.log"
    error_log_path var/"log/wikilayer.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wikilayer version")
  end
end
