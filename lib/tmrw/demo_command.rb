module Tmrw
  class DemoCommand < Dry::CLI::Command
    include Color
    include Prompt

    desc "Step by step guide to Tomorrow platform"

    def call(*)
      context = { name: "demo/test" }

      setup(context)
      intro(context)
      create_application(context)
      dockerize(context)
      publish(context)

      doc = <<~MARKDOWN
        That's it. Done. You project is deployed and avaliable online.
        Now execute command bellow to open it in your browser:

            tmrw open #{context[:name]}
      MARKDOWN
      puts markdown(doc)
    end

    private

    def setup(context)
      stdout, stderr, status = Open3.capture3(
        "docker login -u tmrw -p 123456 registry.tomorrowhq.com"
      )
    end

    def intro(context)
      doc = <<~MARKDOWN
        # Tomorrow Demo

        First of all thank you for trying out Tomorrow.

        This guide will take you from setting up your first projet on Tomorrow
        platform.

        You will be taken through following steps:
        1. Creating an application
        2. Containerizing an application
        3. Publishing application online

      MARKDOWN
      puts markdown(doc)

      print "\n"
      ask(blue("Hit RETURN when you are ready to continue..."))
      print "\n"
    end

    def create_application(context)
      index_html = <<~HTML
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

      doc = <<~MARKDOWN
        ## Step 1. Create an application

        For now we will setup simplest application possible that will contain
        just index.html file with following content:

      MARKDOWN
      puts markdown(doc)

      puts yellow(index_html)

      print "\n"
      ask(blue("Hit RETURN when you are ready to continue..."))
      print "\n"

      File.open("index.html", "w") { |file| file.write(index_html) }
    end

    def dockerize(context)
      dockerfile = <<~DOCKERFILE
        FROM nginx:alpine
        COPY index.html /usr/share/nginx/html/index.html
      DOCKERFILE

      doc = <<~MARKDOWN
        ## Step 2. Dockerize

        Now we need to specify container for our application. For this simple
        application will add following Dockerfile:

            #{dockerfile}

      MARKDOWN
      puts markdown(doc)

      print "\n"
      ask(blue("Hit RETURN when you are ready to continue..."))
      print "\n"

      File.open("Dockerfile", "w") { |file| file.write(dockerfile) }
    end

    def publish(context)
      doc = <<~MARKDOWN
        ## Step 3. Publishing.

        Now all everything is set and done to put our project online.
        Now we need to execute command bellow to continue:

            tmrw publish #{context[:name]}
      MARKDOWN
      puts markdown(doc)

      print "\n"
      ask(blue("Hit RETURN when you are ready to continue..."))
      print "\n\n\n"

      PublishCommand.new(command_name: "tmrw").call(name: context[:name])
    end

    def markdown(doc)
      TTY::Markdown.parse(doc)
    end
  end
end