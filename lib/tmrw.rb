require "dry/cli"
require "tty-prompt"

require "tmrw/version"
require "tmrw/docker_image"
require "tmrw/color"
require "tmrw/namespaces_command"
require "tmrw/switch_command"
require "tmrw/publish_command"
require "tmrw/containers_command"
require "tmrw/console_command"
require "tmrw/cli"

module Tmrw
  extend self

  def start
    Dry::CLI.new(Tmrw::CLI).call
  end
end
