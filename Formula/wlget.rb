class Wlget < Formula
  desc "Read Wikilayer pages and account chat from the terminal"
  homepage "https://github.com/wikilayer/wlget"
  url "https://github.com/wikilayer/wlget/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "102504db6bd4c2af8847897cda27df9fa2aa1297e60dd8b114189efc3753f73d"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}")
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/wlget -version").strip
  end
end
