class Food < ApplicationRecord
  validates :image,   presence:{message: "ファイルを添付してください"}
  with_options presence: true do
    validates :name
    validates :ways
    validates :type_of_food_id, numericality:{other_than: 1, message: "を選んでください"}
    validates :ingredients
  end
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :type_of_food

end
