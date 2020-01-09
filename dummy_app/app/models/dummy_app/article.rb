module DummyApp
  class Article < ApplicationRecord
    belongs_to :dummy_app_user, class_name: 'DummyApp::User', optional: true
    belongs_to :website, class_name: 'DummyApp::Website'
  end
end
