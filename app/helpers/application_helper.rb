module ApplicationHelper
  def flash_messages
    if flash[:notice]
      content_tag :div, (flash[:notice]).html_safe, :class => "alert alert-success"
    elsif flash[:alert]
      content_tag :div, (flash[:alert]).html_safe, :class => "alert alert-danger"
    end
  end

  def page_nav_colour_swap_background
    content_tag :div, :class => 'page_nav_colour_swap_container' do
      content_tag :div, '', :class => 'page_nav_colour_swap'
    end
  end

  def ie_compatibility
    raw <<-EOV
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    EOV
  end
end
