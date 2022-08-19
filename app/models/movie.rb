class Movie < ApplicationRecord
  has_many :bookmarks
  # before_destroy :check_for_orders

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :overview, presence: true

  private

  def check_for_orders
    if bookmarks.count > 0
      return false
    end
  end

end
