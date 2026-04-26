class ConsultLlm < Formula
  desc "CLI for consulting LLMs from agent workflows"
  homepage "https://github.com/raine/consult-llm"
  version "3.0.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.4/consult-llm-darwin-arm64.tar.gz"
      sha256 "d1d7d57a6563a93cf6f631256bbcba89cf54ec6d64bf680204f1840922f70d9b"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.4/consult-llm-darwin-x64.tar.gz"
      sha256 "c5773682e4aa9af72d107bd08705e0d8f661010feeb8721e5717832ea8d158f7"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.4/consult-llm-linux-arm64.tar.gz"
      sha256 "6da8d88000209a269b4406e834bed138d1ef0660b415b8e3145002601388a82c"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.4/consult-llm-linux-x64.tar.gz"
      sha256 "4a97b599f4cd58e91849a721fa93ac6dea29112f4676a74b702dc928abbd9f09"
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
