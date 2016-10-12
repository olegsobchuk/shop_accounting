class Thing < ApplicationRecord
  after_save :track_it

  validates :name, :description, :price, :weight, presence: true
  validates :uid, uniqueness: true, presence: true

  belongs_to :delivery
  belongs_to :shop
  has_many :tracks

  scope :by_create, -> { order(:created_at) }
  scope :existing, -> { where(sold_date: nil) }
  scope :sold_in, -> (from_date, to_date) { where(sold_date: [from_date.to_date.beginning_of_day..to_date.to_date.end_of_day]) }
  scope :with_uid, -> (uid) { where("uid ILIKE ?", "#{uid}%") }
  scope :existing_with_uid, -> (uid) { existing.with_uid(uid) }

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

  private

  def track_it
    tracks.create(shop: shop, price: price, discount: discount)
  end
end
