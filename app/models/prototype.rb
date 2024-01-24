class Prototype < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :string, presence: true
  validates :text, presence: true
  validates :image, presence: true
end