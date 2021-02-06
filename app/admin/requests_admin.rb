Trestle.resource(:requests) do
  remove_action :destroy, :new
  menu do
    item :requests, icon: "fa fa-star"
  end

  scopes do
    scope :total, -> { Request.all }, label: 'Total des demandes', default: true

    scope :unconfirmed, -> { Request.unconfirmed }, label: 'Demandes non confirmées'
    scope :confirmed, -> { Request.confirmed }, label: 'Demandes confirmées'
    scope :accepted, -> { Request.accepted }, label: 'Demandes acceptées'
    scope :expired, -> { Request.expired }, label: 'Demandes expirées'
  end

  table do
    column :email
    column :full_name
    column :phone_number
    column :biography
    column :status
    column :created_at, sort: { default_order: :desc }
    column :email_confirmation_date
    column :reconfirmation_date
    column :accepted_at

    actions do |toolbar, instance, admin|
      toolbar.link 'Accepter', instance, action: :accept, method: :post, style: :primary, icon: "fa fa-thumbs-up", label: 'Accept' if instance.confirmed?
    end
  end

  controller do
    def accept
      request = Request.find(params[:id])
      if request.accept!
        flash[:message] = "la demande de #{request.first_name} #{request.last_name} a été acceptée, un email de confirmation lui a été envoyé"
        redirect_to requests_admin_index_path(scope: 'accepted')
      else
        flash[:message] = "Une erreur s'est produite, la demande n'est pas acceptée"
        redirect_to requests_admin_index_path(scope: 'total')  
      end
    end
  end

  routes do
    post :accept, on: :member
  end

end
