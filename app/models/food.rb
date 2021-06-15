class Food < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :ways
    validates :type_of_food_id, numericality:{other_than: 1}
  end
  belogs_to :user
  has_one_attached :image

  extend ActiveHash::Association::ActiveRecordExtensions
  belongs_to :type_of_food
end
