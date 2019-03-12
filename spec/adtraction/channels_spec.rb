RSpec.describe Adtraction::Api::Client do
  before { setup_client }
  let(:client) { Adtraction::Api::Client.new }
  
  describe :channels, vcr: {cassette_name: 'channels'} do
    let(:channels) { client.approved_channels }
    let(:channel) { channels.first }
    
    it { expect(channels).to be_a_kind_of Array }
    it { expect(channels.count).to eq 3 }

    expectations = {
      id:               111111111111,
      name:             "Test channel 1",
    }

    it { expect(channel).to be_a_kind_of(::Adtraction::Api::Models::Channel) }
  
    expectations.each do |key, value|
      it "should have correct value for instance variable #{key}" do
        expect(channel.send(key)).to eq value
      end
    end
  end  
end
