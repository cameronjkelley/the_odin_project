def bubble_sort(arr)
	i = 0
	while i < arr.length
		arr.each_with_index do |x, y|
			z = y + 1
			if x > arr[z].to_i && arr[z] != nil
				arr.insert(y, arr.slice!(z))
			end
		end
		i += 1
	end
	arr
end

def bubble_sort_by(arr)
	loop do 
		n = arr.length
		swapped = false

		(n-1).times do |i|
			if yield(arr[i], arr[i + 1]) > 0
				arr[i], arr[i + 1] = arr[i + 1], arr[i]
				swapped = true
			end		
		end
		break if !swapped
	end
	arr
end