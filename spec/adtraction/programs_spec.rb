RSpec.describe Adtraction::Api::Client do
  before { setup_client }
  let(:client) { Adtraction::Api::Client.new }
  
  describe :channels, vcr: {cassette_name: 'programs'} do
    let(:programs) { client.programs(channel_id: "SOME_CHANNEL_ID", market: "SE", currency: "SEK") }
    let(:program) { programs.first }
    
    it { expect(programs).to be_a_kind_of Array }
    it { expect(programs.size).to eq 1 }

    expectations = {
      id:                   1233068414,
      name:                 "Komplett Bank SE",
      market:               "SE",
      currency:             "SEK",
      url:                  "https://www.komplettbank.se",
      ad_id:                1233068417,
      logo_url:             "https://secure.adtraction.com/image.htm?imgId=1233068412",
      category:             "Banking & Finance",
      cookie_duration:      45,
      pending_active:       false,
      current_segment:      "Standard",
      feed:                 false,
      approval_status:      :not_applied,
      sem_marketing:        :restricted,
      social_marketing:     :allowed,
      email_marketing:      :not_allowed,
      cashback_marketing:   :not_allowed,
      coupon_marketing:     :allowed,
      channel_id:           nil,
      tracking_url:         nil,
      compensations: [
        {
          "name"            =>  "Godkänt lån",
          "value"           =>  1550.0,
          "type"            =>  "SEK",
          "transactionType" =>  :sale
        },
        {
          "name"            =>  "Godkänt Kreditkort",
          "value"           =>  600.0,
          "type"            =>  "SEK",
          "transactionType" =>  :sale
        }
      ]
    }

    it { expect(program).to be_a_kind_of(::Adtraction::Api::Models::Program) }
  
    expectations.each do |key, value|
      it "should have correct value for instance variable #{key}" do
        expect(program.send(key)).to eq value
      end
    end
  end  
end
