class Request < ApplicationRecord
    after_create :send_confirmation_email
    validates :first_name, :last_name, :phone_number, :biography, :email, presence: true
    validates :email, uniqueness: true
    enum status: { unconfirmed: 0, confirmed: 1, accepted: 2, expired: 3 }

    scope :unconfirmed, -> { where(status: 0) }
    scope :confirmed, -> { where(status: 1) }
    scope :accepted, -> { where(status: 2) }
    scope :expired, -> { where(status: 3) }

    def accept!
        self.update!(status: 2)  
        if self.save
            RequestMailer.with(request: self).welcome.deliver_now
        end
    end

    

    # private

    def send_confirmation_email
    RequestMailer.with(request: self).confirmation.deliver_now
    end

    def send_waiting_list_entry
    RequestMailer.with(request: self).waitinglist_entry.deliver_now
    end

    def send_reconfirmation_email
    RequestMailer.with(request: self).reconfirmation.deliver_now
    end

    def send_expiration_email
        RequestMailer.with(request: self).expiration.deliver_now
    end

end
