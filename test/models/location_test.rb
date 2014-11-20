require 'test_helper'

describe Location do
  describe '#refresh!' do
    it 'calls locator API' do
      location = locations(:two)
      VCR.use_cassette('locator_refresh') do
        location.refresh!
      end
      expect(location.lat).to_equal 44.42
      expect(location.long).to_equal 55.52
    end
  end
end
