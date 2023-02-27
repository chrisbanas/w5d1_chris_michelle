class MaxIntSet
  attr_reader :store

  def initialize(max)
    @max = max
    @store = Array.new(max)
  end

  def insert(num)
    if num >= 0 && num < @max && !self.include?(num)
      @store[num] = true
    elsif num >= 0 && num <= @max && self.include?(num)
      false
    else
      raise "Out of bounds"
    end
  end

  def remove(num)
    @store.delete_at(num)
  end

  def include?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end

class IntSet

  attr_reader :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    @store.delete_at(num)
  end

  def include?(num)
    self[num].include?(num) # this is because we are returning an array and we need to then search inside of it.
  end

  private

  def [](num)
    @store[num % self.num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !@store.include?(num)
      self[num] << num
      @count += 1
    end

  end

  def remove(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  # def count
  #   # @count += 1
  # end

  private

  def num_buckets
    @store.length
  end

  def resize!
    copy = @store.dup

    @store = Array.new(num_buckets * 2)
    copy.each_with_index do |prev_ele , i|
      @store[prev_ele] = prev_ele
    end

  end

  def [](num)
    @store[num % (num_buckets + count)]
  end
end
