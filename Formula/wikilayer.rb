class Wikilayer < Formula
  desc "Personal wiki server"
  homepage "https://wikilayer.org"
  license "MIT"

  depends_on :macos
  depends_on "postgresql@16"

  on_macos do
    on_arm do
      url "https://github.com/wikilayer/homebrew-tap/releases/download/v1.1.2/wikilayer_1.1.2_darwin_arm64.tar.gz"
      sha256 "102e8a972e19271623f9c085f24337a69fd10982ea75453d76b2247e4a9a76e6"
    end

    on_intel do
      url "https://github.com/wikilayer/homebrew-tap/releases/download/v1.1.2/wikilayer_1.1.2_darwin_amd64.tar.gz"
      sha256 "29ffedcd200f8b6105746b34d63d71c9a0f24a5ad33198d1f8e59e89522a36db"
    end
  end

  def install
    bin.install "wikilayer"
    pkgshare.install "LICENSE"
  end

  service do
    run [opt_bin/"wikilayer", "standalone",
         "-data-dir", var/"wikilayer",
         "-postgres-bin", formula_opt_bin("postgresql@16")]
    keep_alive true
    log_path var/"log/wikilayer.log"
    error_log_path var/"log/wikilayer.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wikilayer version")
  end
end
