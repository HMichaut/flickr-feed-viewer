class StaticPagesController < ApplicationController
  def viewer
    if static_pages_params.present?
      flickr = Flickr.new
      photo_id_array = flickr.people.getPhotos(user_id: static_pages_params[:id]).map { |item| item.id }
      info = photo_id_array.map { |id| flickr.photos.getInfo(:photo_id => id) }
      @list = info.map { |item| Flickr.url_b(item) }
    end
  end

  private

  def static_pages_params
    params.permit(:id, :commit)
  end
end
