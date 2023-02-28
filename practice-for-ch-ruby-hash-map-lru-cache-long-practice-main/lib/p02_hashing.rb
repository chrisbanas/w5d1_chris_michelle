class Integer
  # Integer#hash already implemented for you
  new = Hash.new { |h,k| h[k] = self.index }

  if self.is_a?(Integer)

  end

end

class Array
  def hash
  end
end

class String
  def hash
  endb
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
