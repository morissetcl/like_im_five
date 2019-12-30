require 'active_record'
require_relative 'spec_helper'
require_relative '../../../../lib/extract_associated_object'

describe ExtractAssociatedObject do
  articles =  DummyApp::Article.all

  context 'for an object with a simple association' do
    context 'with an existing data' do
      it do
        expected_result = [{:attributes=>[{"id"=>1, "label"=>"label"}], :table=>"dummy_app_categories"},
         {:attributes=>[{"age"=>"0", "city"=>"paris-0", "id"=>1, "name"=>"jean-0"}], :table=>"dummy_app_users"}]
        article = [{"body"=>"bodu-2", "dummy_app_category_id"=>1, "dummy_app_user_id"=>1, "id"=>3, "title"=>"title-2"}]

        result = ExtractAssociatedObject.new(article).call
        expect(result).to eq expected_result
      end
    end
  end
end
