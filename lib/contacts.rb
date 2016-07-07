class Contact
  attr_reader(:first_name, :last_name, :job, :job_title)
  @@contacts = []

  define_method(:initialize) do |attributes|
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @job = attributes.fetch(:job)
    @job_title = attributes.fetch(:job_title)
  end

  define_singleton_method(:clear) do
    @@contacts = []
  end

  define_singleton_method(:all) do
    @@contacts
  end

  define_method(:save) do
    @@contacts.push(self)
  end
end
