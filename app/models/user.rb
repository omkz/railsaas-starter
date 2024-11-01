class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_validation :create_stripe_reference, on: :create

  validates :email, uniqueness: { case_sensitive: false }
  validates :stripe_id, presence: true, uniqueness: true

  def create_stripe_reference
    response = Stripe::Customer.create(email: email)
    self.stripe_id = response.id
  end

  def retrieve_stripe_reference
    Stripe::Customer.retrieve(stripe_id)
  end
end
