class ConsultLlm < Formula
  desc "CLI for consulting LLMs from agent workflows"
  homepage "https://github.com/raine/consult-llm"
  version "3.0.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.10/consult-llm-darwin-arm64.tar.gz"
      sha256 "b972a6cffed4c52c92166bcd51f874f5383a885e44cd3ef600e48d43afc00472"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.10/consult-llm-darwin-x64.tar.gz"
      sha256 "751897a0ef5721065f159fc9699a61bf02065d4869cf0d3a98027ede069a521d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.10/consult-llm-linux-arm64.tar.gz"
      sha256 "d6e99637833f6f475479384b100f77a946af1525a6a083c440edac0cc7f9e405"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.10/consult-llm-linux-x64.tar.gz"
      sha256 "cde2f6be3c55b268480d866e3e2b0bbeb673c78eb362ee12203870060e5fb29f"
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
