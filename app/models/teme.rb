class Teme < ApplicationRecord
    belongs_to :user
    has_many :relatares
end
