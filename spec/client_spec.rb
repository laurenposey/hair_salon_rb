require('spec_helper')

describe(Client) do
  describe('#name') do
    it('will display the clients name') do
      test_client = Client.new({:name => 'Emma', :id => nil})
      expect(test_client.name()).to(eq('Emma'))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Client.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('will save the client') do
      test_client = Client.new({:name => 'Kesley', :id => nil})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

  describe('#==') do
    it('is the same client if the info matches') do
      client1 = Client.new({:name => 'Lisa', :id => nil})
      client2 = Client.new({:name => 'Lisa', :id => nil})
      expect(client1).to(eq(client2))
    end
  end

  describe('.find') do
    it("returns a client based on its id") do
      client1 = Client.new({:name => "April", :id => nil})
      client2 = Client.new({:name => "Mary", :id => nil})
      client1.save()
      client2.save()
      expect(Client.find(client1.id)).to(eq(client1))
    end
  end

  describe("#update") do
    it("lets you update clients name") do
      client = Client.new({:name => "Wendol", :id => nil})
      client.save()
      client.update({:name => "Hazel"})
      expect(client.name()).to(eq("Hazel"))
    end


  end

  describe("#delete") do
    it("lets you remove a client from the database") do
      client1 = Client.new({:name => "Mindy", :id => nil})
      client2 = Client.new({:name => "Cindy", :id => nil})
      client1.save()
      client2.save()
      client1.delete()
      expect(Client.all()).to(eq([client2]))
    end
  end

end
