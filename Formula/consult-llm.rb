class ConsultLlm < Formula
  desc "CLI for consulting LLMs from agent workflows"
  homepage "https://github.com/raine/consult-llm"
  version "3.0.25"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.25/consult-llm-darwin-arm64.tar.gz"
      sha256 "dd0b1dc07c67b511b34a0c2f8685f8440fdc4f0026f8b5fd59356ae8768e3e43"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.25/consult-llm-darwin-x64.tar.gz"
      sha256 "51a6a1485fbeca50cc8261c6f9d2ae65ed2d1b68334d9a61b79ff95f4a7605e7"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.25/consult-llm-linux-arm64.tar.gz"
      sha256 "4c8100aa61f80fb8eed9ba58ada799649a4e6c53ab236ec3bf21cee0ab202f7a"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.25/consult-llm-linux-x64.tar.gz"
      sha256 "32ad8d182f79ec24ab4439ae3737a4dbfbe2f39418890973032f1041902a6132"
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
