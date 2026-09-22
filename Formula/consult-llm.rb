class ConsultLlm < Formula
  desc "CLI for consulting LLMs from agent workflows"
  homepage "https://github.com/raine/consult-llm"
  version "3.0.36"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.36/consult-llm-darwin-arm64.tar.gz"
      sha256 "2ee5b71b0978b43de062c7e00d9c4467d10fa1919687377e8a0d1f89b0774ef0"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.36/consult-llm-darwin-x64.tar.gz"
      sha256 "922dbbf664774c382a883c09d63fda66ce5ab94c697369e357ad0a59474acfef"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.36/consult-llm-linux-arm64.tar.gz"
      sha256 "262760142fbd7939140136b6e84b2a723dfd99e618ad3a4bab454c0c2af8194e"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.36/consult-llm-linux-x64.tar.gz"
      sha256 "8c4e6ba8bec8d135a4b2f752d05423c558a373e00d3259363de0e23747f514ee"
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
