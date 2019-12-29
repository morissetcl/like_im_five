require 'active_record'
require_relative 'spec_helper'
require_relative '../../../../lib/extract_associated_object'

describe ExtractAssociatedObject do
  articles =  DummyApp::Article.all

  context 'for an object with a simple association' do
    context 'with an existing data' do
      it do
        associated_user = articles.first.dummy_app_user
        object = ExtractAssociatedObject.new(articles.first).call
        expect(object).to eq [associated_user]
      end
    end
  end
end
