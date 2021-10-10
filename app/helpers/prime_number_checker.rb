require 'prime'

class PrimeNumberChecker
  def init(numbers)
    @numbers = numbers
  end

  def last_prime?
    Prime.prime?(@numbers.last)
  end

  def first_prime?
    Prime.prime?(@number.first)
  end

  def all_prime?
    @numbers.all? { |num| Prime.prime?(num)}
  end

  def no_prime?
    !@numbers.any? { |num| Prime.prime?(num) }
  end
end