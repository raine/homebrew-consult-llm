class ConsultLlm < Formula
  desc "CLI for consulting LLMs from agent workflows"
  homepage "https://github.com/raine/consult-llm"
  version "3.0.27"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.27/consult-llm-darwin-arm64.tar.gz"
      sha256 "95f55cc734943f7c0262aee6d0d15c027217d9dde747c4da5b2f5bbce7d7d545"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.27/consult-llm-darwin-x64.tar.gz"
      sha256 "bbf2672a330cc4ab97006c47576b113f4ca65dd3b74cc45c2a206683d5164c61"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.27/consult-llm-linux-arm64.tar.gz"
      sha256 "8280b55dd984c5c1c8ceb0310cf4227172592e46d4e67bc8ad2ae4129cb6cdf9"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.27/consult-llm-linux-x64.tar.gz"
      sha256 "b586414a98fc2c8bad8aafb7d2e68fbb5814aada3649761c5588e5e79b6a397e"
    end
  end

  def install
    bin.install "consult-llm"
    bin.install "consult-llm-monitor"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/consult-llm --version")
  end
end
