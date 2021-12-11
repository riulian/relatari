class Relatare < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :teme, optional: true
    has_many :calitatis_relatares
    has_many :calitatis, through: :calitatis_relatares
    
end
