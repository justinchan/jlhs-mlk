class School < ActiveRecord::Base
  attr_accessible :coach, :name, :amount_due, :original_amount_due, :done
  has_one :user
  has_many :payment_modifications, :dependent => :destroy
  has_many :payments, :dependent => :destroy

  def has_payment_modification
    if payment_modifications == []
      return "No"
    else
      return "Yes"
    end
  end

  def mod_amount_due
    counter = amount_due
    payment_modifications.each do |pay_mod|
      counter += pay_mod.amount_change
    end
    return counter
  end

  def amount_paid
    counter = BigDecimal.new(0)
    payments.each do |payment|
      counter += payment.amount
    end
    return counter
  end
end
