class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :products, dependent: :destroy
	has_many :bids, dependent: :destroy
  has_many :reviews, dependent: :destroy

	validates :email, presence: true, uniqueness: true
end
