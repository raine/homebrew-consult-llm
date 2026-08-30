class ConsultLlm < Formula
  desc "CLI for consulting LLMs from agent workflows"
  homepage "https://github.com/raine/consult-llm"
  version "3.0.31"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.31/consult-llm-darwin-arm64.tar.gz"
      sha256 "ce8d2fdba614aefc3e67ab519921cce694f9a4d995c05ffd252a685f24704fd6"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.31/consult-llm-darwin-x64.tar.gz"
      sha256 "27e9b31a41a8e40310bacebd4e53ec65c3368c2fc8930ed226efdf1f62dda9f5"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.31/consult-llm-linux-arm64.tar.gz"
      sha256 "e6acff4812c4fa0a94cb1d197b47667da760aaf3c7fc90c367e6f57c83788fb4"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.31/consult-llm-linux-x64.tar.gz"
      sha256 "ae637432d166c7efaed7fcd407707ca5afc27ecb1dac5a0c741812f099e01d0f"
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
