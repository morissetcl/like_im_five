require 'rails'

class ExtractAssociatedObject
  attr_reader :object, :model

  def initialize(object)
    @object = object
    @model = object.class.name.singularize.classify.constantize
  end

  def call
    associated_object = []
    foreign_keys_attributes.zip(associated_class).each() do |attribut, model|
      associated_object << model.find(object.attributes[attribut])
    end
    associated_object
  end

  private

  def foreign_keys_attributes
    model.reflect_on_all_associations.collect(&:name).map { |a| "#{a.to_s}_id" }
  end

  def associated_class
    class_associations_names = []
    model.reflect_on_all_associations.each do |a|
      class_associations_names << a.options[:class_name].singularize.classify.constantize
    end
    class_associations_names
  end
end
