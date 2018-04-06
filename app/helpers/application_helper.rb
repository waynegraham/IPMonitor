module ApplicationHelper
  def format_status_num(status)
    html = ""
    sorted_status = status.sort_by { |val| val[1].to_i }
    sorted_status.reverse.each do |s|
      html += status_class(s[0], number_with_delimiter(s[1]))
      html += " "
    end
    return html.html_safe
  end
end
