class Owner
  require "pry"
  @@all = []

  attr_accessor :owner
  attr_reader :species, :name

  def initialize(owner)
    @owner = owner
    @name = owner
    @species = "human"
     @@all << self
  end

  def say_species
    "I am a #{@species}."
  end
  
  def self.all
    @@all
  end

  def self.count
    self.all.size
  end

  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.select{|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select{|dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    walker = self
    Dog.all.each do |dog|
      if dog.owner == walker
        dog.mood="happy"
      end
    end
  end

  def feed_cats 
    feeder = self
    Cat.all.each do |cat|
      if cat.owner == feeder
        cat.mood="happy"
      end
    end
  end

  def sell_pets
    seller = self
    Cat.all.each do |cat|
      if cat.owner == seller
        cat.mood="nervous"
        cat.owner = nil
      end
    end
    Dog.all.each do |dog|
      if dog.owner == seller
        dog.mood="nervous"
        dog.owner = nil
      end
    end
  end

  def list_pets
    person = self
    dogs = 0
    cats = 0
    Dog.all.each do |dog| 
      if dog.owner==person
        dogs += 1
      end
    end
    Cat.all.each do |cat|
      if cat.owner==person
        cats += 1
      end
    end
    "I have #{dogs} dog(s), and #{cats} cat(s)."
  end


end