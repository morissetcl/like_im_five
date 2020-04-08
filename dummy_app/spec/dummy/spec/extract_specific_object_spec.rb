require 'active_record'
require_relative 'spec_helper'
require_relative '../../../../lib/extractor/extract_specific_object'

describe ExtractSpecificObject do
  context 'for an object without association' do
    before do
      DummyApp::User.create(name: "jean-0", age: 23, city: "paris-0")
    end
    context 'with an existing data' do
      it do
        expect(ExtractAssociatedObject).to receive_message_chain(:new, :call)
                                       .with([{"age"=>"2", "city"=>"paris-2", "id"=>3, "name"=>"jean-2"}])
                                       .with(no_args)
        ExtractSpecificObject.call(id: 1, table: "dummy_app_users")
      end
    end

    context 'with an inexisting data' do
      it 'table not found' do
        expect do
          ExtractSpecificObject.call(id: 2, table: "users")
        end.to output("Table users does not exist in your DB").to_stdout
      end

      it 'id not found' do
        expect do
          ExtractSpecificObject.call(id: 80000, table: "dummy_app_users")
        end.to output("Can't find id=80000 in table=dummy_app_users").to_stdout
      end
    end
  end
end
