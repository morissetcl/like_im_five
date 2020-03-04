module DummyApp
  class Commercial < ApplicationRecord
    belongs_to :dummu_app_agence, class_name: 'DummyApp::Agence'
    self.table_name = 'dummy_app_commerciaux'
  end
end
