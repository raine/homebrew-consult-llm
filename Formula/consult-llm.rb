class ConsultLlm < Formula
  desc "CLI for consulting LLMs from agent workflows"
  homepage "https://github.com/raine/consult-llm"
  version "3.0.32"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.32/consult-llm-darwin-arm64.tar.gz"
      sha256 "b08e61a20b3bbd2300f4c49baf636df73aac2a8b57e5be5886e933d8e076db14"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.32/consult-llm-darwin-x64.tar.gz"
      sha256 "0e165ec24d761d03024a966f44fcd2b21a9673a82cc5ee7d9e49d73ff0d52254"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.32/consult-llm-linux-arm64.tar.gz"
      sha256 "9c4ea0a3fe607460e781ef75fe1ed4c006c89bae037317125f41f23935cc5fa6"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.32/consult-llm-linux-x64.tar.gz"
      sha256 "09327333f1b714cb55f64d90e22399567a6b00b1dcf9feb1226d51e1f84c410e"
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
