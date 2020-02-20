module Tmrw
  class PublishCommand < Dry::CLI::Command
    include Color

    desc "Publish application"

    argument :name, desc: "Application name", required: true

    def call(name:, **)
      image = "registry.tomorrowhq.com/tmrw/#{name}:latest"

      print "Building docker image:\n"
      if !system("docker build -t #{image} .")
        print red("Failed to build docker image\n")
        return
      end

      print "Pushing image to registry:\n"
      if !system("docker push #{image}")
        print red("Failed to push image to registry\n")
        return
      end

      puts green("Completed!")
    end
  end
end
