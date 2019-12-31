module DummyApp
  class Agence < ApplicationRecord
    self.table_name = 'dummy_app_agence'

    belongs_to :dummy_app_commercial, class_name: 'DummyApp::Commercial'
  end
end
