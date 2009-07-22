module ActiveRecord
  module Validations
    module ClassMethods
      def validates_as_cpf *attr_names
        configuration = { :message => :invalid_cpf }
        configuration.update(attr_names.extract_options!)

        validates_each(attr_names, configuration) do |record, attr_name, value|
          unless CPF::valid? value
            record.errors.add attr_name, configuration[:message]
          end
        end
      end
    end
  end
end
