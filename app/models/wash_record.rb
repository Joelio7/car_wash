class WashRecord < ActiveRecord::Base
  belongs_to :user
  before_save :check_for_customer_discount
  before_save :calculate_tax
  validates :vehicle_type,   :presence => true
  validates :license_plate,  :presence => true
  validates :amount_charged, :presence => true
  validate :validate_license_plate
  validate :truck_bed_validation


  private
  def calculate_tax
    # Thought it would be helpful to add sales tax in Keller Texas
    tax = self.amount_charged * 0.085
    self.amount_charged = (self.amount_charged + tax).round(2)
  end

  def check_for_customer_discount
    # Decided to query existing license plates that have been through our system ONLY once.
    # This assures if the license plate hits the db a second time we will apply the discount to the current transaction.
    records = WashRecord.select(:license_plate).group(:license_plate).having("count(*) = 1").all
    records.each do |record|
      if record.license_plate == self.license_plate
        self.amount_charged = self.amount_charged / 2
      end
    end
  end
  def truck_bed_validation
    if self.vehicle_type == "Truck" && self.bed_down != false
      errors.add(:bed_down, "Must be false to continue")
    end
  end
  def validate_license_plate
    if self.license_plate == "1111111"
      errors.add(:license_plate, " ERROR! Car Is stolen! Please decline customer and call 911")
    end
  end
end
