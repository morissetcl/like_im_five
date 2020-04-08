require "like_im_five/version"
require "extractor/extract_specific_object"

module LikeImFive
  class Error < StandardError; end
  def self.call(arg)
    ExtractSpecificObject.call(id: arg[0], table: arg[1])
  end
end
