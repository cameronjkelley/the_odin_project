module Enumerable
	def my_each
		i = 0
		while i < self.size
			yield(self[i])
			i += 1
		end
		self
	end

	def my_each_with_index
		for i in (0...self.size)
			yield(self[i], i)
		end
		self
	end

	def my_select
		result = []
		self.my_each { |x| result.push(x) if yield(x) }
		result
	end

	def my_all?
		self.my_each { |x| return false unless yield(x) }
		true
	end

	def my_any?
		self.my_each { |x| return true if yield(x) }
		false
	end

	def my_none?
		self.my_each { |x| return false if yield(x) }
		true
	end

	def my_count
		count = 0
		self.my_each { |x| count += 1 if yield(x) }
		count
	end

	def my_map(proc = nil)
		arr = []
		if proc && block_given?
			self.my_each { |x| arr.push(proc.call(yield(x))) }
		elsif block_given?
			self.my_each { |x| arr.push(yield(x)) }
		else
			self.my_each { |x| arr.push(proc.call(x)) }
		end
		arr
	end

	def my_inject(default) 
		self.my_each { |x| default = yield(default, x) }
		default
	end

end

def multiply_els(arr)
	arr.my_inject(1) { |x, y| x * y }
end

p multiply_els([5, 4, 3, 2])
