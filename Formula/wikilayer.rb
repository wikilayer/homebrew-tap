class Wikilayer < Formula
  desc "Personal wiki server"
  homepage "https://wikilayer.org"
  license "MIT"

  depends_on :macos
  depends_on "postgresql@16"

  on_macos do
    on_arm do
      url "https://github.com/wikilayer/homebrew-tap/releases/download/v1.2.0/wikilayer_1.2.0_darwin_arm64.tar.gz"
      sha256 "7303ece7554299149269b765a49c517667f6a367e3c0b5d8be5192e120b93d0a"
    end

    on_intel do
      url "https://github.com/wikilayer/homebrew-tap/releases/download/v1.2.0/wikilayer_1.2.0_darwin_amd64.tar.gz"
      sha256 "485dfe271836e71d6af95b2345eb3c8ba65b367e9ff266fe86d976c330efdf88"
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
