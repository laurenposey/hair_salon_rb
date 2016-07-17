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

get("/stylists/new") do
  erb(:stylist_form)
end

post("/stylists") do
  name = params.fetch("name")
  @stylist = Stylist.new({:name => name, :id => nil})
  @stylist.save()
  erb(:stylist_success)
end

get("/stylists/:id") do
  @stylist = Styist.find(params.fetch("id").to_i())
  erb(:stylist)
end

post("/clients") do
  name = params.fetch("name")
  stylist_id = params.fetch("stylist_id").to_i()
  @stylist = Stylist.find(stylist_id)
  @client = Client.new({:name => name, :stylist_id => stylist_id})
  @client.save()
  erb(:client_success)
end
