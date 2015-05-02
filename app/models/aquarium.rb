class Aquarium < ActiveRecord::Base
  belongs_to :user

  has_many  :chemistries, dependent: :destroy
  has_many  :inhabitants, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :location, presence: true, length: { minimum: 3, maximum: 25 }
  validates :gallons, presence: true, length: { minimum: 1, maximum: 5 }, numericality: { only_integer: true }
  validates :water_type, presence: true, length: { minimum: 3, maximum: 15 }
end
