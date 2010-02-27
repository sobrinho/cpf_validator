class CpfValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, options[:message]) if CPF.invalid?(value)
  end
end
