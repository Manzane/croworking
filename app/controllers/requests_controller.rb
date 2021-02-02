class RequestsController < ApplicationController
    before_action :set_request, only: [:show, :edit, :update]

    def show
        @total = Request.confirmed.count
        if @request.status != "confirmed"
            redirect_to root_path, flash: { notice: "Vous ne faites pas partie de la liste d'attente" }
        else
            @index = Request.confirmed.order(email_confirmation_date: :desc).pluck(:id).index(@request.id)
        end  
    end

    def new
        @request = Request.new
    end

    def create
        @request = Request.new(request_params)
        if @request.save
            redirect_to thank_you_path, flash: { notice: "Creation" }
        else
            render :new, flash: { error: "Could not create model" }
        end
    end

    def edit
    end

    def update
        @request.update(request_params)
        if  @request.save
            redirect_to request_path(@request), flash: { notice: "Update" }
        else
            render :edit, flash: { error: "Could not update model" }  
        end
    end

    
    # def destroy
    #     @request.destroy
    #     redirect_to requests_path
    # end


    private

    def set_request
      @request = Request.find(params[:id])
    end

    def request_params
        params.require(:request).permit(:first_name, :last_name, :phone_number, :email, :biography)
    end
end
