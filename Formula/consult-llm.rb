class ConsultLlm < Formula
  desc "CLI for consulting LLMs from agent workflows"
  homepage "https://github.com/raine/consult-llm"
  version "3.0.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.13/consult-llm-darwin-arm64.tar.gz"
      sha256 "17f666b5fb496639e6549dc98010cdffe626a11f0d3d5c8b52053c853e5a0ad7"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.13/consult-llm-darwin-x64.tar.gz"
      sha256 "a869153d87d4f3a444ed51bf7be7100aa7a59d3875b5f35a619a2c2f6389050a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.13/consult-llm-linux-arm64.tar.gz"
      sha256 "d44dd7c740e49209a65e52ffc22137d86df5f00bb2c320d7db7c46269ca20de2"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.13/consult-llm-linux-x64.tar.gz"
      sha256 "ae5ba082ce2d1e2fa363f2d675e9bcbcc973c1ec598c9df9420deb23f8e17135"
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
