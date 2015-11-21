def bubble_sort_by(arr)
	i = 0
	while i < arr.size - 1 
		if yield(arr[i], arr[i + 1]) > 0
			arr[i], arr[i + 1] = arr[i + 1], arr[i]
		end
		i += 1
	end
		p arr.reverse!
end

bubble_sort_by(["hi", "hello", "hey"]) { |left, right| right.size - left.size }
