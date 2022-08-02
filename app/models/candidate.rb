class Candidate < ApplicationRecord
    enum :user_type, [:admin, :candidate], default: :candidate
    validates :name, :presence => true
    validates :email, :presence => true
    validates :password, :presence => true
end
