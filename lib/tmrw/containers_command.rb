module Tmrw
  class ContainersCommand < Dry::CLI::Command
    include Color

    desc "Manage containers"

    def call(*)
      puts "Containers:"
      containers.each do |c|
        if c[:status] == "running"
          print c[:name], ": ", green(c[:status]), "\n"
        else
          print c[:name], ": ", red(c[:status]), "\n"
        end
      end
    end

    private

    def containers
      [
        { name: "hello", status: "running" },
        { name: "broken-hello", status: "dead" },
      ]
    end
  end
end
