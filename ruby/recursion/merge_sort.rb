def merge_sort(array)
  return array if array.size == 1
  half  = array.size / 2
  left  = array[0...half]
  right = array[half..-1]
  merge(left, right)
end

def merge(left, right)
  i, j = 0, 0
  merged = []

  while i < left.size && j < right.size
    if left[i] < right[j]
      merged << left[i]
      i += 1
    else
      merged << right[j]
      j += 1
    end
  end

  if i == left.size + 1
    right[j..-1].each { |k| merged << k }
  else
    left[i..-1].each { |k| merged << k }
  end

  merged
end