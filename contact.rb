# Add a new contact to the db
require 'pg'
require 'pry'
require 'pry-nav'

class Contact

attr_accessor :firstname, :lastname, :email, :id

  def initialize(firstname, lastname, email)
    @firstname = firstname
    @lastname = lastname
    @email = email
  end

  def set_connection
    puts "establishing connection ..."
    begin
      conn = PG.connect(
        dbname: 'd2igk2kn551t1h',
        port: 5432,
        user: 'vohambwcgejbmo',
        host: 'ec2-54-83-33-14.compute-1.amazonaws.com',
        password: 'vvD3NRNsRW_U2__8uERA8_EZP1'
      )
    rescue PG::ConnectionBad
      puts "Sorry there is something wrong with your credentials"
    end
    puts "Connected to database."
    conn
  end


  # def self.new_contact(conn, contact)
  #   @@db = conn
  #   #@connection = set_connection
  #   #insert = @conn.exec("SELECT * FROM authors WHERE authors.id = #{id};")
  #   puts "insert a row!"
  #   @@db.exec_params( "INSERT INTO contacts (firstname, lastname, email) VALUES ($1, $2, $3);", [contact.firstname, contact.lastname, contact.email] )
  # end

  def destroy(id)    
    connection = set_connection
    puts "delete a row!"
    connection.exec_params( "DELETE FROM contacts WHERE id = $1;", [id] )    
  end

  def save
    connection = set_connection
    if @id == nil # Insert the record if it has no 'id'
      puts "insert a row!"
      #puts connection
      connection.exec_params( "INSERT INTO contacts (firstname, lastname, email) VALUES ($1, $2, $3);", [@firstname, @lastname, @email] )
      result = connection.exec( "SELECT max(id) FROM contacts;")
      #@id = result.first ## The result of this is a Hash 'max'=>
      result.each do |column|
        @id = column["max"]
      end
      @id
    elsif # Update the record if the record already exists (it has an 'id')
      connection.exec_params( "UPDATE contacts SET firstname=$1, lastname=$2, email=$3 WHERE id=$4;", [@firstname, @lastname, @email, @id] )
    end
  end

  def self.find(id)
    # connection.set_connection
    connection = self.new('','','') # should I be faking it this way?
    conn = connection.set_connection
    #puts conn.inspect
    conn.exec_params( "SELECT * FROM contacts WHERE id = $1;", [id] )
    
  end

  def self.find_all_by_lastname(name)
    connection = self.new('','','')
    conn = connection.set_connection
    conn.exec_params( "SELECT * FROM contacts WHERE lastname = $1;", [name] )
  end

  def self.find_all_by_firstname(name)
    connection = self.new('','','')
    conn = connection.set_connection
    conn.exec_params( "SELECT * FROM contacts WHERE firstname = $1;", [name] )
  end

  def self.find_by_email(email)
    connection = self.new('','','')
    conn = connection.set_connection
    conn.exec_params( "SELECT * FROM contacts WHERE email = $1;", [email] )
  end

end