class ConsultLlm < Formula
  desc "CLI for consulting LLMs from agent workflows"
  homepage "https://github.com/raine/consult-llm"
  version "3.0.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.17/consult-llm-darwin-arm64.tar.gz"
      sha256 "dc51c322276a329898e21bf85144a2b6aab35ca1175487687e79a96cafcb2b4b"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.17/consult-llm-darwin-x64.tar.gz"
      sha256 "7a9d1f7aff3ba1e2d8bef65bd60e5cb0f09fb7489e967348ce00c3f6189c8a6e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.17/consult-llm-linux-arm64.tar.gz"
      sha256 "3c73c9e6f4fc2ef3e303049b377e3037de6fa6c7d1e96d54cf07018e3fbecc95"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.17/consult-llm-linux-x64.tar.gz"
      sha256 "dc1a89f31b93afae5440737936c6c0473f262db7bec2a6ca82e35db2608fbee4"
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
