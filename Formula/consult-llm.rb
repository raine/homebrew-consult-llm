class ConsultLlm < Formula
  desc "CLI for consulting LLMs from agent workflows"
  homepage "https://github.com/raine/consult-llm"
  version "3.0.33"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.33/consult-llm-darwin-arm64.tar.gz"
      sha256 "541339299592de1ada2e8e167d083e893b0115c9e00fd6a255b3cbd7255b5c26"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.33/consult-llm-darwin-x64.tar.gz"
      sha256 "91103302a70b464f0749b62c6ce17e01af2fab7856e04020b15e1ca9bc3cedb2"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.33/consult-llm-linux-arm64.tar.gz"
      sha256 "7880e2b0de28196bc991a854cd071093e7f83ca5fbdc9afdc1fb73385eaf76a2"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.33/consult-llm-linux-x64.tar.gz"
      sha256 "31a6998f8a342635ecf380a238c1ed8d06c5f1ce19ce8744c4a1a8b8e14f9a8c"
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
