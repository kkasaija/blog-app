
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require "capybara/rspec"
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end
RSpec.configure do |config|
  config.fixture_path = "#{Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  # config.filter_gems_from_backtrace("gem name")
end


Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
 end
 
 Capybara.javascript_driver = :selenium_chrome
 RSpec.configure do |config|
   # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
   config.fixture_path = "#{::Rails.root}/spec/fixtures"
   config.use_transactional_fixtures = false
   config.infer_spec_type_from_file_location!
   config.filter_rails_from_backtrace!
 
   config.before(:suite) do
     DatabaseCleaner.clean_with(:truncation)
   end
 
   config.before(:each) do
     DatabaseCleaner.strategy = :transaction
   end
 
   config.before(:each, js: true) do
     DatabaseCleaner.strategy = :truncation
   end
 
   # This block must be here, do not combine with the other `before(:each)` block.
   # This makes it so Capybara can see the database.
   config.before(:each) do
     DatabaseCleaner.start
   end
 
   config.after(:each) do
     DatabaseCleaner.clean
   end