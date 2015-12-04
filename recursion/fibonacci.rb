# An iterative method that finds the nth member of the Fibonacci sequence
def fibs(n)
  sequence = []
  (0..n).each do |n|
    n < 2 ? sequence << n : sequence << sequence[-1] + sequence[-2]
  end
  sequence.last
end

# A recursive method that finds the nth member of the Fibonacci sequence
def fibs_rec(n)
  n < 2 ? n : fibs_rec(n-1) + fibs_rec(n - 2)
end