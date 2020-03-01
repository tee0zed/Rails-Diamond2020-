class Makaronees
  def initialize(type)
    @type = type
  end

  def serve
    @type
  end
end

class Meatball
  def initialize(meatballs)
    @meatballs = meatballs
  end

  def serve
    @meatballs
  end
end

class Plate
  def make_dish(meatballs, makaronees)
    "mmmmm that #{makaronees} with #{meatballs}"
  end
end

tomato_sauce_meatballs = Meatball.new("Five delicious meatballs")

pasta = Makaronees.new("Hot pasta")

dish = Plate.new

puts dish.make_dish(tomato_sauce_meatballs.serve, pasta.serve)
