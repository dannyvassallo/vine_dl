require_relative "../lib/vine_dl"

require "minitest"
require "minitest/pride"
require "minitest/autorun"

require "dotenv"
Dotenv.load

SPEC_ROOT_DIR = __dir__
NO_MOCKS = ["1", "true", "yes"].include?(ENV["NO_MOCKS"])
NO_DELETE_DOWNLOADED_FILES = ["1", "true", "yes"].include?(ENV["NO_DELETE_DOWNLOADED_FILES"])

Dir["#{SPEC_ROOT_DIR}/support/**/*.rb"].each(&method(:require))
Dir["#{SPEC_ROOT_DIR}/mocks/**/*.rb"].each(&method(:require)) unless NO_MOCKS
