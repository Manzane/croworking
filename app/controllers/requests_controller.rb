class RequestsController < ApplicationController
    before_action :set_request, only: [:show, :edit, :update]

    def show
        @total = Request.confirmed.count
        if @request.status != "confirmed"
            redirect_to root_path, flash: { notice: "Vous ne faites pas partie de la liste d'attente" }
        else
            @index = Request.confirmed.order(email_confirmation_date: :asc).pluck(:id).index(@request.id) + 1
        end  
    end

    def new
        @request = Request.new
    end

    def create
        @request = Request.new(request_params)
        if @request.save
            @request.set_confirmation_token
            @request.save         
            @request.send_confirmation_email
            redirect_to thank_you_path, flash: { success: "creation" }
        else
            render :new, flash: { error: "Could not create model" }
        end
    end

    def edit
    end

    def update
        @request.update(request_params)
        if  @request.save
            redirect_to request_path(@request), flash: { success: "Update" }
        else
            render :edit, flash: { error: "Could not update model" }  
        end
    end

    def confirm_email
        request = Request.find_by_confirm_token(params[:token])
        if request
           request.validate_email
           if request.save
                request.send_waiting_list_entry
                redirect_to request
            else
                flash[:error] = "Désolé, si cette erreur persiste, merci de nous contacter!"
            end
        else
           flash[:error] = "Désolé, la demande n'existe pas !"
           redirect_to root_url
       end
    end

    def reconfirm_email
        request = Request.find_by_confirm_token(params[:token])
        if request
           request.update(reconfirmation_date: Time.now)
           if request.save
                # request.send_reconfirmation_email
                redirect_to request
            else
                flash[:error] = "Désolé, si cette erreur persiste, merci de nous contacter!"
            end
        else
           flash[:error] = "Désolé, la demande n'existe pas !"
           redirect_to root_url
       end
    end


    private

    def set_request
      @request = Request.find(params[:id])
    end

    def request_params
        params.require(:request).permit(:first_name, :last_name, :phone_number, :email, :biography)
    end
end
