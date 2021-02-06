class RequestsController < ApplicationController
    before_action :set_request, only: [:confirm_email, :reconfirm_email]

    def new
        @request = Request.new
    end

    def create
        @request = Request.new(request_params)
        if @request.save
            @request.set_confirmation_token
            @request.save         
            @request.send_confirmation_email
            redirect_to thank_you_path
        else
            render :new, flash: { error: "Une erreur s'est produite, la demande n'a pas été envoyée" }
        end
    end

    def confirm_email
        if @request
           @request.validate_email
           if @request.save
                @request.send_waiting_list_entry
                redirect_to waiting_list_path
            else
                flash[:error] = "Désolé, si cette erreur persiste, merci de nous contacter!"
            end
        else
           flash[:error] = "Désolé, la demande n'existe pas !"
           redirect_to root_url
       end
    end

    def reconfirm_email
        if @request
           @request.update(reconfirmation_date: Time.now)
           if @request.save
                redirect_to waiting_list_path
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
      @request = Request.find_by_confirm_token(params[:token])
    end

    def request_params
        params.require(:request).permit(:first_name, :last_name, :phone_number, :email, :biography)
    end
end
