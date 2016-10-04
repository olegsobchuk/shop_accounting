class Thing < ApplicationRecord
  validates :name, :description, :price, :weight, presence: true
    validates :uid, uniqueness: true, presence: true

  belongs_to :delivery
  belongs_to :shop

  scope :by_create, -> { order(:created_at) }
  scope :existing, -> { where(sold_date: nil) }
  scope :sold_in, -> (from_date, to_date) { where(sold_date: [from_date.to_date.beginning_of_day..to_date.to_date.end_of_day]) }

  def sold!
    update(sold_date: DateTime.current)
  end

  def upload_image(image)
    image_id = FlickrService.upload(image)
    if image_id
      self.image_id = image_id
      info = FlickrService.get_info(image_id)
      self.image_url = FlickRaw.url_b(info)
      self.image_thumb = FlickRaw.url_t(info)
      self.save
    end
  end
end
