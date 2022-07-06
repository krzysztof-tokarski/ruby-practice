def bubble_sort(numbers_array)
  unsorted = true;

  while unsorted do
    required_sorting = false;
    (numbers_array.length-1).times do |index|
      num1 = numbers_array[index]
      num2 = numbers_array[index+1]
      if num1 > num2
        numbers_array[index+1] = num1
        numbers_array[index] = num2
        required_sorting = true
      end
    end
    unless required_sorting
      unsorted = false
    end
  end
  p numbers_array
  
end
