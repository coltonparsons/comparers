#!/usr/bin/env ruby

require 'json'

TEST_VECTORS = JSON.load($stdin)
n_wrong = 0

def is_equal(a, b)
  return a == b
end

TEST_VECTORS.each do |test_vector|
  a, b, expected = test_vector
  if is_equal(a, b) != expected
    puts("Failed #{test_vector}")
    n_wrong += 1
  end
end

if n_wrong == 0
    puts("All passed.")
else
    puts("Missed #{n_wrong} tests")
    exit(1)
end
