# typed: false
# frozen_string_literal: true

class Km < Formula
  desc "Key management CLI for Secure Infrastructure"
  homepage "https://github.com/gobeyondidentity/secure-infra"
  version "0.5.2-test"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/gobeyondidentity/secure-infra/releases/download/v0.5.2-test/km_darwin_amd64.tar.gz"
      sha256 "251e28f754c615bd03785be0593f4df9391033278659c3047e3a886c962c389d"
    end
    if Hardware::CPU.arm?
      url "https://github.com/gobeyondidentity/secure-infra/releases/download/v0.5.2-test/km_darwin_arm64.tar.gz"
      sha256 "83cc79b31d77eebecca2db9c946d831e3e4fd4a2a6e195ca78621e229f8a9312"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/gobeyondidentity/secure-infra/releases/download/v0.5.2-test/km_linux_amd64.tar.gz"
      sha256 "d401a2058de7fef1a4cf248cb843d7a608199d03507b8d8ae44e262c6072926a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/gobeyondidentity/secure-infra/releases/download/v0.5.2-test/km_linux_arm64.tar.gz"
      sha256 "6fd134827e26c4262561044b580b04c68f4acfc743d17cf37f2c84eb610f342f"
    end
  end

  def install
    bin.install "km"
  end

  test do
    system "#{bin}/km", "--help"
  end
end
