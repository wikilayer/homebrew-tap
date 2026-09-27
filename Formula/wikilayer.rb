class Wikilayer < Formula
  desc "Personal wiki server"
  homepage "https://wikilayer.org"
  license "MIT"

  depends_on :macos
  depends_on "postgresql@16"

  on_macos do
    on_arm do
      url "https://github.com/wikilayer/homebrew-tap/releases/download/v1.1.0/wikilayer_1.1.0_darwin_arm64.tar.gz"
      sha256 "de74dea85390653222232e4d396c1eb38b44b469bcd01ee1e0bb9140306d65b5"
    end

    on_intel do
      url "https://github.com/wikilayer/homebrew-tap/releases/download/v1.1.0/wikilayer_1.1.0_darwin_amd64.tar.gz"
      sha256 "67c8dc5d5539044727d10c8ce5390169266e88c439447aaa7bce99a99f862ce1"
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
