class Reservation < ApplicationRecord
  belongs_to :listing
  validates :start_date, presence: true
  validates :end_date, presence: true

  after_create_commit :checkout_checkin

  private

  def checkout_checkin
    
  end
end
