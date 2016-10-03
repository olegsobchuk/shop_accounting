class FlickrService
  class << self
    def photos
      @photos ||= flickr.photos
    end

    def upload(image_path)
      flickr.upload_photo(image_path)
    end

    def remove(image_id)
      photos.delete(photo_id: image_id)
    end

    def get_info(image_id)
      photos.getInfo(photo_id: image_id)
    end
  end
end
