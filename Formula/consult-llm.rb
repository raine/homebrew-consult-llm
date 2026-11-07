class ConsultLlm < Formula
  desc "CLI for consulting LLMs from agent workflows"
  homepage "https://github.com/raine/consult-llm"
  version "3.0.39"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.39/consult-llm-darwin-arm64.tar.gz"
      sha256 "8360bdffbe7550507c587e3eb0dd4cd117de7f441d8be6a0eabd4a0c94359b80"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.39/consult-llm-darwin-x64.tar.gz"
      sha256 "a3a148f68af09b9ed156393423a920c769b1b2cffe9eddefe4b8bacd34d0cc36"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.39/consult-llm-linux-arm64.tar.gz"
      sha256 "cd33b24dafefffec1e4cc30183f0119d5bd827be75582a6e644969066c1c4bf2"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.39/consult-llm-linux-x64.tar.gz"
      sha256 "d031c53e14bed02d149efca9397553198ae4421b0c94725d1b42e16cacf585d7"
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
