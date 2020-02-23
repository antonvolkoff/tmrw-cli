module Tmrw
  class OpenCommand < Dry::CLI::Command
    desc "Opens application in a browser"

    argument :name, desc: "Application name", required: true

    def call(name:, **)
      subdomain = name.gsub("/", "-")
      url = "http://#{subdomain}.tomorrowhq.com"
      system("open #{url}")
    end
  end
end
