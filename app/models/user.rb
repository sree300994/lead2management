class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  has_many :prospects, foreign_key: :managed_by
  has_many :customers, foreign_key: :managed_by
  validates_presence_of :full_name, :mobile
  validates_uniqueness_of :full_name, :email
  before_create :save_as_associate

  def save_as_associate
  	role = Role.find_by(name: "salesAssociate").id
  	self.role_id = role
  end

  def role?(role)
    self.role.name.include? role
  end
end
