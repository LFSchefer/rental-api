class Booking < ApplicationRecord
  belongs_to :listing
  validates :start_date, presence: true
  validates :end_date, presence: true
  after_create_commit :first_checkin, :last_checkout

  private

  def first_checkin
    listing.missions.create!(
      listing_id: listing.id,
      mission_type: :first_checkin,
      date: ":start_date",
      price: 10 * listing.num_rooms
    )
  end

  def last_checkout
    listing.missions.create!(
      listing_id: listing.id,
      mission_type: :last_checkout,
      date: ":end_date",
      price: 5 * listing.num_rooms
    )
  end

end
