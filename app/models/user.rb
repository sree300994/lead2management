class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :full_name, :email, :mobile, :role_id
  validates_uniqueness_of :full_name, :email
  before_create :save_as_associate

  def save_as_associate
  	role = Role.find_by(name: "salesAssociate").id
  	self.role_id = role
  end
end
