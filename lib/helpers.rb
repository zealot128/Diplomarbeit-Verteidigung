
module PresentationHelper
  def image_tag_with_caption(img_path, caption)
    "<div class='image-wrap'><img src='#{img_path}'/><div class='caption'>#{caption}</div>"
  end
end
