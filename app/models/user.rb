class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
  :recoverable, :rememberable, :trackable, :validatable

  include DeviseTokenAuth::Concerns::User

  rolify

  before_validation :assign_uid

  after_create :assign_role
  after_create :assign_generated_password

  has_one :collaborator  
  has_one :physical_customer

    

  validates :email, presence: true, uniqueness: true

  def assign_role
    self.add_role(:basic) if self.roles.blank?
  end

  def assign_uid
    self.uid = self.email if self.uid.blank?
  end

  def assign_generated_password
    if self.encrypted_password.blank?
      self.generated_password = SecureRandom.hex
      self.password = self.generated_password
    end
  end
end