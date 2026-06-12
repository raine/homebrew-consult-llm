class ConsultLlm < Formula
  desc "CLI for consulting LLMs from agent workflows"
  homepage "https://github.com/raine/consult-llm"
  version "3.0.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.19/consult-llm-darwin-arm64.tar.gz"
      sha256 "9b8399107bcef906bd6316beed672aad2909811c96cb034191c49cce5d8d2136"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.19/consult-llm-darwin-x64.tar.gz"
      sha256 "4f99ae97281246f84f4943937011762099a697f6b5d0408298e211555327e225"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.19/consult-llm-linux-arm64.tar.gz"
      sha256 "611597c55fdfba27951bcf85fa6a5a53d0d53b284938343abeaa95f29bab037c"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.19/consult-llm-linux-x64.tar.gz"
      sha256 "711e1d158c0f6e1d5f6833e3d96cf52c3af93d1f22a96c8413e3f396c6b28fd5"
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
