module ContentsHelper
  def content_lists(contents)
    html = ''
    contents.each do |content|
      html += render(partial: 'content', locals: { content: content })
    end
    raw(html)
  end
end
