class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  validates :first_name,length: { minimum: 2 }, format: { with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/ }
  validates :last_name, length: { minimum: 2 }, format: { with: /\A[a-zA-Z]+\z/ }

  # Regex for alphanumeric, that doesnt begin with a number. Possibly use for username
  # /\A(?=.*[a-z])[a-z\d]+\Z/i

  validates_presence_of :first_name,
                        :last_name,
                        :email

  has_one :app
end
