class ConsultLlm < Formula
  desc "CLI for consulting LLMs from agent workflows"
  homepage "https://github.com/raine/consult-llm"
  version "3.0.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.16/consult-llm-darwin-arm64.tar.gz"
      sha256 "230e730a8980369c37bee4ce4ee32e002f0d365604503352c11cce107a808532"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.16/consult-llm-darwin-x64.tar.gz"
      sha256 "45bb18dea3dc04412dd68052bf22e43d8e69be24833202b319e97a02d34f3fff"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.16/consult-llm-linux-arm64.tar.gz"
      sha256 "eb67f8d312ad75daafdecaa2c1ca3820661453a735403cbea59af38ca1dffdff"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.16/consult-llm-linux-x64.tar.gz"
      sha256 "3b336f214dace8e819ea600469d92c2be6c7ae44719dad0c248a428b99c7953a"
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
