class ConsultLlm < Formula
  desc "CLI for consulting LLMs from agent workflows"
  homepage "https://github.com/raine/consult-llm"
  version "3.0.34"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.34/consult-llm-darwin-arm64.tar.gz"
      sha256 "8efe31d92a427a5c9d20feafd3d1291d4e298846369e040c5dabf9ce6360d87a"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.34/consult-llm-darwin-x64.tar.gz"
      sha256 "879354a9c5b22b35a28dd109597b1c2565dd4b315163c9ca5d4816083a2196ad"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.34/consult-llm-linux-arm64.tar.gz"
      sha256 "3b14e168038653ebfc93a082bf9cbedaa2abadd3cfa1130f3b840be6dc8b61ad"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.34/consult-llm-linux-x64.tar.gz"
      sha256 "0dd78b12430dec9ae87128f9c2b3a952d1572b72d712c15665a58e16a83009ae"
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
