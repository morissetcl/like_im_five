require 'active_record'
require_relative 'spec_helper'
require_relative '../../../../lib/extractor/extract_associated_object'

describe ExtractAssociatedObject do
  before do
    DummyApp::Article.create(title: "title-2", dummy_app_user_id: 1, body: "body-2", dummy_app_category_id: 1, website_id: 1)
    DummyApp::Category.create(label: "label", dummy_app_topic_id: 1)
    DummyApp::Topic.create(title: "Topic", description: 'Topic is beautiful')
    DummyApp::User.create(name: "jean-0", age: 23, city: "paris-0")
    DummyApp::Website.create(url: "https://url.com")
    DummyApp::Commercial.create(name: "James", dummy_app_agence_id: 1)
    DummyApp::Commercial.create(name: "Arnold", dummy_app_agence_id: 1)
    DummyApp::Agence.create(name: "Houston")
  end

  context 'for an object with a simple association' do
    context 'with an existing data' do
      it do
        expected_result = [{:table=>"dummy_app_categories", :attributes=>[{"id"=>1, "label"=>"label", "dummy_app_topic_id"=>1}]}, {:table=>"dummy_app_topics", :attributes=>[{"id"=>1, "title"=>"Topic", "description"=>"Topic is beautiful"}]}, {:table=>"dummy_app_users", :attributes=>[{"id"=>1, "name"=>"jean-0", "city"=>"paris-0", "age"=>"23"}]}, {:attributes=>[{"id"=>1, "url"=>"https://url.com"}], :table=>"dummy_app_websites"}]
        article = [{"body"=>"body-2", "dummy_app_category_id"=>1, "dummy_app_user_id"=>1, "id"=>3, "title"=>"title-2", "website_id" => "1"}]

        result = ExtractAssociatedObject.new(article).call
        expect(result).to eq expected_result
      end
    end

    context 'handle singularize table name' do
      it do
        agence = [{"dummy_app_agence_id"=>1}]

        result = ExtractAssociatedObject.new(agence).call
        expect(result).to eq [{:attributes=>[{"id"=>1, "name"=>"Houston"}], :table=>"dummy_app_agence"}]
      end
    end
  end
end
