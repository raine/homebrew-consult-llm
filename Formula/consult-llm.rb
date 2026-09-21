class ConsultLlm < Formula
  desc "CLI for consulting LLMs from agent workflows"
  homepage "https://github.com/raine/consult-llm"
  version "3.0.35"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.35/consult-llm-darwin-arm64.tar.gz"
      sha256 "9def6a3558334b8182f6977fb016e1e52f383aa017a6fd5d0256982c31f8b2d3"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.35/consult-llm-darwin-x64.tar.gz"
      sha256 "3e14602f9d935bd98019deca389851132b2c0bcdffc02e2840f8f80861da0504"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.35/consult-llm-linux-arm64.tar.gz"
      sha256 "922d3442e3603287e253a1e8e2e9bda59b83d9f52459b2e75ecfbac5f7cd601e"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.35/consult-llm-linux-x64.tar.gz"
      sha256 "296afb02432e7ac51da03542022ddebd9203d9e03b4332841cb9cbca90f7f226"
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
