class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  validates :first_name,length: { minimum: 2 }, format: { with: /\A(?=.*[a-z])[a-z\d]+\Z/i }
  validates :last_name, length: { minimum: 2 }, format: { with: /\A(?=.*[a-z])[a-z\d]+\Z/i }

  validates_presence_of :first_name,
                        :last_name,
                        :email
end
