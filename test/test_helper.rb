require 'rubygems'
require 'test/unit'
require 'active_model'
require 'cpf_validator'

class Document < Struct.new(:number)
  include ActiveModel::Validations
  validates :number, :cpf => true
end
