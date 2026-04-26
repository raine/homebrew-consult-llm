class ConsultLlm < Formula
  desc "CLI for consulting LLMs from agent workflows"
  homepage "https://github.com/raine/consult-llm"
  version "3.0.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.6/consult-llm-darwin-arm64.tar.gz"
      sha256 "50812e8b2f138a5460884398ac4f2b59a0349570365b4c44261b01971d9b9f80"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.6/consult-llm-darwin-x64.tar.gz"
      sha256 "f46dc33efbb455db09012519e910f4f17a936405c9b3a73f4b0bd1ed25e28e81"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.6/consult-llm-linux-arm64.tar.gz"
      sha256 "9bf36407e920d9828e723c83b8a80a20a109dc5a185bb485f079d2c294ddc9e7"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.6/consult-llm-linux-x64.tar.gz"
      sha256 "991301bf9aaf8ced7fbf860a3a17b2749693d646df38bed0015e118c5eb2f232"
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
