class Topflight < Formula
  desc "Build and run a TopFlight trading bot"
  homepage "https://github.com/RichieRob/topflight-bot"
  url "https://raw.githubusercontent.com/RichieRob/topflight-bot/v0.2.0/topflight-bot-0.2.0.tgz"
  sha256 "5b312671e7d6a105603d7988812cf913fb23d6d04f4e254182b122815d6ddaa4"
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
