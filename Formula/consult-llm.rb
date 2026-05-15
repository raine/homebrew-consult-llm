class ConsultLlm < Formula
  desc "CLI for consulting LLMs from agent workflows"
  homepage "https://github.com/raine/consult-llm"
  version "3.0.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.12/consult-llm-darwin-arm64.tar.gz"
      sha256 "a57273af21e082673c56b476acf9dc22a62784159286fe3494e538e996159779"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.12/consult-llm-darwin-x64.tar.gz"
      sha256 "711cfc629cbd75818a7a2408caa8380714eaaa8ed58402c50297c7418f29a491"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.12/consult-llm-linux-arm64.tar.gz"
      sha256 "1003b5ff49ba591face2b0e2f06682fd379db36f9155da17ddc3b1f0da359ef9"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.12/consult-llm-linux-x64.tar.gz"
      sha256 "4ff6a19879173b8e1f2dc7757b8419f88d65305c9798ed4474dddd47146d1fec"
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
