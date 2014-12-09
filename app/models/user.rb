class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_create :create_remember_token
  # validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  # has_secure_password
  validates :password, length: { minimum: 6 }
  has_many :jobs
  has_many :job_applies, through: :jobs, source: :applies
  has_many :applies
  has_many :reviews


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


  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end


end