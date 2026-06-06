class ConsultLlm < Formula
  desc "CLI for consulting LLMs from agent workflows"
  homepage "https://github.com/raine/consult-llm"
  version "3.0.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.14/consult-llm-darwin-arm64.tar.gz"
      sha256 "411de477288c557ff0756fa29f2d9cc231d5f7a142f2f82378b5be098cc0a292"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.14/consult-llm-darwin-x64.tar.gz"
      sha256 "17e69159be3c49ab567e3c18bd783a65a8884d0da84ac459974d706d6c7c6adf"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.14/consult-llm-linux-arm64.tar.gz"
      sha256 "6719c108ae6f5c78c8b1706c4f136e302cf99052a3b2d2e6e6bc461bda4ad376"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.14/consult-llm-linux-x64.tar.gz"
      sha256 "fc9669a2afc0be30e2054559489b6233c6689de2121b499365bfe886cbc7b7de"
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
