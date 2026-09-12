class Topflight < Formula
  desc "Build and run a TopFlight trading bot"
  homepage "https://github.com/RichieRob/topflight-bot"
  url "https://raw.githubusercontent.com/RichieRob/topflight-bot/v0.2.2/topflight-bot-0.2.2.tgz"
  sha256 "4394565cd223160a162d4be3268daa561ac0a974f0ce2431ad6dd024eed003b5"
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
