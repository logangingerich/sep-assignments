def quick_sort(collection)
  return collection if collection.length <= 1
  pivot_index = (collection.length / 2).to_i
  pivot_value = collection[pivot_index]
  collection.delete_at(pivot_index)

  lesser = Array.new
  greater = Array.new

  collection.each do |item|
    if item <= pivot_value
      lesser << item
    else
      greater << item
    end
  end
  return quick_sort(lesser) + [pivot_value] + quick_sort(greater)
end
