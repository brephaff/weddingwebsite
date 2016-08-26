module PhotosHelper
  def link_to_accept_photo(photo, html_options = {})
    html_options = html_options.reverse_merge :remote => true, :method => :post, 'data-behaviour' => 'accept-photo'
    link_to 'Accept', [:accept, :admin, photo], html_options
  end

  def link_to_accept_all_photos(html_options = {})
    link_to 'Accept All', 'javascript:', html_options.merge('data-behaviour' => 'accept-all-photos')
  end

  def link_to_delete_photo(photo, html_options = {})
    html_options = html_options.reverse_merge :method => :delete, :remote => true, :data => {:confirm => 'Are you sure you want to delete this photo?'}
    html_options.merge! 'data-behaviour' => 'delete-photo'
    link_to 'Delete', [:admin, photo], html_options
  end
end
