module Enumerable
    def my_each
        yield
    end
end

puts "my_each vs each"
numbers = [1, 2, 3, 4, 5]
numbers.each { |item| puts item }
numbers.my_each { |item| puts item }