require "fastimage"

#
# Inspired by stackoverflow:
# https://stackoverflow.com/questions/53309750/jekyll-get-width-height-of-an-image-without-using-an-external-plugin/64452457#64452457
#
# Usage:
#
# <img src="{{source}}" width="{{source | image_size: 'w'}}" height="{{source | image_size: 'h'}}"/>
#
module ImageSizeFilter
  private def image_data(source)
    # Get the image dimensions, throw an error on failure
    # NOTE: You may want to sanitize the input string provided here
    # see: https://github.com/sdsykes/fastimage#security
    FastImage.new source, raise_on_failure: true
  end

  def image_width(source)
    return image_data(source).size[0]
  end

  def image_height(source)
    return image_data(source).size[1]
  end
end

Liquid::Template.register_filter(ImageSizeFilter)
