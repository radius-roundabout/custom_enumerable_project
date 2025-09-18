module Enumerable
  # Your code goes here
  def my_each_with_index
    self.each_with_index do |element, index|
      yield(element, index)
    end
  end

  def my_select
    results = []
    self.each do |element|
      if yield(element)
        results.push(element)
      end
    end
    results
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    self.each do |elem|
      yield(elem)
    end
  end
end
