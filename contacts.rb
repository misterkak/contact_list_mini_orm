## contacts.rb
require 'pg'
require 'pry'
require 'pry-nav'
require './contact'

# Initiate a connection
# puts "establishing connection ..."
#     begin
#       conn = PG.connect(
#         dbname: 'd2igk2kn551t1h',
#         port: 5432,
#         user: 'vohambwcgejbmo',
#         host: 'ec2-54-83-33-14.compute-1.amazonaws.com',
#         password: 'vvD3NRNsRW_U2__8uERA8_EZP1'
#       )
#     rescue PG::ConnectionBad
#       puts "Sorry there is something wrong with your credentials"
#     end
#     puts "Connected to database."

#connect = Connection.new
#test.conn

## Insert new & save
contact = Contact.new("Michael", "Robert", "mr@gmail.com")
contact.save
puts "contact.id = #{contact.id}"

## Update
contact.firstname = "K"
contact.lastname = "V"
contact.save

## do I need a Contact.find???

## find by id
contacts = Contact.find(64)
#puts contacts.inspect
contacts.each do |c|
  puts c
end

## find all by lastname
contacts = Contact.find_all_by_lastname('Robert')
contacts.each do |c|
  puts c
end

## find all by firstname
contacts = Contact.find_all_by_firstname('Michael')
contacts.each do |c|
  puts c
end

## find all by email
contacts = Contact.find_by_email('mr@gmail.com')
contacts.each do |c|
  puts c
end

## Delete an entry
contact = Contact.new("Michael", "Robert", "mr@gmail.com")
contact.destroy(13)