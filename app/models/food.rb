class Food < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :genre, optional:true

  has_many :favorites, dependent: :destroy
  has_many :food_comments, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def get_food_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  validates :title, presence: true
  validates :menu, presence: true
  validates :genre_id, presence: true
end
