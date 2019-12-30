require 'active_record'
require_relative 'spec_helper'
require_relative '../../../../lib/extract_specific_object'

describe ExtractSpecificObject do
  users =  DummyApp::User.all
  articles =  DummyApp::Article.all

  context 'for an object without association' do
    context 'with an existing data' do
      it do
        object = ExtractSpecificObject.call(id: 3, model: "dummy_app_users")
        expect(object).to eq [{"age"=>"2", "city"=>"paris-2", "id"=>3, "name"=>"jean-2"}]
      end
    end

    context 'with an inexisting data' do
      it 'table not found' do
        expect do
          ExtractSpecificObject.call(id: 2, model: "users")
        end.to output("Table users does not exist in your DB").to_stdout
      end

      it 'id not found' do
        expect do
          ExtractSpecificObject.call(id: 8, model: "dummy_app_users")
        end.to output("Can't find id=8 in table=dummy_app_users").to_stdout
      end
    end
  end
end