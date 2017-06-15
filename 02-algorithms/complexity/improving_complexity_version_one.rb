def poorly_written_ruby(*arrays)
  arrays.flatten!

  sorted_array = [arrays.delete_at(0)]

   for val in arrays
     i = 0
     while i < sorted_array.length
       if val <= sorted_array[i]
         sorted_array.insert(i, val)
         break
       elsif i == sorted_array.length - 1
         sorted_array << val
         break
       end
       i+=1
     end
   end

   sorted_array
 end

 p poorly_written_ruby([9,8,7],[6,5,4],[3,2,1])
