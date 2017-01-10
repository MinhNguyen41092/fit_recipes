class Review < ActiveRecord::Base
  belongs_to :chef
  belongs_to :recipe
  has_many :likes, dependent: :destroy
  validates :chef_id, presence: true
  validates :recipe_id, presence: true
  validates :name, presence: true, length: { minimum: 5, maximum: 100 }
  validates :body, presence: true, length: { minimum: 20, maximum: 500 }
end