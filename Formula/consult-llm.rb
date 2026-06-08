class ConsultLlm < Formula
  desc "CLI for consulting LLMs from agent workflows"
  homepage "https://github.com/raine/consult-llm"
  version "3.0.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.15/consult-llm-darwin-arm64.tar.gz"
      sha256 "eaeed250b748b3f0d36ed38674b7305a74e5a44d1f169e0729d0c88b8b9ae78e"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.15/consult-llm-darwin-x64.tar.gz"
      sha256 "cc983fe8ebee6ef61b17fdc00434e026044e9262bab5c03ce683343fe4bd696e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.15/consult-llm-linux-arm64.tar.gz"
      sha256 "851dc51b939a5f06f52b527bb315dabb375e93d5076fa4b0e05bde82423af1c7"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.15/consult-llm-linux-x64.tar.gz"
      sha256 "6a97641935bdc9c27fedb9b9265cd67c754608db9796f6da04b8b78d11929433"
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
