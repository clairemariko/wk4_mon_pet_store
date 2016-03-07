require('pg')
require('pry-byebug')

class Store

  attr_reader :name, :address, :stock_type, :id

  def initialize(options)
    @name=options["name"]
    @address=options["address"]
    @stock_type=option["stock_type"]
    @id = options["id"] or nil

  end

  def pets()
    sql = "SELECT * FROM pets WHERE store_id=#{@id} ORDER BY name"
    pets = Store.run_sql(sql)
    result = pets.map{ |pet| Pet.new(pet) }
  end

  def self.all()
    sql = "SELECT * FROM stores ORDER BY name"
    stores = Store.run_sql(sql)
    result = stores.map { |store| Store.new(store) }
  end

  def save()
      sql = "INSERT INTO stores ( 
        name, 
        address,
        stock_type) 
        VALUES (
        '#{ @name }',
        '#{ @address }',
        '#{ @stock_type}'
        )"
      return Store.run_sql( sql )
    end

    def self.find(id)
     sql = "SELECT * FROM stores WHERE id = #{id.to_i}"
     result = Store.run_sql( sql )
     store = Store.new( result[0] )
    end

    def update()
      sql = "UPDATE stores SET name='#{@name}', address='#{@adress}' WHERE id=#{@id}"
      return Store.run_sql(sql)
    end



  private 

    def self.run_sql(sql)
      begin
        db =  PG.connect( { dbname: 'pet_stores', host: 'localhost' } )
        result = db.exec(sql)
      ensure
        db.close
      end
      return result
    end



end