require_relative 'insertion_sort'

def bucket_sort(array, bucket_size = 5)
  if array.empty?
    return
  end

  # Determine minimum and maximum values
  min_value = array.min
  max_value = array.max

  # Initialise buckets
  bucket_count = ((max_value - min_value) / bucket_size).floor + 1
  buckets = Array.new(bucket_count)
  (0..buckets.length - 1).each do |i|
    buckets[i] = []
  end

  # Distribute input array values into buckets
  (0..array.length - 1).each do |i|
    buckets[((array[i] - min_value) / bucket_size).floor].push(array[i])
  end

  # Sort buckets and place back into input array
  array = []
  (0..buckets.length - 1).each do |i|
    buckets[i] = insertion_sort(buckets[i])
    buckets[i].each do |value|
      array.push(value)
    end
  end
  array
end
