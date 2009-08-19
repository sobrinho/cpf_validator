module CPF
  # Invalids
  INVALIDS = %w(12345678909 11111111111 22222222222 33333333333 44444444444
    55555555555 66666666666 77777777777 88888888888 99999999999 00000000000)

  def self.valid? cpf
    # Do not validate if blank
    return true if cpf.blank?
    
    # Parse CPF
    if cpf.kind_of? Numeric
      base10 = cpf.to_s(10)

      if base10.length == 11
        cpf = base10
      else
        cpf = '0' + cpf.to_s(8) # Octal
      end
    else
      cpf = cpf.to_s
    end

    # Basic validation
    if cpf !~ /^\d{11}|\d{3}\.\d{3}\.\d{3}-\d{2}$/
      return false
    end

    cpf = cpf.scan(/\d/).collect(&:to_i)

    if INVALIDS.member? cpf.to_s
      return false
    end

    # Parse first digit
    sum = (0..8).inject(0) do |sum, i|
      sum + (cpf[i] * (10 - i))
    end

    result = sum % 11
    result = result < 2 ? 0 : 11 - result

    return false unless result == cpf[9]

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
