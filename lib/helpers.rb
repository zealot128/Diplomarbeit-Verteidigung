
module PresentationHelper
  def image_tag_with_caption(img_path, caption, klass="normal-image")
    "<div class='image-wrap #{klass}'><img src='#{img_path}'/><div class='caption'>#{caption}</div></div>"
  end

  def pygmentize(lexer,&block)
    text = capture_haml do
      yield
    end
    require "digest"
    filename = ".pygments-cache/" + Digest::MD5.hexdigest(text) + ".txt"
    if File.exists? filename
      puts "loading syntax hl from cache"
      return IO.read(filename)
    end

    pygmentize = IO.popen("pygmentize -f html -l #{lexer}", "w+")
    pygmentize.puts text
    pygmentize.close_write
    result = pygmentize.gets(nil)
    pygmentize.close

    FileUtils.mkdir_p(".pygments-cache")
    File.open(filename,"w+") {|f| f.write(result)}
    result
  end

  def image_tag(path)
    "<img src='imgs/#{path}'/>"
  end

end
