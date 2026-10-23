class Wlget < Formula
  desc "Read Wikilayer pages and account chat from the terminal"
  homepage "https://github.com/wikilayer/wlget"
  url "https://github.com/wikilayer/wlget/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "b54ea798a7df445f912eff7df5a5dcfaa209f0900f89de44d35a459abfb798eb"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}")
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/wlget -version").strip
  end
end
