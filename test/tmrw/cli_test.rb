require "test_helper"

module Tmrw
  class CliTest < Minitest::Test
    def test_that_it_has_a_version_number
      refute_nil ::Tmrw::Cli::VERSION
    end

    def test_it_does_something_useful
      assert false
    end
  end
end
