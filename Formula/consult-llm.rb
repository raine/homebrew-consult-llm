class ConsultLlm < Formula
  desc "CLI for consulting LLMs from agent workflows"
  homepage "https://github.com/raine/consult-llm"
  version "3.0.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.7/consult-llm-darwin-arm64.tar.gz"
      sha256 "bfdedb368779fbc15f5738d02a9754b2fcab6c478514f577bdfdd4c7db2eeec0"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.7/consult-llm-darwin-x64.tar.gz"
      sha256 "eae5d60befc50ab4314eed0af09c2929b84162e372df1854dfbedfd50d1d8e5a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.7/consult-llm-linux-arm64.tar.gz"
      sha256 "d4608489815add1a571622447e3a9fa75a8b264be36ec30265a48c4bd2018afa"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.7/consult-llm-linux-x64.tar.gz"
      sha256 "ca3982dc1d6541645b8f13b58f45268cd9b0f75b116f3f8d13ed305a9cde0fca"
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
