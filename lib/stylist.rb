class Stylist
  attr_reader(:name, :id)

  define_method (:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes[:id]
  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    stylists = []
    returned_stylists.each do |stylist|
      name = stylist.fetch('name')
      id = stylist.fetch('id').to_i()
      stylists.push(Stylist.new({:name => name, :id => id}))
    end
    stylists
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_stylist|
    self.id() == another_stylist.id()
  end

  define_singleton_method(:find) do |id|
    stylist = DB.exec("SELECT * FROM stylists WHERE id = #{id};")
    name = stylist.first().fetch('name')
    id = stylist.first().fetch('id').to_i()
    Stylist.new({:name => name, :id => id})
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name, @name)
    @id = self.id()
    DB.exec("UPDATE stylists SET name = '#{@name}' WHERE id = #{@id};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM stylists WHERE id=#{self.id()};")
  end

  # define_method(:clients) do
  #   stylist_clients = []
  #   results = DB.exec("SELECT client_id FROM client_stylist WHERE stylist_id = #{self.id()};")
  #   results.each() do |result|
  #     client_id = result.fetch("client_id").to_i()
  #     client = DB.exec("SELECT * FROM clients WHERE id = #{client_id};")
  #     name = client.first().fetch("name")
  #     stylist_clients.push(Client.new({:name => name, :id => client_id}))
  #   end
  #   stylist_clients
  # end
end
