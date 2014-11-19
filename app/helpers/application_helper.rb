module ApplicationHelper

  def markdown(content)
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, space_after_headers: true, fenced_code_blocks: true, strikethrough: true, underline: true, quote: true)
    @markdown.render(content)
  end

end
