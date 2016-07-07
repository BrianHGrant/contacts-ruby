class PhoneNumber
  attr_reader(:location_name, :number, :ext)
  @@phonenumbers = []

  define_method(:initialize) do |attributes|
    @location_name = attributes.fetch(:location_name)
    @number = attributes.fetch(:number)
    @ext = attributes.fetch(:ext)
  end

  define_singleton_method(:clear) do
    @@phonenumbers = []
  end

  define_singleton_method(:all) do
    @@phonenumbers
  end

  define_method(:save) do
    @@phonenumbers.push(self)
  end
end
