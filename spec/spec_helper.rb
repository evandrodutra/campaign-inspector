require 'campaign_inspector'

CampaignInspector::LOCAL_CAMPAIGNS = File.join(File.dirname(__FILE__), 'fixtures', 'campaigns.yml')

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'

  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
