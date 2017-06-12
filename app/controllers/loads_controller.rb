class LoadsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@loads = Load.all
	end

	def show
	end

	def new
		@load = Load.new
	end

	def create
		@load = Load.create(load_params)
		@load.user = current_user

		if @load.save
    	flash[:notice] = "Your load has been noted"
    	redirect_to root_path
    else
      flash.now[:alert] = "Nope. Something's wrong. Please try again."
      render :new
    end
	end

	private

		def load_params
			params.require(:load).permit(:score, :date, :checkpoint)
		end
end
