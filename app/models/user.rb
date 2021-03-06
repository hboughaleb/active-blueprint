class User < ApplicationRecord

  has_attachment :photo
  has_many :projects
  # has_many :projects, through: :tasks, as: "projects_as_contributor"
  has_many :projects_as_contributor, through: :tasks, source: :project
  has_many :tasks

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:facebook, :linkedin]

  validates :email, uniqueness: true
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :username, presence: true
  # validates :password, presence: true
  # validates :phone_number, presence: true
  # validates :roles, presence: true

  # def is_ready
  # end

  # def projects_as_contributor
  #   return Project.joins(:tasks).where("tasks.user_id = ?", self.id)
  # end

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end
end
