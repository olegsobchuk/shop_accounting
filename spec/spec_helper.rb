require 'simplecov'
SimpleCov.start
require 'capybara/rspec'
require 'capybara/poltergeist'
require 'capybara-screenshot/rspec'
require 'rspec/retry'
require 'simplecov'
require 'database_cleaner'
require 'fakeweb'

DEFAULT_PORT = 9887

Capybara.javascript_driver = :poltergeist
Capybara.asset_host = 'http://localhost:3000'
Capybara.server_port = DEFAULT_PORT
Capybara.app_host = "http://lvh.me:#{Capybara.server_port}"
Capybara::Screenshot.prune_strategy = :keep_last_run
Capybara::Screenshot.autosave_on_failure = true

RSpec.configure do |config|
  config.verbose_retry = true
  config.display_try_failure_messages = true

  config.around :each, :js do |example|
    example.run_with_retry retry: 3
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.example_status_persistence_file_path = 'spec/examples.txt'
  config.disable_monkey_patching!

  config.default_formatter = 'doc' if config.files_to_run.one?

  config.profile_examples = 10
  config.order = :random

  Kernel.srand config.seed
end
