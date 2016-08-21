module PhotosHelper
  def link_to_accept_photo(photo, html_options = {})
    html_options = html_options.reverse_merge :remote => true, :method => :patch
    link_to 'Accept', [:admin, photo, :photo => {:accepted => true}], html_options
  end

  def link_to_delete_photo(photo, html_options = {})
    html_options = html_options.reverse_merge :method => :delete, :remote => true, :data => {:confirm => 'Are you sure you want to delete this photo?'}
    link_to 'Delete', [:admin, photo], html_options
  end
end
