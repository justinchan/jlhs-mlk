class SchoolMailer < ActionMailer::Base
  default from: "mlk.invitational@gmail.com"

  def receipt(email, school)
  	@school = school
  	mail(:to => email, :subject => "MLK 2014 Receipt")
  end
end
