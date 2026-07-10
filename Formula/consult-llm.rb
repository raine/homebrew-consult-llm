class ConsultLlm < Formula
  desc "CLI for consulting LLMs from agent workflows"
  homepage "https://github.com/raine/consult-llm"
  version "3.0.23"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.23/consult-llm-darwin-arm64.tar.gz"
      sha256 "33b7f7170ef9f5f4568175d1b6b8e5834ed69af21f57fd950dfad643679f1a16"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.23/consult-llm-darwin-x64.tar.gz"
      sha256 "d45c3a7738000287784270dba1d88fd25ecd14df0835d115e8fff09460055b5f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.23/consult-llm-linux-arm64.tar.gz"
      sha256 "d7939be34fb1355c0a82cded3c4b9ac46343ece4cff8a8c7a6ea3dc7f290df47"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.23/consult-llm-linux-x64.tar.gz"
      sha256 "406dcdc0abd9170cd05c93f2aaa9a52906f63fc7f71d7c962f42e4a0da4e79e3"
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
