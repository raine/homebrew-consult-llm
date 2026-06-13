class ConsultLlm < Formula
  desc "CLI for consulting LLMs from agent workflows"
  homepage "https://github.com/raine/consult-llm"
  version "3.0.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.20/consult-llm-darwin-arm64.tar.gz"
      sha256 "edc157b50da114b64436d8431a00dabd3784ce44febc2f356a43371302691da9"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.20/consult-llm-darwin-x64.tar.gz"
      sha256 "62604c4c5d9aaf34b3eaf9338fa38b41552b5e3b6833c426ff3c1c4ea98f6d27"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.20/consult-llm-linux-arm64.tar.gz"
      sha256 "d57ba11648e5e73d314d1a69c97a472caf4e030ba2892fd40b501d0e65e02b0a"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.20/consult-llm-linux-x64.tar.gz"
      sha256 "dc44b254f980de2419dad1f9612e16a5f763b6a9f054ed5016cbdb4cec0a28bd"
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
