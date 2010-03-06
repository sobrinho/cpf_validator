require 'test_helper'

class ValidatesAsCpfTest < ActiveSupport::TestCase
  class Person < ActiveRecord::Base
    validates :document, :cpf => true
  end
  
  test "blank values" do
    ['', false, nil].each do |cpf|
      assert Person.new(:document => cpf).invalid?
    end
  end
  
  test "black list" do
    CPF::BLACK_LIST.each do |cpf|
      assert Person.new(:document => cpf).invalid?
    end
  end
  
  test "only digits" do
    assert Person.new(:document => '18349376473').valid?
  end
  
  test "with mask" do
    assert Person.new(:document => '183.493.764-73').valid?
  end
  
  test "integer value" do
    assert Person.new(:document => 18349376473).valid?
  end
  
  test "integer value missing 0" do
    assert Person.new(:document => 3467622607).valid?
  end
end
