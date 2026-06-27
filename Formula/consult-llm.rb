class ConsultLlm < Formula
  desc "CLI for consulting LLMs from agent workflows"
  homepage "https://github.com/raine/consult-llm"
  version "3.0.22"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.22/consult-llm-darwin-arm64.tar.gz"
      sha256 "96093bc3c5a320f6d21034b07049968547f7acdb8a707dde51270dd629161c43"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.22/consult-llm-darwin-x64.tar.gz"
      sha256 "8185d7c5a344ce81244925a27ed0c1d5d8f491dd1b16e300fe2222ef6a968ebd"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/consult-llm/releases/download/v3.0.22/consult-llm-linux-arm64.tar.gz"
      sha256 "363ea13d150ec8b15d012b8faf986946554d8762fe64ab4f43a4d30b35971a29"
    else
      url "https://github.com/raine/consult-llm/releases/download/v3.0.22/consult-llm-linux-x64.tar.gz"
      sha256 "bfc6ff21aab060975592f0ab4502c907065657f6a46e125e62d148e20cc57a58"
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
