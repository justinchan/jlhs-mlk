class PaymentModification < ActiveRecord::Base
  attr_accessible :reason, :amount_change
  belongs_to :school
end
