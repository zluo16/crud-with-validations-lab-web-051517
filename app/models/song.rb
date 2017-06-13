class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :genre, presence: true
  validates :released, inclusion: { in:[true, false] }
  with_options if: :released? do |released|
    released.validates :release_year, presence: true
    released.validates :release_year, numericality: { less_than_or_equal_to: Time.current.year }
  end

  def released?
    released
  end

end
