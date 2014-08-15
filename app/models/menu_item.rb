class MenuItem < ActiveRecord::Base
    validates :title, length: { maximum: 25 }
    validates :price, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0.99, :less_than => 20}
    validates :description, length: { minimum: 1, maximum: 100 }
end
