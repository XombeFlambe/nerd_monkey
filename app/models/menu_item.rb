class MenuItem < ActiveRecord::Base
    validates :title, length: { maximum: 5 }
    validates :price, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0, :less_than => 10}
    validates :description, length: { minimum: 5, maximum: 20 }
end
