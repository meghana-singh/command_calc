###################################################################################################
# Get the input from the command line (ARGV). Split it into array containing numbers and operators.
# Then follow the order of precedence to do the arithmetic. First compute multiplication and division,
# followed by addition and subtraction. Make sure to convert string to integer before computation.
###################################################################################################

input_calc_array = ARGV   # Input from the command line
input_stream_array = []   # Array of numbers and operators
result = 0                # Holds the result of the computation

input_calc_array.each { |val| input_stream_array += val.gsub(/(\s+)/, "").split(/(\W)/) }

# Follow the order of precedence for the calculations.
# Have a conditional while loop which depends upon the size of the array. The size of the array keeps reducing as 
# we continue to compute and replace the existing contents of the array.

while input_stream_array.length > 1 do
   # Find multiplication and division operators. Only when the mul and div operataions are complete, do the add and sub.
   if input_stream_array.include?("*") || input_stream_array.include?("/") 
      
      input_stream_array.each_with_index do |operator, index|
         if operator == "*" || operator == "/"
             if operator == "*"
               result = input_stream_array[index-1].to_i * input_stream_array[index+1].to_i
             else
               result = input_stream_array[index-1].to_i / input_stream_array[index+1].to_i
             end
             #delete the numbers that have got computed
             input_stream_array.delete_at(index-1)   
             input_stream_array.delete_at(index-1) 
             input_stream_array.delete_at(index-1) 
         
             #Insert the computed number 
             input_stream_array.insert(index-1, result) 
         end
      end
      
   elsif input_stream_array.include?("+") || input_stream_array.include?("-") 
      
      input_stream_array.each_with_index do |operator, index|
         if operator == "+" || operator == "-"
             if operator == "+"
               result = input_stream_array[index-1].to_i + input_stream_array[index+1].to_i
             else
               result = input_stream_array[index-1].to_i - input_stream_array[index+1].to_i
             end
             #delete the numbers that have got computed
             input_stream_array.delete_at(index-1)   
             input_stream_array.delete_at(index-1) 
             input_stream_array.delete_at(index-1) 
             
             #Insert the computed number 
             input_stream_array.insert(index-1, result) 
             
         end
      end
      
   else 
      puts "Computation complete: #{result}"
      break
   end
end

puts "Computation complete: #{result}"