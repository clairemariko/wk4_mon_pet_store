require('pg')

 class Pet

  attr_reader :name, :animal_type, :image, :store_id, :id

  def initialize(options)
    @name = options["name"]
    @animal_type=options["animal_type"]
    @image=options["image"]
    @id = options["id"] or nil
  end

  def store()
    sql = "SELECT * FROM stores WHERE id = #{@store_id}"
    result = Pet.run_sql(sql)
    Store.new(result[0])
  end

  def save()
    sql = "INSERT INTO stores(
            name,
            animal_type,
            image,
            store_id
            )VALUES (
            '#{ @name }',
            '#{ @animal_type }',
            '#{ @image }',
            '#{ @store_id}'
            )"
            Pet.run_sql(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM pets WHERE id = #{id.to_i}"
    result = Pet.run_sql(sql)
    return Pet.new(result [0])
  end

  def update()
    sql = "UPDATE pets SET name= '#{@name}', store_id = #{@store_id} WHERE id = #{@id}"
    return Pet.run_sql(sql)
  end

  private

  def self.run_sql
    begin
      db =  PG.connect( { dbname: 'pet_stores', host: 'localhost' } )
      result = db.exec(sql)
    ensure
      db.close
    end
    return result
  end





end