class ConsultLlm < Formula
  desc "CLI for consulting LLMs from agent workflows"
  homepage "https://github.com/raine/consult-llm"
  version "3.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.2/consult-llm-darwin-arm64.tar.gz"
      sha256 "2091d615dd4f21c0431e38aa977062826b5b93f40c839610d37a961f698542f7"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.2/consult-llm-darwin-x64.tar.gz"
      sha256 "54a33c19333235c384501c43bcf338fdae2c731c286527ff86da1805abba8165"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.2/consult-llm-linux-arm64.tar.gz"
      sha256 "a965ed7ac5104e6b37893f6197ff7cc54d2386ad69e8b63dc8fdde244db82394"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.2/consult-llm-linux-x64.tar.gz"
      sha256 "66d588bf45519a2ed3c31221222acbbafdfd6e23ae7454582bb985b5bca44794"
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
