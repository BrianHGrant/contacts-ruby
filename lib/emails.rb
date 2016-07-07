class Email
  attr_reader(:location_name, :email)
  @@emails = []

  define_method(:initialize) do |attributes|
    @location_name = attributes.fetch(:location_name)
    @email = attributes.fetch(:email)
  end

  define_singleton_method(:clear) do
    @@emails = []
  end

  define_singleton_method(:all) do
    @@emails
  end

  define_method(:save) do
    @@emails.push(self)
  end
end
