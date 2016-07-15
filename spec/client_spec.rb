require('spec_helper')

describe(Client) do

  describe(".all") do
    it("is empty at first") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe('#name') do
    it('will display the client name') do
      test_client = Client.new({:name => 'Emma', :id => nil})
      expect(test_client.name()).to(eq('Emma'))
    end
  end

end
