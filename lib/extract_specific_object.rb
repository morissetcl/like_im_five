require 'rails'

class ExtractSpecificObject
  class << self
    def call(id:, model:)
      model = model.singularize.classify.constantize
      result = model.where(id: id).first
      return "can't find #{model} with id=#{id}" if result.blank?

      result
    end
  end
end
