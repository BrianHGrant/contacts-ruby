require('rspec')
require('contacts')

describe(Contact) do
  before() do
    Contact.clear()
  end

  describe('#initialize') do
    it('return the attributes of a given contact') do
      test_contact = Contact.new({:first_name => "Bill", :last_name => "Nye", :job => "TV Educator", :job_title => "Host"})
      expect(test_contact.first_name()).to eq("Bill")
      expect(test_contact.job_title()).to eq("Host")
    end
  end

  describe(".all") do
    it('returns empty array when no Contacts') do
      expect(Contact.all()).to eq([])
    end
  end

  describe("#save") do
    it('stores a contact into the Contact array') do
      test_contact = Contact.new({:first_name => "Bill", :last_name => "Nye", :job => "TV Educator", :job_title => "Host"})
      test_contact.save()
      expect(Contact.all()).to eq([test_contact])
    end
  end
end
