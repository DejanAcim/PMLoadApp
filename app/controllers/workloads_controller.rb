class WorkloadsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :set_load, only: [:show, :edit]

	def index
		@workloads = Workload.all
		@workload_today = Workload.where("date >= ?", Time.zone.today) # albo Date.today
		@daily_availability = Workload.daily_availability
		@daily_score = @workload_today.sum(:score)
		@daily_workload = @daily_score / @daily_availability
		@workloads_per_day = Workload.all.group(:date)
	end

	def chart
	end

	def show
	end

	def new
		@workload = Workload.new
	end

	def edit
	end

	def create
		@workload = Workload.create(load_params)
		@workload.user = current_user

		if @workload.save
    	flash[:notice] = "Your load has been noted"
    	redirect_to root_path
    else
      flash.now[:alert] = "Nope. Something's wrong. Please try again."
      render :new
    end
	end

	def destroy
    unless @workload.user == current_user
      flash[:alert] = "You can only delete your own workload."
      redirect_to root_path
    else
      if @workload.destroy
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
			@workload = Workload.find(params[:id])
		end
end
