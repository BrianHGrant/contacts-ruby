require('rspec')
require('emails')

describe(Email) do
  before() do
    Email.clear()
  end

  describe('#initialize') do
    it('returns the attributes for a given email') do
      test_email = Email.new({:location_name => 'work',  :email => "google@gmail.com"})
      expect(test_email.email()).to eq("google@gmail.com")
      expect(test_email.location_name()).to eq("work")
    end
  end

  describe(".all") do
    it('returns empty array when no emails') do
      expect(Email.all()).to eq([])
    end
  end

  describe("#save") do
    it('stores an email into the emails array') do
      test_email = Email.new({:location_name => 'work',  :email => "google@gmail.com"})
      test_email.save()
      expect(Email.all()).to eq([test_email])
    end
  end
end
