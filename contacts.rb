## contacts.rb
require 'active_record'
require_relative 'setup'
require_relative 'contact'
#require 'pg'
require 'pry'
require 'pry-nav'
 
## AR: Insert new & save
Contact.create(firstname: "Mike", lastname: "Bob", email: "aa@gmail.com")
puts "contact.id = #{contact.id}"

## AR: Update by ID
#Contact.find(31).update(firstname: "F-test", lastname: "L-test", email: "e@etest.com")


## AR: find all by lastname
# c = Contact.where(lastname: 'L-test')
# c.each do |item|
#   puts item.id
# end

## AR: find all by firstname
# c = Contact.where(firstname: 'F-test')
# c.each do |item|
#   puts item.id
# end

## AR: find all by email
# c = Contact.where(email: 'e@etest.com')
# c.each do |item|
#   puts item.id
#   puts item.firstname
#   puts item.lastname
# end

## AR: Delete an entry
# Contact.destroy(29)