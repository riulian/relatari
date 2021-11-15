class Calitati < ApplicationRecord
    has_many :calitatis_relatares
    has_many :relatares, through: :calitatis_relatares
 end
