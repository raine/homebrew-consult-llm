class ConsultLlm < Formula
  desc "CLI for consulting LLMs from agent workflows"
  homepage "https://github.com/raine/consult-llm"
  version "3.0.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.18/consult-llm-darwin-arm64.tar.gz"
      sha256 "901cfc4463f1ac747ef575ab7d579018a5c52d5d00fcf1016f6d0ebf677c6dee"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.18/consult-llm-darwin-x64.tar.gz"
      sha256 "2a0356a51dba4b93a0acb355718fa0cc6563948373f9b0fa138a77e84f921309"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.18/consult-llm-linux-arm64.tar.gz"
      sha256 "49aca90d41652ac19a346efb513da49da7dc8cb5b920a1bb321fd7233b22191b"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.18/consult-llm-linux-x64.tar.gz"
      sha256 "1e23545e1c617b069bf2270cdcbd26c438f73d89429fe6f3ce846105f7e47182"
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
