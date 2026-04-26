class ConsultLlm < Formula
  desc "CLI for consulting LLMs from agent workflows"
  homepage "https://github.com/raine/consult-llm"
  version "3.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.3/consult-llm-darwin-arm64.tar.gz"
      sha256 "119689044b9024a592bf7d3c68bc63bcbedf95bcaebb10eec65f1e3611075c52"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.3/consult-llm-darwin-x64.tar.gz"
      sha256 "7aba6d95e3a7446478392ee2108c5816708a590cd7ba4a115dce08df6d1d0e92"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.3/consult-llm-linux-arm64.tar.gz"
      sha256 "39d8e73476daa5a2c867470808eeb37396ffaa260e4c951c3048a10fcc283c41"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.3/consult-llm-linux-x64.tar.gz"
      sha256 "c3b193719e5e743cffe33d549e0966046e97c85d4a445740987af47e236f0fa2"
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
