class ConsultLlm < Formula
  desc "CLI for consulting LLMs from agent workflows"
  homepage "https://github.com/raine/consult-llm"
  version "3.0.24"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.24/consult-llm-darwin-arm64.tar.gz"
      sha256 "2c3d2fc0a90c3a1f1dd0a2f0c6ccdb46692e0c5d08dda65313e382fd2e4b9cd4"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.24/consult-llm-darwin-x64.tar.gz"
      sha256 "4809c62ee8474d080ab5d824c35a8e85bf1eacffa4a0fdea57909ddcb5476621"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.24/consult-llm-linux-arm64.tar.gz"
      sha256 "0b2c280af7deabda8186bd1084461ec80306f5adbe433aeced7688ac0eb3887d"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.24/consult-llm-linux-x64.tar.gz"
      sha256 "2d884da40bd40fd5d8950eca02a6f57e13b5dcab759bebf0a389dc5220908875"
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
