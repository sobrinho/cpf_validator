module ActiveRecord
  module Validations
    module ClassMethods
      def validates_as_cpf *attr_names
        configuration = { :allow_blank => true, :message => :invalid_cpf }
        configuration.update(attr_names.extract_options!)

        validates_each(attr_names, configuration) do |record, attr_name, value|
          record.errors.add(attr_name, configuration[:message]) unless CPF.valid? value
        end
      end
    end
  end
end

