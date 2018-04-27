class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: { vendor: 0, customer: 1, admin: 2 }
  has_one :vendor, dependent: :destroy
  has_one :customer, dependent: :destroy

  def self.user_roles
    Account.roles.except(:admin)
  end
end
