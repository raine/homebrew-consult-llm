class ConsultLlm < Formula
  desc "CLI for consulting LLMs from agent workflows"
  homepage "https://github.com/raine/consult-llm"
  version "3.0.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.8/consult-llm-darwin-arm64.tar.gz"
      sha256 "63a4766e5a85eba6078df8a3f40ee4d2e1981d8f1de96fa4567aef95bb3f489f"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.8/consult-llm-darwin-x64.tar.gz"
      sha256 "f1381222f7981e0ae81eef9b54030d3ed23c2ef6d568a8ac397e53599c6fdde3"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.8/consult-llm-linux-arm64.tar.gz"
      sha256 "4ac61cb180e2be6cff440fa62e353bfc51405b7d6980a290e1e1a7357930bff2"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.8/consult-llm-linux-x64.tar.gz"
      sha256 "9677fd6f8c23e0ce8fba4b24cf0980b2725373fc3740ddd118d45b72d9a187be"
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
