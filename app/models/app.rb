class App < ActiveRecord::Base
    belongs_to :owner, :class_name => "User", :foreign_key => "user_id"

    has_many :videos

    validates :background_color, length: { is: 7 }
    validates :font_color, length: { is: 7 }

    validates_presence_of :name
end
