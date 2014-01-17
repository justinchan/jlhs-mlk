class DashboardController < ApplicationController
	before_filter :authenticate_user!

	def index
		if !request.xhr?
			@unregistered_schools = School.find_all_by_done(false, :order => 'name')
			@registered_schools = School.find_all_by_done(true, :order => 'name')
		end
	end



	def admin
		@schools = School.all(:order => 'name')
	end

	def register_school
		param_id = params[:id]
		school_to_register = School.find_by_id(param_id)
		school_to_register.done = true
		school_to_register.user = current_user
		school_to_register.save
		flash[:notice] = "School registered."
		redirect_to dashboard_path
	end

	def unregister_school
		param_id = params[:id]
		school_to_register = School.find_by_id(param_id)
		school_to_register.done = false
		school_to_register.user = nil
		school_to_register.save
		flash[:notice] = "School unregistered."
		redirect_to dashboard_path
	end

	def post_phone_number
		param_id = params[:id]
		school_to_edit = School.find_by_id(param_id)
		input = params[:post_phone_number]
		phone_number = input[:phone_number]
		school_to_edit.phone_number = phone_number
		if school_to_edit.save
			flash[:notice] = "Added phone number."
		else 
			flash[:error] = "Incorrect format for phone number."
		end
		redirect_to edit_school_path(param_id)
	end

	def post_email
		param_id = params[:id]
		school_to_email = School.find_by_id(param_id)
		input = params[:post_email]
		email = input[:email]
		SchoolMailer.receipt(email, school_to_email).deliver
		flash[:notice] = "School emailed."
		redirect_to edit_school_path(param_id)
	end

	def post_school
		input = params[:post_school]
		name = input[:name]
		coach = input[:coach]
		amount_due = BigDecimal.new(input[:amount_due]).round(2)
		school = School.create(:name => name, :coach => coach, :amount_due => amount_due)
		school.save
		flash[:notice] = "Added school."
		redirect_to admin_path
	end

	def delete_school
		param_id = params[:id]
		school_to_delete = School.find_by_id(param_id)
		school_to_delete.destroy
		flash[:error] = "Deleted school."
		redirect_to admin_path
	end 

	def edit_school
		param_id = params[:id]
		@school_to_edit = School.find_by_id(param_id)
		@check_or_cash = ['Check', 'Cash']
	end

	def post_payment
		param_id = params[:id]
		school_to_edit = School.find_by_id(param_id)
		input = params[:post_payment]
		type = input[:type]
		amount = BigDecimal.new(input[:amount]).round(2)
		if type == "Check"
			check_number = input[:check_number]
			bank = input[:bank]
			payment = Check.create(:amount => amount, :bank => bank, :check_number => check_number)
		else #Cash, duh
			payment = Cash.create(:amount => amount)
		end
		payment.school = school_to_edit
		if payment.save
			flash[:notice] = "Added payment."
		else
			flash[:error] = "You're missing the bank or check number."
		end
		redirect_to edit_school_path(param_id)
	end

	def delete_payment
		school_id = params[:school_id]
		payment_id = params[:payment_id]
		payment_to_delete = Payment.find_by_id(payment_id)
		payment_to_delete.delete
		flash[:error] = "Deleted payment."
		redirect_to edit_school_path(school_id)
	end

	def delete_payment_modification
		school_id = params[:school_id]
		payment_mod_id = params[:payment_mod_id]
		payment_mod_to_delete = PaymentModification.find_by_id(payment_mod_id)
		payment_mod_to_delete.delete
		flash[:error] = "Deleted fee modification."
		redirect_to edit_school_path(school_id)
	end

	def post_payment_mod
		param_id = params[:id]
		school_to_edit = School.find_by_id(param_id)
		input = params[:post_payment_mod]
		reason = input[:reason]
		amount_change = BigDecimal.new(input[:amount_change]).round(2)
		payment_mod = PaymentModification.create(:reason => reason, :amount_change => amount_change)
		payment_mod.school = school_to_edit
		payment_mod.save
		flash[:notice] = "Added payment modification."
		redirect_to edit_school_path(param_id)
	end

	def delete_payment_mod

	end


end
