class ConsultLlm < Formula
  desc "CLI for consulting LLMs from agent workflows"
  homepage "https://github.com/raine/consult-llm"
  version "3.0.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.11/consult-llm-darwin-arm64.tar.gz"
      sha256 "30a2e433f19eb8639fe7d0c8ea8da8aebaf59078d30eec8c3dc6ff711660a11a"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.11/consult-llm-darwin-x64.tar.gz"
      sha256 "fe0edfc92d3c4804c09eaea742ec0ae6fd7912f6ef55d66a11cacdeebebf00e9"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.11/consult-llm-linux-arm64.tar.gz"
      sha256 "6e590323cc5b86451b5b4db7321ea4549a019537f4f280e633bf6549069ef0dd"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.11/consult-llm-linux-x64.tar.gz"
      sha256 "019ab161c8086508d6ca9375eb584f8b7622dce683a315b068396f205812136b"
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
