def binary_search_iterative(collection, value)
  low = 0
  high = collection.length - 1
  while low <= high
    mid = (low + high) / 2
    if collection[mid] > value
      high = mid - 1
    elsif collection[mid] < value
      low = mid + 1
    else
      return collection[mid]
    end
  end
  return "Sorry, value not found."
end

# Simple test
arr = [1, 2, 3, 4, 5, 6]

puts binary_search_iterative(arr, 4)
puts binary_search_iterative(arr, 7)
