require 'prime'

class PrimeNumberChecker
  def initialize(numbers)
    @numbers = numbers
  end

  def difficult_string
    @numbers = @numbers.map { |x| Mathematical.new.render(x) }
  end

  def last_prime?
    return nil unless @numbers.present?
    Prime.prime?(@numbers&.last)
  end

  def first_prime?
    return nil unless @numbers.present?
    Prime.prime?(@numbers&.first)
  end

  def all_prime?
    @numbers.all? { |num| Prime.prime?(num) }
  end

  def no_prime?
    !@numbers.any? { |num| Prime.prime?(num) }
  end

  def prime_filter
    @numbers.select { |num| Prime.prime?(num) }
  end
end