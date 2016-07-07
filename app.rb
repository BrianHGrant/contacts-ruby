require('sinatra')
require('sinatra/reloader')
require('./lib/contacts')
require('./lib/addresses')
require('./lib/emails')
require('./lib/phone_numbers')
also_reload('./lib/**/*.rb')

get('/') do
  @contacts = Contact.all()
  erb(:index)
end

get('/contact_form') do
  erb(:contact_form)
end

post('/contact_add') do
  first_name = params.fetch('first_name')
  last_name = params.fetch('last_name')
  job = params.fetch('job')
  job_title = params.fetch('job_title')
  @contact = Contact.new({:first_name => first_name, :last_name => last_name, :job => job, :job_title => job_title})
  @contact.save()
  @contacts = Contact.all()
  erb(:index)
end

get('/contact/:id') do
  @contact = Contact.find(params.fetch('id').to_i())
  @emails = Email.all()
  @phone_numbers = PhoneNumber.all()
  @addresses = Address.all()
  erb(:contact)
end

get('/contact/:id/email/new') do
  @contact = Contact.find(params.fetch('id').to_i())
  erb(:emails_form)
end

post('/contact/:id/email') do
  @contact = Contact.find(params.fetch('id').to_i())
  location_name = params.fetch('location_name')
  email = params.fetch('email')
  @email = Email.new({:location_name => location_name, :email => email})
  @email.save()
  @emails = Email.all()
  @phone_numbers = PhoneNumber.all()
  @addresses = Address.all()
  erb(:contact)
end

get('/contact/:id/phone_number/new') do
  @contact = Contact.find(params.fetch('id').to_i())
  erb(:phone_numbers_form)
end

post('/contact/:id/phone_number') do
  @contact = Contact.find(params.fetch('id').to_i())
  location_name = params.fetch('location_name')
  number = params.fetch('number')
  ext = params.fetch('ext')
  @phone_number = PhoneNumber.new({:location_name => location_name, :number => number, :ext => ext})
  @phone_number.save()
  @emails = Email.all()
  @phone_numbers = PhoneNumber.all()
  @addresses = Address.all()
  erb(:contact)
end

get('/contact/:id/address/new') do
  @contact = Contact.find(params.fetch('id').to_i())
  erb(:addresses_form)
end

post('/contact/:id/address') do
  @contact = Contact.find(params.fetch('id').to_i())
  location_name = params.fetch('location_name')
  street = params.fetch('street')
  city = params.fetch('city')
  state = params.fetch('state')
  zip_code = params.fetch('zip_code')
  @address = Address.new({:location_name => location_name, :street => street, :city => city, :state => state, :zip_code => zip_code})
  @address.save()
  @emails = Email.all()
  @phone_numbers = PhoneNumber.all()
  @addresses = Address.all()
  erb(:contact)
end
