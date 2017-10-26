class WorkloadsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show, :confirm]
	before_action :set_workload, only: [:show, :edit]

	def update
	end

	def confirm
		chosen_unconfirmed = Workload.unconfirmed.where('date = ?', params[:date])
		TeamDailyWorkload.create(day: params[:date], score: params[:score])
		chosen_unconfirmed.update_all(confirmed: true)

		redirect_to workloads_path
	end

	def index
		@unconfirmed = Workload.unconfirmed
		@workloads = Workload.all
	end

	def show
	end

	def new
		@workload = Workload.new
	end

	def edit

	end

	def create
		@workload = Workload.create(workload_params)
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

		def workload_params
			params.require(:workload).permit(:score, :date, :checkpoint, :confirmed)
		end

		def set_workload
			@workload = Workload.find(params[:id])
		end
end
