require "like_im_five/version"
require "extract_specific_object"

module LikeImFive
  class Error < StandardError; end
  def self.call(arg)
    ExtractSpecificObject.call(id: arg[0], model: arg[1])
  end
end
