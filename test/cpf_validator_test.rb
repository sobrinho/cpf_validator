require 'test_helper'

class CpfValidatorTest < Test::Unit::TestCase
  def test_black_list
    %w(12345678909 00000000000 11111111111 22222222222
       33333333333 44444444444 55555555555 66666666666
       77777777777 88888888888 99999999999).each do |number|
      assert_invalid number
    end
  end

  def test_invalid
    assert_invalid '617.274.462-52'
    assert_invalid '235.462.542-34'
    assert_invalid '234.624.576-57'
  end

  def test_masked
    assert_valid '262.249.648-66'
    assert_valid '124.713.257-93'
    assert_valid '691.844.380-10'
  end

  def test_unmasked
    assert_valid '26224964866'
    assert_valid '12471325793'
    assert_valid '69184438010'
  end

  protected

  def assert_valid(cpf)
    assert person(:cpf => cpf).valid?
  end

  def assert_invalid(cpf)
    assert person(:cpf => cpf).invalid?
  end

  def person(attributes = {})
    Person.new(attributes)
  end
end
