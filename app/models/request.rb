class Request < ApplicationRecord
    validates :first_name, :last_name, :phone_number, :biography, :email, presence: true
    validates :email, uniqueness: true
    enum status: { unconfirmed: 0, confirmed: 1, accepted: 2, expired: 3 }

    scope :unconfirmed, -> { where(status: 0) }
    scope :confirmed, -> { where(status: 1) }
    scope :accepted, -> { where(status: 2) }
    scope :expired, -> { where(status: 3) }

    def accept
    end
    # request.accept! - method that will allow accepting a request (request being an instance of the class Request)
    # list the requests by their status using class methods or scopes
    # Request.unconfirmed - requests for which the email address has not been confirmed
    # Request.confirmed - requests in the waiting list
    # Request.accepted - requests that have been accepted by the client
    # Request.expired
end
