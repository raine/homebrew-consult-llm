class ConsultLlm < Formula
  desc "CLI for consulting LLMs from agent workflows"
  homepage "https://github.com/raine/consult-llm"
  version "3.0.37"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.37/consult-llm-darwin-arm64.tar.gz"
      sha256 "9c87562caf73081002c0ff94e7326ccce21d9c4ff9718de1a4612d758b931b33"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.37/consult-llm-darwin-x64.tar.gz"
      sha256 "a557b35f1ffc81799b9896c266ecb2eadc6e3573440b1b3cb374ec41f05e2144"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.37/consult-llm-linux-arm64.tar.gz"
      sha256 "ff25784168034dfc56f4889667b4221febda012e6eea0eb3c3ea665a1918627d"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.37/consult-llm-linux-x64.tar.gz"
      sha256 "8864f76895ef19f3c6722ed6bbdd10ffe03f81edfb3caeb8bb3fc9f7235313be"
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
