module Enumerable
    def my_each
        if block_given?
            for k, v in self
                yield(k, v)
            end
        else
            self.to_enum
        end
    end
end

puts "my_each vs each"
numbers = [1, 2, 3, 4, 5]
hash_numbers = {a: 1, b: 2, c: 3, d: 4, e: 5}
numbers.each { |item| puts item }
numbers.my_each { |item| puts item }
hash_numbers.each { |k, v| puts "#{k}, #{v}" }
hash_numbers.my_each { |k, v| puts "#{k}, #{v}" }