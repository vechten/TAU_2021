class StringChanger
  def initialize(string)
    @string = string
  end

  def to_arr
    [@string]
  end

  def string_boolean?
    return false if @string.lowercase == 'false' || @string.empty?
    true
  end

  def string_take_number
    @string.split.select { |x| x == '0' || x.to_i > 0 }.join
  end
end
