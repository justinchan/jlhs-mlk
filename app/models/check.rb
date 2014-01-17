class Check < Payment
  attr_accessible :bank, :check_number
  validates :bank, presence: true
  validates :check_number, presence: :true
end
