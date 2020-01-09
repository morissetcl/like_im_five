class AddWebsiteIdToArticles < ActiveRecord::Migration[5.2]
  def change
    add_reference :dummy_app_articles, :website, index: true
  end
end
