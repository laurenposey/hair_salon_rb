require('spec_helper')

describe(Stylist) do
  describe('#name') do
    it('will display the stylists name') do
      test_stylist = Stylist.new({:name => 'Emma', :id => nil})
      expect(test_stylist.name()).to(eq('Emma'))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('will save the stylist') do
      test_stylist = Stylist.new({:name => 'Kesley', :id => nil})
      test_stylist.save()
      expect(Stylist.all()).to(eq([test_stylist]))
    end
  end

  describe('#==') do
    it('is the same stylist if the info matches') do
      stylist1 = Stylist.new({:name => 'Lisa', :id => nil})
      stylist2 = Stylist.new({:name => 'Lisa', :id => nil})
      expect(stylist1).to(eq(stylist2))
    end
  end

  describe('.find') do
    it("returns a stylist based on its id") do
      stylist1 = Stylist.new({:name => "April", :id => nil})
      stylist2 = Stylist.new({:name => "Mary", :id => nil})
      stylist1.save()
      stylist2.save()
      expect(Stylist.find(stylist1.id)).to(eq(stylist1))
    end
  end

  describe("#update") do
    it("lets you update stylist name") do
      stylist = Stylist.new({:name => "Wendol", :id => nil})
      stylist.save()
      stylist.update({:name => "Hazel"})
      expect(stylist.name()).to(eq("Hazel"))
    end
  end

  describe("#delete") do
    it("lets you remove a stylist from the database") do
      stylist1 = Stylist.new({:name => "", :id => nil})
      stylist2 = Stylist.new({:name => "", :id => nil})
      stylist1.save()
      stylist2.save()
      stylist1.delete()
      expect(Stylist.all()).to(eq([stylist2]))
    end
  end

  describe("#clients") do
    it("returns all of the clients for a stylist") do
      client = Client.new({:name => "Grace Hopper", :id => nil, :stylist_id => stylist.id()})
      client.save()
      client2 = Client.new({:name => "Ada Lovelace", :id => nil, :stylist_id => stylist.id()})
      client2.save()
      stylist = Stylist.new({:name => "Ken", :id => nil})
      stylist.save()
      expect(stylist.clients()).to(eq([client, client2]))
    end
  end

end
