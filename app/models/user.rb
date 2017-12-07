class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :avatar, styles: { medium: "300x300>", middle: "230x230>", thumb: "100x100>" }, default_url: "/assets/default.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates :username,
  :presence => true,
  :uniqueness => {
    :case_sensitive => false
  }
  validate :validate_username
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  has_many :questions
  has_many :blogs, dependent: :destroy

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end


def login=(login)
  @login = login
end

def login
  @login || self.username || self.email
end

def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      elsif conditions.has_key?(:username) || conditions.has_key?(:email)
        where(conditions.to_hash).first
      end
    end
end
