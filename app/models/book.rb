class Book < ApplicationRecord
    belongs_to :user



    # validates :title, {
    #   length: { minimum: 5, maximum: 20 },
    #   presence: true
    # }
  
    # validates :description, {
    #   length: { minimum: 20 },
    #   presence: true
    # }
  
    # validates :status, {
    #   numericality: { in: 0..3 }
    # }
  
    # validates :priority, {
    #   numericality: { in: 0..2 }
    # }
  
end
