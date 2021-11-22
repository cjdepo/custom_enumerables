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
    def my_each_with_index
        if block_given?
            index = 0
            for v in self
                yield v, index
                index += 1
            end
        else
            self.to_enum
        end
    end
    def my_select
        if block_given?
            new_array = []
            for v in self
                match = yield v
                if match
                    new_array << v
                end
            end
            new_array
        else
            self.to_enum
        end
    end
    def my_any?
        if block_given?
            any = false
            for v in self
                match = yield v
                if match
                    any = true
                end
            end
            any
        else
            self.to_enum
        end
    end
    def my_none?
        if block_given?
            none = true
            for v in self
                match = yield v
                if match
                    none = false
                end
            end
            none
        else
            self.to_enum
        end
    end
    def my_count
        if block_given?
            counter = 0
            for v in self
                match = yield v 
                if match
                    counter += 1
                end
            end
            counter
        else
            self.to_enum
        end
    end
end

numbers = [1, 2, 3, 4, 5]
hash_numbers = {a: 1, b: 2, c: 3, d: 4, e: 5}


puts "my_any"
puts numbers.count { |n| n == 3 }
puts numbers.my_count { |n| n == 3 }
puts numbers.count { |n| n == 6 }
puts numbers.my_count { |n| n == 6 }