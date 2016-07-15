class Client
  attr_reader(:name, :id, :stylist_id)

  define_method (:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @stylist_id = attributes.fetch(:stylist_id)
    @id = attributes[:id]
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each do |client|
      name = client.fetch('name')
      id = client.fetch('id').to_i()
      stylist_id = client.fetch('stylist_id').to_i()
      clients.push(Client.new({:name => name, :id => id, :stylist_id => stylist_id}))
    end
    clients
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO clients (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_client|
    self.id() == another_client.id()
  end

  define_singleton_method(:find) do |id|
    client = DB.exec("SELECT * FROM clients WHERE id = #{id};")
    name = client.first().fetch('name')
    id = client.first().fetch('id').to_i()
    stylist_id = client.first().fetch('stylist_id').to_i()
    Client.new({:name => name, :id => id, :stylist_id => stylist_id})
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name, @name)
    @stylist_id = attributes.fetch(:stylist_id, @stylist_id)
    @id = self.id()
    DB.exec("UPDATE clients SET name = '#{@name}' WHERE id = #{@id};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM clients WHERE id=#{self.id()};")
  end

end
