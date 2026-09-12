class Topflight < Formula
  desc "Build and run a TopFlight trading bot"
  homepage "https://github.com/RichieRob/topflight-bot"
  url "https://raw.githubusercontent.com/RichieRob/topflight-bot/v0.3.1/topflight-bot-0.3.1.tgz"
  sha256 "76d2fd564379bb2a7195271e23d670cfb041316b65ed7887e137614853871ec9"
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
