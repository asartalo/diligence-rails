module Standalone::DiligenceTextHelper
  def nbsp_fill(text)
    text.gsub(" ", "&nbsp;").html_safe
  end
end

