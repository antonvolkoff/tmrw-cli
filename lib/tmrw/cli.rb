require "tmrw/color"
require "tmrw/namespaces_command"
require "tmrw/switch_command"
require "tmrw/publish_command"
require "tmrw/containers_command"

module Tmrw
  module CLI
    extend Dry::CLI::Registry

    register "namespaces", NamespacesCommand
    register "switch", SwitchCommand
    register "publish", PublishCommand
    register "containers", ContainersCommand
  end
end
