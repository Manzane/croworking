class RequestMailer < ApplicationMailer

  def confirmation
      @request = params[:request]
      mail(to: @request.email, subject: 'Confirmation de votre adresse')
  end
  def reconfirmation
    @request = params[:request]
    @total = Request.confirmed.count
    @expiration_date = 1.week.from_now
    @index = Request.confirmed.order(email_confirmation_date: :asc).pluck(:id).index(@request.id) + 1
    mail(to: @request.email, subject: 'Confirmez à nouveau votre demande!')
end

  def welcome
    @request = params[:request]
    @renewable_date = 1.month.from_now
      mail(to: @request.email, subject: 'Bienvenue chez S\'pace Coworking !')
  end

  def waitinglist_entry
    @request = params[:request]
    @total = Request.confirmed.count
    @index = Request.confirmed.order(email_confirmation_date: :asc).pluck(:id).index(@request.id) + 1
    mail(to: @request.email, subject: 'Bienvenue sur la liste d\'attente S\'pace Coworking !')
  end

  def expiration
    @request = params[:request]
    mail(to: @request.email, subject: 'Supression de votre demande')
  end
end
