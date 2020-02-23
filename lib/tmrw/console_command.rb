require "readline"

module Tmrw
  class ConsoleCommand < Dry::CLI::Command
    include Color

    desc "Tomorrow console"

    def call(*)
      @current_namespace_name = "tmrw"

      loop do
        prompt = "#{blue(@current_namespace_name)} > "
        line = Readline.readline(prompt, true)
        evaluate(line)
      end
    rescue Interrupt
      print "\nBye. Exiting console\n"
    end

    private

    def evaluate(command)
      case command.strip
      when "help"
        doc = <<~MARKDOWN
          __Commands:__

          `namespaces` - returns list of avaliable namespaces
          `switch` - switch between namespaces
          `publish` - build image and push it to registry
          `list` - list of availiable containers in namespace

          To learn more about a command type `help [command]`
        MARKDOWN

        puts TTY::Markdown.parse(doc)
      when "exit", "quit"
        raise Interrupt
      when "namespaces"
        Tmrw::NamespacesCommand.new(command_name: "namespaces").call
      else
        puts "Unkown command"
        puts "Enter help to see list of command"
      end
    end
  end
end
