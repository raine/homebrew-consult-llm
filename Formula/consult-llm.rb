class ConsultLlm < Formula
  desc "CLI for consulting LLMs from agent workflows"
  homepage "https://github.com/raine/consult-llm"
  version "3.0.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.5/consult-llm-darwin-arm64.tar.gz"
      sha256 "af8aa41a98e644947fa217de7c25dd83eaa9dd56fb4bc3ba1b0c44edf33e1899"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.5/consult-llm-darwin-x64.tar.gz"
      sha256 "5ad0d07c06cdcf7da73edb51c18c1cedde9ddc190c0f34fcf315c813fb0a5a9e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.5/consult-llm-linux-arm64.tar.gz"
      sha256 "6c8e919e47e56653fb1f4ac05ab75583f97843fb425225e14ed05e0ad720917d"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.5/consult-llm-linux-x64.tar.gz"
      sha256 "33544b6a5a18a2452a88cc8f5694fb9ae1a5aa043e8bbef0228ac4bdf418b849"
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
