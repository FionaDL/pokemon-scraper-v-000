require 'pry'

class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?,?)", name, type)
  end

  def self.find(id_number, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id_number).flatten
    Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db)
  end

  def alter_hp(new_hp, name, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE name = ?", new_hp, name)
  end
end
