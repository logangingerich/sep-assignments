def poorly_written_ruby(*arrays)
  arrays.flatten!
  return arrays if arrays.length <= 1

  pivot_index = (arrays.length / 2).to_i
  pivot_value = arrays[pivot_index]
  arrays.delete_at(pivot_index)

  lesser = Array.new
  greater = Array.new

  arrays.each do |item|
    if item <= pivot_value
      lesser << item
    else
      greater << item
    end
  end
  return poorly_written_ruby(lesser) + [pivot_value] + poorly_written_ruby(greater)
 end

 p poorly_written_ruby([9,8,7],[6,5,4],[3,2,1])
