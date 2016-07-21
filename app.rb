require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/client")
require("./lib/stylist")
require('pg')

DB = PG.connect({:dbname => "hair_salon"})


get("/") do
  erb(:index)
end

get('/stylists') do
  @stylists = Stylist.all()
  erb(:stylists)
end

get("/stylists/new")do
  erb(:stylist_form)
end

post('/stylists') do
  name = params.fetch("name")
  stylist = Stylist.new({:name => name, :id => nil})
  stylist.save()
  @stylists = Stylist.all()
  erb(:stylists)
end


get("/stylists/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist)
end

get("/stylists/:id/edit") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist_edit_form)
end

patch("/stylists/:id") do
  name = params.fetch("name")
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.update({:name => name})
end

get("/clients") do
  @clients = Client.all()
  erb(:clients)
end

get('/clients/new') do
  @stylists = Stylist.all()
  erb(:client_form)
end

post("/clients") do
  name = params.fetch("name")
  stylist_id = params.fetch("stylist_id").to_i()
  @stylist = Stylist.find(stylist_id)
  @client = Client.new({:name => name, :id => nil, :stylist_id => stylist_id})
  @client.save()
  @clients = Client.all()
  erb(:clients)
end

get("/clients/:id") do
  @client = Client.find(params.fetch("id").to_i())
  erb(:client)
end

get("/clients/:id/edit") do
  @client = Client.find(params.fetch("id").to_i())
  erb(:client_edit_form)
end

patch("/clients/:id") do
  name = params.fetch("name")
  stylist_id = params.fetch("stylist_id").to_i()
  @stylist = Stylist.find(stylist_id)
  @client = Client.find(params.fetch("id").to_i())
  @client.update({:name => name, :stylist_id => stylist_id})
  erb(:clients)
end

delete("/stylists/:id/delete") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.delete()
  @stylists = Stylist.all()
  erb(:stylists)
end

delete("/clients/:id/delete") do
  @client = Client.find(params.fetch("id").to_i())
  @client.delete()
  @clients = Client.all()
  erb(:clients)
end
