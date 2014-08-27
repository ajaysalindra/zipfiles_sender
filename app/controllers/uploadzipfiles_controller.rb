class UploadzipfilesController < ApplicationController
	def index
		@uploadzipfiles = Uploadzipfile.all
		
	end

	def new
		@uploadzipfile = Uploadzipfile.new
		
	end

	def create
		@uploadzipfile = Uploadzipfile.new(params[:uploadzipfile])
		if @uploadzipfile.save
			redirect_to @uploadzipfile, notice: "Successfully Added Zip File "
		else
			render :action => 'new'
		end
	end

	def show
		@uploadzipfile = Uploadzipfile.find(params[:id])
		@cyborgs = Cyborg.all

	end

	def sendpayslips
		@uploadzipfile = Uploadzipfile.find(params[:id])
		mails = params.require(:mail).permit!
		mails.each do |index, hash|
			if hash[:employee].present?
				employee = Cyborg.find(hash[:employee])  
			    Zipmailer.payslip(@uploadzipfile, hash[:file], employee).deliver
			end
			
		end
		redirect_to root_path, notice: "Successfully sent email"
	end

	def destroy
		@uploadzipfile = Uploadzipfile.find(params[:id])
		@uploadzipfile.destroy
		redirect_to root_path
	end

end
