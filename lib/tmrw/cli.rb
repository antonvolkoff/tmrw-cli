module Tmrw
  module CLI
    extend Dry::CLI::Registry

    register "namespaces", NamespacesCommand
    register "switch", SwitchCommand
    register "publish", PublishCommand
    register "containers", ContainersCommand
    register "console", ConsoleCommand
  end
end
