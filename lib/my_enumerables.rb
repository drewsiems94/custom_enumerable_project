module Enumerable
  # Your code goes here
  def my_each_with_index
    i = 0
    while i < self.length
      yield(self[i], i)
      i += 1
    end
    self
  end

  def my_select
    new_arr = []
    i = 0
    while i < self.length
      new_arr.push(self[i]) if yield(self[i]) == true
      i += 1
    end
    new_arr
  end

  def my_all?
    self.my_each do |element|
      return false if yield(element) == false
    end
    true
  end

  def my_any?
    self.my_each do |element|
      return true if yield(element) == true
    end
    false
  end

  def my_none?
    self.my_each do |element|
      return false if yield(element) == true
    end
    true
  end

  def my_count
    if !block_given?
      return self.length
    end
    count = 0
    self.my_each do |element|
      count += 1 if yield(element) == true
    end
    count
  end

  def my_map
    new_arr = []
    self.each do |element|
      new_arr << yield(element)
    end
    new_arr
  end

  def my_inject(acc = self[0])
    self.my_each do |element|
      acc = yield(acc, element)
    end
    acc
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  # In the code below, my_each is an instance method. 
  # It belongs to the object we create via Array.new. 
  # So self points to that object.
  def my_each
    i = 0
    while i < self.length
      yield self[i]
      i += 1
    end
    self
  end
end
