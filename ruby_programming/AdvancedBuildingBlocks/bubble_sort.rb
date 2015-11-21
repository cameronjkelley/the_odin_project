def bubble_sort(arr)
	i = 0
	while i < arr.size
		arr.each_with_index do |x, y|
			z = y + 1
			if x > arr[z].to_i && arr[z] != nil
				arr.insert(y, arr.slice!(z))
			end
		end
		i += 1
	end
	p arr
end

bubble_sort([9, 4, 1, 6, 2, 8, 3, 5, 7])
