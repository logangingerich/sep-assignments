def binary_search_recursive(collection, value)
  low = 0
  high = collection.length - 1
  mid = (low + high) / 2
  if low > high
    return "Sorry, value not found"
  end
  if collection[mid] == value
    return collection[mid]
  elsif collection[mid] < value
    binary_search_recursive(collection[(mid+1)..high], value)
  else
    binary_search_recursive(collection[low..mid], value)
  end
end

# Simple test
arr = [1, 2, 3, 4, 5, 6]

puts binary_search_recursive(arr, 3)
puts binary_search_recursive(arr, 7)
