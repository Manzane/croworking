class RequestsController < ApplicationController
    before_action :set_request, only: [:show, :edit, :update]

    def show
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
