module Tmrw
  module CLI
    extend Dry::CLI::Registry

    register "publish", PublishCommand
    register "open", OpenCommand

    if ENV["ALPHA"]
      register "namespaces", NamespacesCommand
      register "switch", SwitchCommand
      register "containers", ContainersCommand
      register "console", ConsoleCommand
    end
  end
end
