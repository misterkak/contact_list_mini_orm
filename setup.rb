require 'pry' # incase you want to use binding.pry
require 'active_record'

# Output messages from AR to STDOUT
ActiveRecord::Base.logger = Logger.new(STDOUT)

puts "Establishing connection to database ..."
ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  encoding: 'unicode',
  pool: 5,
  database: 'd2igk2kn551t1h',
  username: 'vohambwcgejbmo',
  password: 'vvD3NRNsRW_U2__8uERA8_EZP1',
  host: 'ec2-54-83-33-14.compute-1.amazonaws.com',
  port: 5432,
  min_messages: 'error'
)
puts "CONNECTED"