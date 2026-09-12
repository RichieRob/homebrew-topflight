class Topflight < Formula
  desc "Build and run a TopFlight trading bot"
  homepage "https://github.com/RichieRob/topflight-bot"
  url "https://raw.githubusercontent.com/RichieRob/topflight-bot/v0.2.1/topflight-bot-0.2.1.tgz"
  sha256 "55d6e297c4951d924a4a6a7e7007a27fd8189beca114730127db9c7d98cbdc0b"
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
