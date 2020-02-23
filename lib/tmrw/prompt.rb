require "tty-prompt"

module Tmrw
  module Prompt
    def ask(text)
      TTY::Prompt.new.ask(text)
    end
  end
end
