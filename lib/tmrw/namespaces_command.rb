module Tmrw
  class NamespacesCommand < Dry::CLI::Command
    include Color

    desc "Manage namespaces"

    def call(*)
      puts "Namespaces:"

      if namespaces.empty?
        print color.dim("There are no namespaces\n\n")

        return
      end

      namespaces.each do |namespace|
        if namespace[:active]
          puts green("> " + namespace[:name])
        else
          puts "  " + namespace[:name]
        end
      end
    end

    private

    def create_namespace
      result = TTY::Prompt.new.yes?("Do you want to create one?")
      return unless result

      name = TTY::Prompt.new.ask("How do you want to name it?")
      puts "New #{green(name)} namespace was created"
    end

    def namespaces
      [
        { name: "tmrw", active: true },
        { name: "demo", active: false },
      ]
    end
  end
end
