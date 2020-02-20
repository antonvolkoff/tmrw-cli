require "hanami/utils/shell_color"

module Tmrw
  module Color
    def green(text)
      Hanami::Utils::ShellColor.call(text, color: :green)
    end

    def red(text)
      Hanami::Utils::ShellColor.call(text, color: :red)
    end

    def blue(text)
      Hanami::Utils::ShellColor.call(text, color: :blue)
    end
  end
end
