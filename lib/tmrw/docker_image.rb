module Tmrw
  class DockerImage
    attr_reader :tag

    def initialize(tag:)
      @tag = tag
    end

    def build!
      ok = system("docker build -t #{tag} .")
      raise "Failed to build docker image" unless ok
    end

    def push
      ok = system("docker push #{tag}")
      raise "Failed to push image to registry" unless ok
    end
  end
end
