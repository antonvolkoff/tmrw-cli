module Tmrw
  class DemoCommand < Dry::CLI::Command
    desc "Step by step guide to Tomorrow platform"

    def call(*)
      context = { name: "demo/test", url: "http://demo-test.tomorrowhq.com" }

      intro(context)
      select_project_type(context)
      add_dockerfile(context)
      add_content(context)
      publish(context)
      open_website(context)
    end

    private

    def intro(context)
      pid = spawn("docker login -u tmrw -p 123456 registry.tomorrowhq.com")
      Process.wait pid
    end

    def select_project_type(context); end

    def add_dockerfile(context)
      dockerfile = <<~DOCKERFILE
        FROM nginx:alpine
        COPY index.html /usr/share/nginx/html/index.html
      DOCKERFILE

      File.open("Dockerfile", "w") { |file| file.write(dockerfile) }
    end

    def add_content(context)
      index = <<~HTML
        <!DOCTYPE html>
        <html lang="en">
        <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <meta http-equiv="X-UA-Compatible" content="ie=edge">
          <title>Tomorrow Demo</title>
        </head>
        <body>
          <strong>My first deploy</strong>
        </body>
        </html>
      HTML

      File.open("index.html", "w") { |file| file.write(index) }
    end

    def publish(context)
      PublishCommand.new(command_name: "tmrw").call(name: context[:name])
    end

    def open_website(context)
      system("open #{context[:url]}")
    end
  end
end