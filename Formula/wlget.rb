class Wlget < Formula
  desc "Read Wikilayer pages and account chat from the terminal"
  homepage "https://github.com/wikilayer/wlget"
  url "https://github.com/wikilayer/wlget/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "28e8bd9ded4e9c5a99e7d49f953f9e69d90b8adb41bb9210a31d8a3a2b74e962"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}")
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/wlget -version").strip
  end
end
