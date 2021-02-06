class Request < ApplicationRecord
    # after_create :send_confirmation_email
    validates :first_name, :last_name, :phone_number, :biography, :email, presence: true
    validates :email, uniqueness: true
    enum status: { unconfirmed: 0, confirmed: 1, accepted: 2, expired: 3 }

    scope :unconfirmed, -> { where(status: 0) }
    scope :confirmed, -> { where(status: 1) }
    scope :accepted, -> { where(status: 2) }
    scope :expired, -> { where(status: 3) }

    def full_name
        "#{first_name} #{last_name}"
    end

    def accept!
        self.status = 2  
        self.accepted_at = Time.now
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

    def validate_email
        self.email_confirmed = true
        self.confirm_token = nil
        self.status = 1
        self.email_confirmation_date = Time.now
    end

    def set_confirmation_token
        if self.confirm_token.blank?
            self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
    end

end
