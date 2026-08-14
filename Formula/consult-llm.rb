class ConsultLlm < Formula
  desc "CLI for consulting LLMs from agent workflows"
  homepage "https://github.com/raine/consult-llm"
  version "3.0.30"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.30/consult-llm-darwin-arm64.tar.gz"
      sha256 "01cdcf5e25902ca264a02bcd33f3e176606acee38dd8bed06d5d9d0c98ad6229"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.30/consult-llm-darwin-x64.tar.gz"
      sha256 "ce89e7d7e1ece7fa46f5d61650a58abcd225caf9cd6dde6cd912b606b2e639df"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.30/consult-llm-linux-arm64.tar.gz"
      sha256 "ec63edf261936945d4ef448c456653a410b4cfb7e7ca608e591b1506d34c6afa"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.30/consult-llm-linux-x64.tar.gz"
      sha256 "3e30379f19876cce311da1e97178c5cd0fdcfd68888f42c9bbc3d1c497349f0c"
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
