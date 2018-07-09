module CampaignInspector
  LOCAL_CAMPAIGNS = File.join(File.dirname(__FILE__), '..', '..', 'data', 'campaigns.yml')

  Campaign = Struct.new(:id, :job_id, :status, :external_reference, :ad_description) do
    def self.find_by_external_reference(reference)
      all.detect { |c| c.external_reference == reference }
    end

    def self.all
      YAML.load_file(LOCAL_CAMPAIGNS)
    end
  end
end
