require('rspec')
require('phone_numbers')

describe(PhoneNumber) do
  before() do
    PhoneNumber.clear()
  end

  describe('#initialize') do
    it('returns the attributes for a given number') do
      test_phone_number = PhoneNumber.new({:location_name => 'work',  :number => "503-867-5309", :ext => "901"})
      expect(test_phone_number.number()).to eq("503-867-5309")
      expect(test_phone_number.ext()).to eq("901")
    end
  end

  describe(".all") do
    it('returns empty array when no phone numbers') do
      expect(PhoneNumber.all()).to eq([])
    end
  end

  describe("#save") do
    it('stores a phone number into the phone numbers array') do
      test_phone_number = PhoneNumber.new({:location_name => 'work',  :number => "503-867-5309", :ext => "901"})
      test_phone_number.save()
      expect(PhoneNumber.all()).to eq([test_phone_number])
    end
  end
end
