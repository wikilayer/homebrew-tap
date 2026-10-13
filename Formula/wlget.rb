class Wlget < Formula
  desc "Read Wikilayer pages and account chat from the terminal"
  homepage "https://github.com/wikilayer/wlget"
  url "https://github.com/wikilayer/wlget/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "d1caa609c8d3997d5121d0b6d5187b01e04b240aa20af8396a4a685e6a3eeea8"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}")
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/wlget -version").strip
  end
end
