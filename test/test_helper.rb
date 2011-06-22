require 'rubygems'
require 'test/unit'
require 'active_model'
require 'cpf_validator'
require 'ostruct'

class Person < OpenStruct
  include ActiveModel::Validations
  validates :cpf, :cpf => true
end
