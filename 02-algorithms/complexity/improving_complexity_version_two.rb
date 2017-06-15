def poorly_written_ruby(*arrays)
  arrays.flatten!

  if arrays.length <= 1
    arrays
  else
    mid = (arrays.length / 2).floor
    left =poorly_written_ruby(arrays[0..mid - 1])
    right = poorly_written_ruby(arrays[mid..arrays.length])
    merge(left, right)
  end
end

def merge(left, right)
  if left.empty?
    right
  elsif right.empty?
    left
  elsif left.first < right.first
    [left.first] + merge(left[1..left.length], right)
  else
    [right.first] + merge(left, right[1..right.length])
  end
 end

 p poorly_written_ruby([9,8,7],[6,5,4],[3,2,1])
