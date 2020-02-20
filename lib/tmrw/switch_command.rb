module Tmrw
  class SwitchCommand < Dry::CLI::Command
    include Color

    desc "Switch namespace"

    argument :name, desc: "Name of the namespace", required: true

    def call(name:, **)
      print "You have switched to ", green(name), " namespace\n"
    end
  end
end
