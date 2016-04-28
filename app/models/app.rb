class App < ActiveRecord::Base
    belongs_to :user

    validates :background_color, length: { is: 7 }
    validates :font_color, length: { is: 7 }

    validates_presence_of :name
end
