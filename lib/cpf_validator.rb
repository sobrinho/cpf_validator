class CpfValidator < ActiveModel::EachValidator
  autoload :Cpf, 'cpf_validator/cpf'

  def validate_each(record, attribute, value)
    record.errors.add(attribute, options[:message]) unless Cpf.valid?(value)
  end
end
