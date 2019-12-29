require 'active_record'
require_relative 'spec_helper'
require_relative '../../../../lib/extract_specific_object'

describe ExtractSpecificObject do
  users =  DummyApp::User.all
  articles =  DummyApp::Article.all

  context 'for an object without association' do
    context 'with an existing data' do
      it do
        object = ExtractSpecificObject.call(id: 3, model: "DummyApp::User")
        expect(object).to eq users.last
      end
    end

    context 'with an inexisting data' do
      it do
        object = ExtractSpecificObject.call(id: 8, model: "DummyApp::User")
        expect(object).to eq "can't find DummyApp::User with id=8"
      end
    end
  end
end
