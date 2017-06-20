class City
  attr_accessor :name
  attr_accessor :neighbors
  attr_accessor :visited

  def initialize(name)
    self.name = name
    self.neighbors = []
    self.visited = false
  end
end

def nearest_neighbor(current_city, answer_array=[])
  while current_city.visited == false
    #Set neighboring cities array and set next_city as first in the array
    neighbor_cities = current_city.neighbors
    next_city = neighbor_cities[0]

    for current_neighbor in neighbor_cities
      #Making sure you don't prematurely close the loop by setting next_city
      #to an already visited city later on
      if next_city[:city].visited == true
        next_city = current_neighbor
      end
      unless current_neighbor[:city].visited == true
        #If the current_neighbor is closer than next_city, reset current_neighbor
        #to current_city
        if current_neighbor[:distance] < next_city[:distance]
          current_neighbor = current_city
        end
      end
    end
    answer_array.push(current_city.name)
    current_city.visited = true
    #reset while loop with next_city
    current_city = next_city[:city]
  end
  #Add starting city to end of array to close out loop
  answer_array.push(answer_array[0])
  p answer_array
end

chicago = City.new("Chicago")
seattle = City.new("Seattle")
los_angeles = City.new("Los Angeles")
ft_lauderdale = City.new("Ft. Lauderdale")
new_york = City.new("New York")

chicago.neighbors = [{city: seattle, distance: 2064}, {city: los_angeles, distance: 2015}, {city: ft_lauderdale, distance: 1356}, {city: new_york, distance: 1266}]
seattle.neighbors = [{city: chicago, distance: 2064}, {city: los_angeles, distance: 1137}, {city: ft_lauderdale, distance: 3274}, {city: new_york, distance: 2852}]
los_angeles.neighbors = [{city: chicago, distance: 2015}, {city: seattle, distance: 1137}, {city: ft_lauderdale, distance: 2711}, {city: new_york, distance: 2777}]
ft_lauderdale.neighbors = [{city: chicago, distance: 1356}, {city: seattle, distance: 3274}, {city: los_angeles, distance: 2711}, {city: new_york, distance: 1256}]
new_york.neighbors = [{city: chicago, distance: 1266}, {city: seattle, distance: 2852}, {city: los_angeles, distance: 2777}, {city: ft_lauderdale, distance: 1256}]

nearest_neighbor(chicago)
