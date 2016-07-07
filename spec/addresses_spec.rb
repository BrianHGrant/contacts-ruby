require('rspec')
require('addresses')

describe(Address)
  before do
    Address.clear()
  end

  describe('#initialize') do
    it('returns the attributes for a given address') do
      test_address = Address.new({:street => "36 Evergreen Lane", :city => "Springfield", :state => "Oregon", :zip_code => "53209"})
      expect(test_address.street()).to eq("36 Evergreen Lane")
      expect(test_address.zip_code()).to eq("53209")
    end
  end
end
