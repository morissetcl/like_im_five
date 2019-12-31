require 'active_record'
require_relative 'spec_helper'
require_relative '../../../../lib/create_factory'

describe CreateFactory do
  it do
    objects = [{:table=>"dummy_app_categories", :attributes=>[{"id"=>1, "label"=>"label", "dummy_app_topic_id"=>1}]}, {:table=>"dummy_app_topics", :attributes=>[{"id"=>1, "title"=>"Topic", "description"=>"Topic is beautiful"}]}, {:table=>"dummy_app_users", :attributes=>[{"id"=>1, "name"=>"jean-0", "city"=>"paris-0", "age"=>"0"}]}]

    CreateFactory.call(objects)
    file = File.read(Rails.root.join('../data.txt'))

    expect(file).to eq "let(:dummy_app_category) { create :dummy_app_category, id: 1, label: \"label\", dummy_app_topic_id: 1 }\n\nlet(:dummy_app_topic) { create :dummy_app_topic, id: 1, title: \"Topic\", description: \"Topic is beautiful\" }\n\nlet(:dummy_app_user) { create :dummy_app_user, id: 1, name: \"jean-0\", city: \"paris-0\", age: \"0\" }\n\n"
  end
end
