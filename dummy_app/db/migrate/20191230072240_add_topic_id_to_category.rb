class AddTopicIdToCategory < ActiveRecord::Migration[5.2]
  def change
    add_reference :dummy_app_categories, :dummy_app_topic, index: true
  end
end
