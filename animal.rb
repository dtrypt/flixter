class Animal
  def eat
    puts "om nom nom"
  end
end

class Dog < Animal
  def bark
    puts "woof"
  end
end

class Cat < Animal
  def meow
    puts "meow"
  end
end

class Duck < Animal
  def quack
    puts "quack!"
  end
end

class GR < Dog
  def fetch
    puts "retrieving stick"
  end
end

class Poodle < Dog
  def yap
    puts "yap yap"
  end
end

animal = Animal.new
dog    = Dog.new
cat    = Cat.new
duck   = Duck.new
gr     = GR.new
p     = Poodle.new
p.yap

puts animal.is_a?(Animal)