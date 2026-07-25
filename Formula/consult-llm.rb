class ConsultLlm < Formula
  desc "CLI for consulting LLMs from agent workflows"
  homepage "https://github.com/raine/consult-llm"
  version "3.0.28"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.28/consult-llm-darwin-arm64.tar.gz"
      sha256 "10c178d780e84147c85bdad581dba6008ce663cfb351dc8e20a66198ea16b044"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.28/consult-llm-darwin-x64.tar.gz"
      sha256 "6800dc917f1beee49cf7c0b231f5f4ab09ded45017c54bb4e3a7f82d751513de"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.28/consult-llm-linux-arm64.tar.gz"
      sha256 "cd08ce9fab739406509ff309162ae9262109535b207bd5f0697dbddec0df5248"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.28/consult-llm-linux-x64.tar.gz"
      sha256 "41a201644f7bef1e3acde9d5220ac3cbf6c90470543064bfd9de03a3b3c5f3d8"
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
