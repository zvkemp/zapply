
ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)

require 'minitest/autorun'
require 'minitest/pride'
require 'eco'
Dir[Rails.root + "factories/*.rb"].each(&method(:require))
Dir[Rails.root + "spec/helpers/*.rb"].each(&method(:require))

require 'capybara/rails'
require 'database_cleaner'
require 'active_support/testing/setup_and_teardown'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist

Capybara.default_selector = :css
Capybara.default_wait_time = 3

DatabaseCleaner.strategy = :truncation

# tests           List of file names or glob patterns of tests to run. Default: ["test/**/{test,}*{,test}.rb"]
# exclude         List of file names or globs to exclude from tests list. Default: []
# pattern         Regexp pattern that all test names must match to be eligible to run. Default: /.*/ (all)
# matchcase       Regexp pattern that all test cases must match to be eligible to run. Default: nil (all)
# loadpath        Add these folders to the $LOAD_PATH. Default: ['lib']
# requires        Libs to require when running tests. Default: []
# format          Reporter type (:pretty, :dot, :cue, :marshal, :outline, :progress). Default: :pretty
# live            Test against live install (i.e. Don't use loadpath option). Default: false
# verbose         Verbose output? Default: false
# trace           Number of backtrace lines to display. Default: set from ENV or nil (all)
# natural         Use natural language case names.  Default: false
# ansi            Force colorized output (requires 'ansi' gem). Default: set from ENV or nil (auto)

# Turn.config.format = :cue

class MiniTest::Spec
  include ZapplyLite::TestHelpers::UsersTestHelper
  
  before :each do
    DatabaseCleaner.clean
  end

end

class IntegrationTest < MiniTest::Spec
  include Rails.application.routes.url_helpers
  include Capybara::DSL
  include Warden::Test::Helpers
  Warden.test_mode!

  def use_javascript
    Capybara.current_driver = Capybara.javascript_driver
  end

  after do
    Warden.test_reset!
    Capybara.reset_sessions!
  end

  register_spec_type(/integration$/, self)
end