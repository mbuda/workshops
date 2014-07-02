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

  def firstname=(firstname)
    @firstname = firstname
  end

  def lastname
    @lastname
  end

  def lastname=(lastname)
    @lastname=lastname
  end

  def admin?
  end
end
