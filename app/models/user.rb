class User < ApplicationRecord
  after_create :create_stripe_customer
  

  

  def create_stripe_customer
    customer = Stripe::Customer.create({
      email: self.email,
    })
    self.stripe_customer_id = customer.id
    self.save
    end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
    scope :all_except, ->(user) { where.not(id: user) }
     after_create_commit { broadcast_append_to 'users' }
      has_many :messages 

  end