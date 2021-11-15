class Relatare < ApplicationRecord
    
    has_many :calitatis_relatares
    has_many :calitatis, through: :calitatis_relatares
    
end
