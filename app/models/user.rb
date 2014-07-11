class User < ActiveRecord::Base
  validates_presence_of :firstname, :lastname
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews
  has_many :products

  def firstname
    @firstname
  end

  def self.firstname=(name)
    @firstname = name
  end

  def firstname=(name)
    @firstname = name
  end

  def lastname
    @lastname
  end

  def self.lastname=(name)
    @lastname = name
  end

  def lastname=(name)
    @lastname = name
  end

  def admin?
    @admin
  end

  def self.admin=(bool)
    @admin = bool
  end

  def admin=(bool)
    @admin = bool
  end
end
