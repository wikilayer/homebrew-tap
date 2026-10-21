class Wlget < Formula
  desc "Read Wikilayer pages and account chat from the terminal"
  homepage "https://github.com/wikilayer/wlget"
  url "https://github.com/wikilayer/wlget/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "5a97617a12bc9bb38e4b1bb6bf31f9de644b53f65a84f87d9d80989094eb7258"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}")
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/wlget -version").strip
  end
end
