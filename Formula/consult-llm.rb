class ConsultLlm < Formula
  desc "CLI for consulting LLMs from agent workflows"
  homepage "https://github.com/raine/consult-llm"
  version "3.0.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.9/consult-llm-darwin-arm64.tar.gz"
      sha256 "69ac1227a782777e6a847650c864c2045053fbe2ba5d34d1c7abff5247a5b450"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.9/consult-llm-darwin-x64.tar.gz"
      sha256 "ac0a40ca780833336b879d2807b5ec439a541bf51dc682f1df62c6c9b939048d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.9/consult-llm-linux-arm64.tar.gz"
      sha256 "a96146418e8468965acb57a753bb62721e88ba3b9b6c09477950adb8e6a42661"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.9/consult-llm-linux-x64.tar.gz"
      sha256 "5e27cf5d3d0417e667a09c9e493253573f454488f1f70c80de1753fc487f4730"
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
