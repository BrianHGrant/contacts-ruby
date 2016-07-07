class Address
  attr_reader(:location_name, :street, :city, :state, :zip_code)
  @@addresses = []

  define_method(:initialize) do |attributes|
    @location_name = attributes.fetch(:location_name)
    @street = attributes.fetch(:street)
    @city = attributes.fetch(:city)
    @state = attributes.fetch(:state)
    @zip_code = attributes.fetch(:zip_code)
  end

  define_singleton_method(:clear) do
    @@addresses = []
  end

  define_singleton_method(:all) do
    @@addresses
  end

  define_method(:save) do
    @@addresses.push(self)
  end
end
