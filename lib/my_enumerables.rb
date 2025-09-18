module Enumerable
  # Your code goes here
  def my_each_with_index
    self.each_with_index do |element, index|
      yield(element, index)
    end
  end

  def my_select
    results = []
    self.my_each do |element|
      if yield(element)
        results.push(element)
      end
    end
    results
  end

  def my_all?
    self.my_each do |element|
      return false unless yield(element)
    end
    true 
  end

  def my_any?
    self.my_each do |element|
      return true if yield(element)
    end
    false 
  end

  def my_none?
    self.my_each do |element|
      return false if yield(element)
    end
    true
  end

  def my_count
    count = 0
    return self.length unless block_given?
    self.my_each do |element|
      count += 1 if yield(element)
    end
    count
  end

  def my_map(&block)
    results = []
    self.my_each do |element|
      result = block.call(element)
      results.push(result)
    end
    results
  end

  def my_inject(initial_value = 0)
    result = initial_value
    self.my_each do |element|
      if result == 0 
        result = element
        next 
      end
      result = yield(result, element)
    end
    result
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
    self
  end
end