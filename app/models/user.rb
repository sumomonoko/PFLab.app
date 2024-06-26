class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  has_many :foods, dependent: :destroy
  has_many :favorites, dependent: :destroy
   has_many :food_comments, dependent: :destroy

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/nc209714.jpg')
      image.attach(io: File.open(file_path), filename: 'nc209714.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  validates :name, presence: true
  validates :email, presence: true

  def self.looks(word)
    if word.present?
      @user = User.where("name LIKE?","%#{word}%")
    else
      @user = User.all
    end
  end
end
