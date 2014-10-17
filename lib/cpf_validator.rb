class CpfValidator < ActiveModel::EachValidator
  autoload :Cpf, 'cpf_validator/cpf'

  def validate_each(record, attribute, value)
    message = options[:message].presence || :invalid
    record.errors.add(attribute, message) unless Cpf.valid?(value)
  end
end
