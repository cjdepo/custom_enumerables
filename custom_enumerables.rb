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
    def my_map
        if block_given?
            new_array = []
            for v in self
                changed = yield v
                new_array << changed
            end
            new_array
        else
            self.to_enum
        end
    end
    def my_inject(proc=nil)
        if !proc && block_given?
            acc = self[0]
            i = 0
            for v in self
                acc = yield acc, v unless i == 0
                i += 1
            end
            acc
        elsif proc.class == Proc
            acc = self[0]
            i = 0
            for v in self
                acc = proc.call(acc, v) unless i == 0
                i += 1
            end
            acc
        else
            self.to_enum
        end
    end
end

def multiple_els(array)
    array.my_inject { |acc, v| acc * v }
end

numbers = [1, 2, 3, 4, 5]
hash_numbers = {a: 1, b: 2, c: 3, d: 4, e: 5}

puts numbers.my_inject(Proc.new { |acc, v| acc * v })
puts multiple_els(numbers)