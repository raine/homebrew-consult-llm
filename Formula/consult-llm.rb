class ConsultLlm < Formula
  desc "CLI for consulting LLMs from agent workflows"
  homepage "https://github.com/raine/consult-llm"
  version "3.0.26"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.26/consult-llm-darwin-arm64.tar.gz"
      sha256 "67d4ac79fdcf714c6246ec99ccf3d31f5dc1431e2328765cb34cfd882c95a223"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.26/consult-llm-darwin-x64.tar.gz"
      sha256 "75ae145b8f88f6970ea4426ae593100043421ccf41605c674966d02efe307ec1"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.26/consult-llm-linux-arm64.tar.gz"
      sha256 "875bd9f3e78dc134476d9b7a84b3e635953f41e6627d99e54e1b07d4c61abfe3"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.26/consult-llm-linux-x64.tar.gz"
      sha256 "74fda9b26539f73b8b7b2968db0b007b2af4f274c13ea4d5febbd6e0ba557dc0"
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
