class ConsultLlm < Formula
  desc "CLI for consulting LLMs from agent workflows"
  homepage "https://github.com/raine/consult-llm"
  version "3.0.29"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.29/consult-llm-darwin-arm64.tar.gz"
      sha256 "75a79a42c665de938fcd1f70f418629f94cb232d1608bebb19e20dcc5c26cdb6"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.29/consult-llm-darwin-x64.tar.gz"
      sha256 "87ddd4a04101b560255a703a137dfc7f2a277896c20f0e9034209b64b3680e55"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.29/consult-llm-linux-arm64.tar.gz"
      sha256 "eacd1c91916d2836987f6caaa44cdecf8192573e4ef6d283d437b013813a23fa"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.29/consult-llm-linux-x64.tar.gz"
      sha256 "9a6b5e80e182a10948e3249e6d1c05cd4c4b07b2e84069af4c5007a40fd96404"
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
