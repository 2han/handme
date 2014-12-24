class User < ActiveRecord::Base
  devise :database_authenticatable, :omniauthable, :recoverable,
         :registerable, :rememberable, :trackable, :validatable
  before_create :create_remember_token
  # validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  # has_secure_password
  validates :password, length: { minimum: 6 }
  has_many :jobs
  has_many :job_applies, through: :jobs, source: :applies
  has_many :applies

  has_many :reviewing_reviews, class_name: "Review", foreign_key: "reviewed_id", dependent: :destroy
  has_many :reviewings, through: :reviewing_reviews

  has_many :reviewed_reviews, foreign_key: "reviewing_id", class_name: "Review", dependent: :destroy
  has_many :revieweds, through: :reviewed_reviews

  def set_image(file)
      if !file.nil?
        file_name = file.original_filename
        File.open("public/docs/#{file_name}", 'wb'){|f| f.write(file.read)}
        self.image = file_name
      end
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def apply?(job)
    applies.find_by(job_id: job.id)
  end

  def apply!(job)
    applies.create!(job_id: job.id)
  end

  def unapply!(job)
    applies.find_by(job_id: job.id).destroy
  end

  def reviewing?(other_user)
    reviewing_reviews.find_by(reviewing_id: other_user.id)
  end

  def review!(other_user)
    reviewing_reviews.create!(reviewing_id: other_user.id)
  end

# 通常サインアップ時のuid用、Twitter OAuth認証時のemail用にuuidな文字列を生成
  def self.create_unique_string
    SecureRandom.uuid
  end

def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name:     auth.extra.raw_info.name,
                         provider: auth.provider,
                         uid:      auth.uid,
                         email:    auth.info.email,
                         password: Devise.friendly_token[0,20],
                         image:    auth.info.image,
                         gender:   auth.extra.raw_info.gender,
                         birthday: auth.extra.raw_info.birthday
                        )
    end
    user
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end


end