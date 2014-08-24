class CyborgsController < ApplicationController
	def index
		@cyborgs = Cyborg.all
	end

	def new
		@cyborg = Cyborg.new
	end

	def create
		@cyborg = Cyborg.new(params[:cyborg])
		if @cyborg.save
			redirect_to @cyborg , notice: "Successfully Added Employee"
		else
			render :action => 'new'
		end
	end

	def show
		@cyborg = Cyborg.find(params[:id])
	end

	def edit
		@cyborg = Cyborg.find(params[:id])
	end

	def update
		@cyborg = Cyborg.find(params[:id])
		if @cyborg.update(cyborg_params)
			redirect_to @cyborg
		else
			render 'edit'
		end
	end

	def cyborg_params
		params.require(:cyborg).permit(:name, :email)
	end

	def destroy
		@cyborg = Cyborg.find(params[:id])
		@cyborg.destroy
		redirect_to cyborgs_path
	end

end
