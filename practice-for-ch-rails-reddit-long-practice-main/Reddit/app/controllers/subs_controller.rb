class SubsController < ApplicationController

    before_action :require_signed_in, only: [:edit]

    def index 
        @subs = Subs.all 
    end 

    def show 
        @sub = Subs.find(params[:id])
    end 

    def create
        @sub = Subs.new(sub_params) 
        @sub.author_id = params[:author_id]
         
        flash[:errors] = @sub.errors.full_messages unless @sub.save

        redirect_to users_url(@sub.author_id) 
    end 

    def update 

    end 

    def new
        @sub = Subs.new
    end 

    def edit 

    end 

    private 

    def sub_params
        params.require(:sub).permit(:title, :description)
    end

end
