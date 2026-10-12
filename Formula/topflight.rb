class Topflight < Formula
  desc "Build and run a TopFlight trading bot"
  homepage "https://github.com/RichieRob/topflight-bot"
  url "https://raw.githubusercontent.com/RichieRob/topflight-bot/v0.3.3/topflight-bot-0.3.3.tgz"
  sha256 "6ddbaca75bdb951e655ac94d5e5a7fa8deaf267f01065ec600e05320822885de"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec/"bin/topflight-bot" => "topflight"
  end

  test do
    assert_match "topflight-bot init", shell_output("#{bin}/topflight --help")
    assert_match "Invite code", shell_output("#{bin}/topflight init 2>&1", 1)
    refute_path_exists testpath/"topflight-bot/.botkey"
  end
end
