require 'active_record'
require_relative 'spec_helper'

describe 'co' do
  it 'with key word expect' do
    p ActiveRecord::Base.connection.tables
  end
end
