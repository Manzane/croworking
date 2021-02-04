class RequestMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.request_mailer.confirmation.subject
  #
  def confirmation
      @request = params[:request] # Instance variable => available in view
      mail(to: @request.email, subject: 'Confirmation de votre adresse')
  end
  def reconfirmation
    @request = params[:request] # Instance variable => available in view
    mail(to: @request.email, subject: 'Confirmez à nouveau votre place!')
end

  def welcome
    @request = params[:request] # Instance variable => available in view
      mail(to: @request.email, subject: 'Bienvenue chez Coworking !')
  end

  def waitinglist_entry
    @request = params[:request] # Instance variable => available in view
    mail(to: @request.email, subject: 'Bienvenue sur la Waiting List !')
  end

  def expiration
    @request = params[:request] # Instance variable => available in view
    mail(to: @request.email, subject: 'Supression de votre demande')
  end
end
