module Tmrw
  class PublishCommand < Dry::CLI::Command
    include Color

    desc "Publish application"

    argument :name, desc: "Application name", required: true

    def call(name:, **)
      tag = "registry.tomorrowhq.com/#{name}:latest"
      image = DockerImage.new(tag: tag)

      puts blue("Building docker image:")
      image.build!

      puts blue("Pushing image to registry:")
      image.push!

      puts green("Completed!")
    rescue StandardError => e
      puts red(e.message)
    end
  end
end
