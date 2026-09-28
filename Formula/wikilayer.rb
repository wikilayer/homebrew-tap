class Wikilayer < Formula
  desc "Personal wiki server"
  homepage "https://wikilayer.org"
  license "MIT"

  depends_on :macos
  depends_on "postgresql@16"

  on_macos do
    on_arm do
      url "https://github.com/wikilayer/homebrew-tap/releases/download/v1.1.1/wikilayer_1.1.1_darwin_arm64.tar.gz"
      sha256 "ca4e744e4f7591cd6b317ba7e906047b5f6398c4a6b6fd605f256faacaa08426"
    end

    on_intel do
      url "https://github.com/wikilayer/homebrew-tap/releases/download/v1.1.1/wikilayer_1.1.1_darwin_amd64.tar.gz"
      sha256 "23e950a634244f0fa0595d56b21204252ac24abbdc588b762bb02f97cacc63e7"
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
