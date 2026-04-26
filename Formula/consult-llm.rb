class ConsultLlm < Formula
  desc "CLI for consulting LLMs from agent workflows"
  homepage "https://github.com/raine/consult-llm"
  version "3.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.0/consult-llm-darwin-arm64.tar.gz"
      sha256 "867646516f7c838a99754ac9bad3955561eef1a579ccf31de8a23bb352c5f6e6"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.0/consult-llm-darwin-x64.tar.gz"
      sha256 "8ed88cd3922d4fe4b25445efe5f3b4b62ba2b65601998baf4818399bddc44284"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.0/consult-llm-linux-arm64.tar.gz"
      sha256 "74d120882142c81832c8bb4bbd337dcffcc6f744ac4540b63144c86217ddfc66"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.0/consult-llm-linux-x64.tar.gz"
      sha256 "dfd600ac55fafd0c9d792ebd53a091b30c43dc92cb2f30d2d0a25902f511d216"
    end
  end

  def install
    bin.install "consult-llm"
    bin.install "consult-llm-monitor"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/consult-llm --version")
  end
end
