class ConsultLlm < Formula
  desc "CLI for consulting LLMs from agent workflows"
  homepage "https://github.com/raine/consult-llm"
  version "3.0.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.21/consult-llm-darwin-arm64.tar.gz"
      sha256 "2591b10ce88e3c33b644b178522c2123efb4267e7d370f7fe0ff36e35b5365cd"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.21/consult-llm-darwin-x64.tar.gz"
      sha256 "5c61a189a8a96afa9366c90ad9adb3100120a50cfa640db6d7859f50d19b42cb"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.21/consult-llm-linux-arm64.tar.gz"
      sha256 "4c4a82226301e4f825bdf9d523ca789408f2157bac8111dbc03eed92bae64365"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.21/consult-llm-linux-x64.tar.gz"
      sha256 "3929413d8534b9c60af79e246619a73241d111dc650353b3089c59ca775b8e4a"
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
