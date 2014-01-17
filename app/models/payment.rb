class Payment < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :amount
  belongs_to :school
end
