require 'rails'

class CreateFactory
  class << self
    def call(objects)
      File.open(path(objects.first[:table]), "w+") do |f|
        objects.each do |object|
          f.puts(formatte_factory(object))
          f.puts("\n")
        end
      end
    end

    private

    def path(table)
      Rails.env.test? ? "./dummy_app/spec/data.txt" : "spec/#{table}.txt"
    end

    def formatte_factory(object)
      atttributes_symbolized = object[:attributes][0].inject({}){ |memo,(k,v)| memo[k.to_sym] = v; memo }
      formatted_attributes = atttributes_symbolized.to_s.delete(':').delete('{').delete('}').gsub("=>", ": ")
      factory_name = object[:table].singularize.to_sym
      "let(:#{factory_name}) { create :#{factory_name}, #{formatted_attributes} }"
    end
  end
end
