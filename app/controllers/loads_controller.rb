class LoadsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :set_load, only: [:show, :edit]

	def index
		@loads = Load.all
		@load_today = Load.where("date >= ?", Time.zone.today) # albo Date.today
		@daily_availability = Load.daily_availability
		@daily_score = @load_today.sum(:score)
		@daily_workload = @daily_score / @daily_availability
		@loads_per_day = Load.all.group(:date)
	end

	def show
	end

	def new
		@load = Load.new
	end

	def edit
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

	def destroy
    unless @load.user == current_user
      flash[:alert] = "You can only delete your own workload."
      redirect_to root_path
    else
      if @load.destroy
        flash[:success] = "Workload has been deleted"
        redirect_to articles_path
      else
        flash.now[:alert] = "You need to sign in or sign up before continuing."
        render :show
      end
    end
	end

	private

		def load_params
			params.require(:load).permit(:score, :date, :checkpoint)
		end

		def set_load
			@load = Load.find(params[:id])
		end
end
