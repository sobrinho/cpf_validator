require File.dirname(__FILE__) + '/spec_helper'

describe CPF do
  it 'should not validate blank values' do
    CPF.valid?('').should be_false
  end

  it 'should not validate common invalid CPFs' do
    CPF::BLACK_LIST.each do |cpf|
      CPF.valid?(cpf).should be_false
    end
  end

  it 'should validate CPF with or without mask' do
    CPF.valid?(string_with_mask).should be_true
    CPF.valid?(string_without_mask).should be_true
  end

  it 'should validate CPF as integer' do
    CPF.valid?(as_integer).should be_true
  end

  # Get a valid CPF as string with mask
  def string_with_mask
    '032.235.614-80'
  end

  # Get a valid CPF as string without mask
  def string_without_mask
    string_with_mask.gsub(/[^\d]/, '')
  end

  # Get a valid CPF as integer
  def as_integer
    string_without_mask.to_i
  end
end

