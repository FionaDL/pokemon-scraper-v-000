require 'pry'

class Pokemon

  attr_accessor :id, :name, :type, :db

  @@all = []

  def initialize(id:, name:, type:, hp: 60, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, hp, db)
    db.execute("INSERT INTO pokemon(name, type, hp) VALUES (?,?,?)", name, type, hp)
  end

  def self.find(id_number, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id_number).flatten
    Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], hp: pokemon[3], db: db)
  end
end
