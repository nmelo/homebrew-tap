# typed: false
# frozen_string_literal: true

class Bluectl < Formula
  desc "CLI for managing BlueField DPUs via Secure Infrastructure"
  homepage "https://github.com/gobeyondidentity/secure-infra"
  version "0.5.2-test"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/gobeyondidentity/secure-infra/releases/download/v0.5.2-test/bluectl_darwin_amd64.tar.gz"
      sha256 "e0f30341783391ee449190e5560149433691a064390a7403735bb02700ce3b56"
    end
    if Hardware::CPU.arm?
      url "https://github.com/gobeyondidentity/secure-infra/releases/download/v0.5.2-test/bluectl_darwin_arm64.tar.gz"
      sha256 "19dee53c81ab002cab75446ca339625fef4142523b636c5768fb4816e45a1c76"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/gobeyondidentity/secure-infra/releases/download/v0.5.2-test/bluectl_linux_amd64.tar.gz"
      sha256 "90b647b46de5eeb245fb0cda82dfb6b032ffca1844b80e4ce23d6e1206c8b194"
    end
    if Hardware::CPU.arm?
      url "https://github.com/gobeyondidentity/secure-infra/releases/download/v0.5.2-test/bluectl_linux_arm64.tar.gz"
      sha256 "a638b34890199dbe7ad1924ba14ed4b86ce367ccbf2374d80f2ce794d76825e2"
    end
  end

  def install
    bin.install "bluectl"
  end

  test do
    system "#{bin}/bluectl", "--help"
  end
end
