module ApplicationHelper
  def flash_messages
    if flash[:notice]
      content_tag :div, (flash[:notice]).html_safe, :class => "alert alert-success"
    elsif flash[:alert]
      content_tag :div, (flash[:alert]).html_safe, :class => "alert alert-danger"
    end
  end
end
