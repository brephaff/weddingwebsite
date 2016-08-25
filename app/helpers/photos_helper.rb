module PhotosHelper
  def link_to_accept_photo(photo, html_options = {})
    html_options = html_options.reverse_merge :remote => true, :method => :post
    link_to 'Accept', [:accept, :admin, photo], html_options
  end

  def link_to_accept_all_photos(html_options = {})
    html_options = html_options.reverse_merge :remote => true, :method => :post, :onclick => "$('[data-behaviour~=accept-photo]').click()"
    link_to 'Accept All', [:accept_all, :admin, Photo], html_options
  end

  def link_to_delete_photo(photo, html_options = {})
    html_options = html_options.reverse_merge :method => :delete, :remote => true, :data => {:confirm => 'Are you sure you want to delete this photo?'}
    link_to 'Delete', [:admin, photo], html_options
  end
end
