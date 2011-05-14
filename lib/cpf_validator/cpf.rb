class CpfValidator::Cpf
  def self.valid?(number)
    new(number).valid?
  end

  attr_reader :number

  def initialize(number)
    @number = number.to_s
  end

  def digits
    @digits ||= number.scan(/\d/).map(&:to_i)
  end

  def plain
    @plain ||= digits.join
  end

  def valid?
    formatted? && !black_listed? && digits_matches?
  end

  private

  def formatted?
    plain =~ /^\d{11}|\d{3}\.\d{3}\.\d{3}-\d{2}$/
  end

  def black_listed?
    plain =~ /^12345678909|(\d)\1{10}$/
  end

  def digits_matches?
    digit_matches?(9) && digit_matches?(10)
  end

  def digit_matches?(digit)
    sum = 0

    digit.times do |i|
      sum += digits[i] * (digit + 1 - i)
    end

    result = sum % 11
    result = result < 2 ? 0 : 11 - result

    result == digits[digit]
  end
end
