class ConsultLlm < Formula
  desc "CLI for consulting LLMs from agent workflows"
  homepage "https://github.com/raine/consult-llm"
  version "3.0.38"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.38/consult-llm-darwin-arm64.tar.gz"
      sha256 "9f54654d57d8dbdd197efaff88f6e6e769e3110abc1970b6caf65d84e0b7764a"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.38/consult-llm-darwin-x64.tar.gz"
      sha256 "d9f9001d86e9028eb1a2ecf0f0e819b00f98211ad3cf1fc21658b28983b985c3"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.38/consult-llm-linux-arm64.tar.gz"
      sha256 "cad44b8fdd51b9f989213e9279b48a0fa9e19f2579dd8fb85831d140d5dd537e"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.38/consult-llm-linux-x64.tar.gz"
      sha256 "77766fe1a3ef2b3fcd03f610947cbc91a43dab4e4b6b870dde2a69782e0633a1"
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
