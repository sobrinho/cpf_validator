module CPF
  # Black list
  BLACK_LIST = %w(12345678909 11111111111 22222222222 33333333333 44444444444
    55555555555 66666666666 77777777777 88888888888 99999999999 00000000000)

  def self.valid? cpf
    # Validate CPF
    cpf = cpf.to_s

    if cpf !~ /^\d{10,11}|\d{3}\.\d{3}\.\d{3}-\d{2}$/
      return false
    end

    cpf = cpf.scan(/\d/).collect(&:to_i)
    cpf.unshift(0) if cpf.length == 10

    # Black list filter
    if BLACK_LIST.member? cpf.to_s
      return false
    end

    # Parse first digit
    sum = (0..8).inject(0) do |sum, i|
      sum + (cpf[i] * (10 - i))
    end

    result = sum % 11
    result = result < 2 ? 0 : 11 - result

    unless result == cpf[9]
      return false
    end

    # Parse second digit
    sum = (0..8).inject(0) do |sum, i|
      sum + (cpf[i] * (11 - i))
    end

    sum += cpf[9] * 2

    result = sum % 11
    result = result < 2 ? 0 : 11 - result

    return result == cpf[10]
  end
end

