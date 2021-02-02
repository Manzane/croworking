class Request < ApplicationRecord
    validates :first_name, :last_name, :phone_number, :biography, :email, presence: true
    validates :email, uniqueness: true
    enum status: { unconfirmed: 0, confirmed: 1, accepted: 2, expired: 3 }

    scope :unconfirmed, -> { where(status: 0) }
    scope :confirmed, -> { where(status: 1) }
    scope :accepted, -> { where(status: 2) }
    scope :expired, -> { where(status: 3) }

    def accept!
        self.update!(status: 2)  
    end

end
