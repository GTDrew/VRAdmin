class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  validates :first_name,
            length: { minimum: 2 },
            format: { with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/ },
            presence: true

  validates :last_name,
            length: { minimum: 2 },
            format: { with: /\A[a-zA-Z]+\z/ },
            presence: true

  validates :email, presence: true

  has_one :app
end
