class ConsultLlm < Formula
  desc "CLI for consulting LLMs from agent workflows"
  homepage "https://github.com/raine/consult-llm"
  version "3.0.40"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.40/consult-llm-darwin-arm64.tar.gz"
      sha256 "272719ab4013d473956d8cb73f087a9b909a5f848aacf705503f25ca54e275fc"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.40/consult-llm-darwin-x64.tar.gz"
      sha256 "cb711e5f15e20baf75689615c6e8530fc3911aeb1060a55acbf4912284560f6e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.40/consult-llm-linux-arm64.tar.gz"
      sha256 "add30879608423d27123a02f31b5c4b1f1761058ba87b6b3e3b884f50baf33f7"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.40/consult-llm-linux-x64.tar.gz"
      sha256 "4aa328fc403efdff3cd81957dc2ff575744e9e571dad1371fa8f3e006d178765"
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
