require('rspec')
require('addresses')

describe(Address) do
  before() do
    Address.clear()
  end

  describe('#initialize') do
    it('returns the attributes for a given address') do
      test_address = Address.new({:location_name => 'work', :street => "36 Evergreen Lane", :city => "Springfield", :state => "Oregon", :zip_code => "53209"})
      expect(test_address.street()).to eq("36 Evergreen Lane")
      expect(test_address.zip_code()).to eq("53209")
    end
  end
  
  describe(".all") do
    it('returns empty array when no addresses') do
      expect(Address.all()).to eq([])
    end
  end

  describe("#save") do
    it('stores an address into the Address array') do
      test_address = Address.new({:location_name => 'work', :street => "36 Evergreen Lane", :city => "Springfield", :state => "Oregon", :zip_code => "53209"})
      test_address.save()
      expect(Address.all()).to eq([test_address])
    end
  end
end
