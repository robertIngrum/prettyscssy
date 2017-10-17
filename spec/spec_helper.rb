require 'bundler/setup'
require 'pretty_scssy'
require 'pry'

RSpec.configure do |config|
  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  config.expect_with(:rspec) { |c| c.syntax = :expect }

  config.example_status_persistence_file_path = '.rspec_status'
  config.disable_monkey_patching!
end
