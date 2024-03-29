# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  
  attr_accessor :password
  attr_accessible :name, :username, :email, :password, :password_confirmation, :image, :remote_image_url

  #has_many :bookmarks
  has_and_belongs_to_many :bookmarks
  
  #has_many :bookmarkusers
  #has_many :bookmarks, :through => :bookmarkusers
  #accepts_nested_attributes_for :bookmarkusers, :allow_destroy => true
  
  mount_uploader :image, ImageUploader
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   
  validates :name,  :presence => true,
                    :length   => { :within => 2...75}
  validates_uniqueness_of :username
  validates :email, :presence => true, :format   => { :with => email_regex }
  
  # Automatically create the virtual attribute 'password_confirmation'.
  validates :password, :presence     => true,
                       :confirmation => true,
                       :length       => { :within => 6..40 }
                       
before_save :encrypt_password

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end

  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end
  
  def self.urlcount
    @urlcount = Bookmark.count(:group => :url,
    :conditions => "url IS NOT NULL AND url != ''")

    
  end
  
  private

    def encrypt_password
      self.salt = make_salt unless has_password?(password)
      self.encrypted_password = encrypt(password)
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
   
end
