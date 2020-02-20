require "hanami/utils/shell_color"

module Tmrw
  module Color
    def green(text)
      Hanami::Utils::ShellColor.call(text, color: :green)
    end

    def red(text)
      Hanami::Utils::ShellColor.call(text, color: :red)
    end
  end
end
