class User < ActiveRecord::Base

  has_many :picks

  validates :email, :password, { presence: true }
  validates :email, uniqueness: true
  validate :validate_password

  def password=(plaintext_password)
    @plaintext_password = plaintext_password
    @password = BCrypt::Password.create(plaintext_password)
    self.hashed_password = @password
  end

  def password
    @password ||= BCrypt::Password.new(self.hashed_password)
  end

  def self.authenticate(email, password)
    if user = User.find_by(email: email)
      if user.password == password
        return user
      end
    end
    nil
  end

  private
  def validate_password
    if (@plaintext_password.length == 0)
      @errors.add(:password, "must not be empty.")
    elsif (@plaintext_password.length < 6)
      @errors.add(:password, "must be at least 6 characters long")
    end
  end

end
