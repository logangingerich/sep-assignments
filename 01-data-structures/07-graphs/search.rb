require_relative 'node'

$films = []
def find_kevin_bacon(actor)
  actor.film_actor_hash.each do |title, actors|
    actors.each do |actor|
      if actor.name != 'Kevin Bacon'
        $films.push(title)
        find_kevin_bacon(actor)
      else
        $films.push(title)
        if $films.length <= 6
          puts "Degrees of Kevin Bacon: #{$films.length}"
          $films.each do |film|
            puts "Connected by: #{film}"
          end
        else
          puts "More than six degrees of Kevin Bacon"
        end
      end
    end
  end
end

kevin = Node.new("Kevin Bacon")
person1 = Node.new("Person 1")
person2 = Node.new("Person 2")
person3 = Node.new("Person 3")
person4 = Node.new("Person 4")
person5 = Node.new("Person 5")
person6 = Node.new("Person 6")
person7 = Node.new("Person 7")
person8 = Node.new("Person 8")
person9 = Node.new("Person 9")
person10 = Node.new("Person 10")

kevin.film_actor_hash["Movie 1"] = [ person1, person2, person3]
person1.film_actor_hash["Movie 2"] = [person2, person4, person5]
person2.film_actor_hash["Movie 3"] = [kevin, person6, person7]
person3.film_actor_hash["Movie 4"] = [person6, person2, person7]
person4.film_actor_hash["Movie 5"] = [kevin, person3, person10]

find_kevin_bacon(person1)
