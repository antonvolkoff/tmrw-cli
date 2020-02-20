require "dry/cli"
require "tty-prompt"

require "tmrw/version"
require "tmrw/cli"

module Tmrw
  extend self

  def start
    Dry::CLI.new(Tmrw::CLI).call
  end
end
